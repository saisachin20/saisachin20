// Converting a simple APEX class into Batch APEX by Implements Database.Batchable<sObject>
public class ContactUpdateBatch Implements Database.Batchable<sObject>
{

    // Think about batch start method as a loop that can process records of size 
    // minimum 200 to maximum 2000
    public Database.QueryLocator start(Database.BatchableContext bc)
    {        
        string query = 'SELECT ID,Name FROM Contact';
        return Database.getQueryLocator(query);
    }
    
    public void execute(Database.BatchableContext bc, List<Contact> contactstobeUpdated)
    {
        for(Contact con: contactstobeUpdated)
        {
            con.Contact_Status__c = 'Inactive';
            update con;
        }
    }
    
    public void finish(Database.BatchableContext bc)
    {
        // Send email to the admin saying batch apex has been completed
    }
}