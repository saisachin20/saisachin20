public class ContactUpdateWeeklySchedule implements Schedulable {
    
    public void execute(SchedulableContext sc)
    {
        // Make a call to Batch APEX 
        ContactUpdateBatch obj = new ContactUpdateBatch();
		Database.executeBatch(obj, 1000); // 1000 is the batch size
    }

}