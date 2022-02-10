public class APEXProgramming {
    
    // decalring a class variable
    Integer evennumber = 6; 
    Decimal pi = 3.14;
    String name = 'APEX Programming';
    
    // Method
    // Print the numbers 
    public void showNumbers()
    {
        System.debug('I will print whatever is ' + 'given to me on the logs !!!');
        System.debug('The value of evenunumbet is ::' + evennumber);
        System.debug('The value of pi is ::' + pi);
        
    }
    
    
    public void InsertNewContact()
    {
        Contact oCon = new Contact(); // Creates a new contact from contact blue print
        oCon.LastName = 'A';
        oCon.FirstName = 'Mukesh';
        
        insert oCon; // Create a new contact            
        
    }
    
    public void InsertNewContactWithNameAndEmail(String LName, String Email)
    {
        Contact oCon = new Contact(); // Creates a new contact from contact blue print
        oCon.LastName = 'A';
        oCon.FirstName = LName;
        oCon.Email = Email;
        
        insert oCon; // Create a new contact with the name & email provided as parameters 
        
        System.debug('New Contact has been created with the Id ::' + oCon.Id);
    }
    
    public void UpdateContactWithAccount(Id AccId, Id ContactId)
    {
        //Contact ID : 0035j00000IGZQUAA5
        //Account Id: 0015j00000DWh9SAAT
        
        // Step 1: Find the contact or get the contact from DB
        // Step 2: Attach or Map account to the contact
        // Step 3: Run DB update & commit the data
        
        string name = 'Rajesh';       
        Contact con = [SELECT ID, Name FROM Contact WHERE ID =: ContactId];
        
        con.AccountId = AccId;
        
         // Option 1:
        //update con; 
        
        // Option 2:
        Database.update(con,false);
        
        
        System.debug('Contact has been mapped to account!!!');
        
        
    }
    
   /* public void UpdateContactWithAccountV1(String AccName, String ContactName)
    {
         Contact con = [SELECT ID, Name FROM Contact WHERE FirstName like: ContactName];
         
         System.debug('Contact retrieved !!! - Name is ' + con.FirstName);
        

    }*/
    
    public string CreateNewLead(string companyName, string leadLastName)
    {
        try
        {
            Lead olead = new Lead(); // Creates a new lead from contact blue print
            olead.Company = companyName;
            olead.LastName = leadLastName;
            
            insert olead; // Create a new lead with the name & email provided as parameters 
            insert olead;
            
            System.debug('New lead has been created with the Id ::' + lead.Id);
            
                       
            return 'Lead has been created with an id: ' + + lead.Id;
            
        }
        catch(Exception e)
        {
            return 'Unable to insert a new lead !!!';
        }
    }
    
    public void ListCollectionExample()
    {
        List<Integer> oevenNumbers = new List<Integer>();
        oevenNumbers.add(2);
        oevenNumbers.add(4);
        oevenNumbers.add(6);
        oevenNumbers.add(8);
        
        //Print the values in Integer collection
        System.debug('Value of  oevenNumbers::' + oevenNumbers);
        
        List<String> oweekDays = new List<String>();
        oweekDays.add('Monday');
        oweekDays.add('Tuesday');
        oweekDays.add('Thursday');
        oweekDays.add('Friday');
        
         //Print the values in String collection
        System.debug('Value of  oweekDays::' + oweekDays);
        
        // Print the size of the collection
        System.debug('Print the size of the collection::' + oweekDays.size());
        
        //Print weekday #2
        System.debug('Print weekday #2::' + oweekDays[1]);
        
        List<String> oweekend = new List<String>{'Saturday','Sunday'};
        //Print the values in String collection
        System.debug('Value of  oweekend::' + oweekend);
        
        // Single Lead
        Lead olead = [SELECT Id, LastName FROM Lead LIMIT 1];
        System.debug('Print lead::' + olead);
        
        //Lead collection
        List<Lead> oleads = [SELECT Id, LastName FROM Lead LIMIT 20];
        System.debug('Print lead collection::' + oleads);
        
        
    }
    
    public void SetCollectionExample()
    {
        //Set<Integer> oevenNumbers = new Set<Integer>{2,4,6,8,8,8,8};
        Set<Integer> oevenNumbers = new Set<Integer>();
        oevenNumbers.add(2);
        oevenNumbers.add(4);
        oevenNumbers.add(6);
        oevenNumbers.add(8); // Set will remove duplicates by default. No addional programming is needed
        oevenNumbers.add(8);
        oevenNumbers.add(8);
        oevenNumbers.add(8);
        oevenNumbers.add(8);
        
        //Print the values in Integer collection
        System.debug('Value of  oevenNumbers::' + oevenNumbers);
        
        
        
    }
    
    public void MapCollectionExample()
    {
        Map<Integer,String> oveg = new Map<Integer,String>();
        oveg.put(10, 'Onions');
        oveg.put(20, 'Beans');
        oveg.put(30, 'Apple');
        oveg.put(40, 'Orange');
        
        // Get me orange
        System.debug('Accessing orange::' + oveg.get(40)); 
        
        //check if key 10 is onion or not
         System.debug('Checking if key 10 is onion or not or present in the collection::' + oveg.containsKey(10)); 
        
        
    }
    
    public void GovernorLimitsV1() // Limit DML
    {
        
        // Insert leads of count 250
        for(Integer i=1; i<250; i++)
        {
            Lead olead = new Lead(); // Creates a new lead from contact blue print
            olead.Company = 'Governor Limit Company';
            olead.LastName = 'Test Lead' + i;
            
            insert olead; // Create a new lead with the name & email provided as parameters 
        }
        
    }
    
      public void GovernorLimitsV1_Solution() // Limit DML
    {
        
        List<lead> leadsList = new List<lead>(); // Introduced a collection
        
        // Insert leads of count 250
        for(Integer i=1; i<250; i++)
        {
            Lead olead = new Lead(); // Creates a new lead from contact blue print
            olead.Company = 'Governor Limit Company';
            olead.LastName = 'Test Lead' + i;
            
            leadsList.add(olead); // collection all leads to be inserted
            
        }
        insert leadsList; // Create a new lead with collection by issuing one simple single insert statment
        
    }
    
    public void GovernorLimitsV2() // Limit SOQL
    {
        
        // Insert leads of count 250
        for(Integer i=1; i<200; i++)
        {
            Lead olead = [SELECT Id, LastName FROM Lead LIMIT 1];
        }
        
    }
    
    /*public class input
        {
            Integer evennumber;
            String weekDays;
        }
        
    input obj1  = new input();
    obj1.evennumber = 2;
    obj1.weekdays = 'Monday';
    
    input obj2  = new input();
    obj2.evennumber = 4;
    obj2.weekdays = 'Tuesday';
    
    
    List<input> oinput = new List<input> {obj1, obj2};*/
    
    
    
    
    
    
    

}