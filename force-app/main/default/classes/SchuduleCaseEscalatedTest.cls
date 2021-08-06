@isTest
public class SchuduleCaseEscalatedTest {
    //Case Escalated Test
    public static String CRON_EXP = '0 0 0 15 3 ? 2022';
    static testmethod void testScheduledJob() {
         Test.startTest();
        // Schedule the test job
        String jobId = System.schedule('ScheduledApexTest',
            CRON_EXP,
            new SchuduleCaseEscalated());
        // Verify the scheduled job has not run yet.
        List<Task> ts=[SELECT Id FROM Task];
        System.assertEquals(0, ts.size(), 'Tasks created');

      
        // Stopping the test will run the job synchronously
        Test.stopTest();
    }
}