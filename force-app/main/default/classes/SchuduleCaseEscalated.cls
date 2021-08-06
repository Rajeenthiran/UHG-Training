global  class SchuduleCaseEscalated implements Schedulable{
 global void execute(SchedulableContext ctx) {
     try{
         //Initalize CaseController class
         CaseController sc=new CaseController();
         // call update CaseEscalated method
         Map<String,String> s=sc.updateCaseEscalated();
         
         if(s.get('msg')=='success'){
              Task tsk1=new Task();
         		tsk1.ActivityDate=Date.today();
         		tsk1.ReminderDateTime=Date.today();
         		tsk1.Subject=s.get('name')+' Case Escalated'; 
                tsk1.IsReminderSet=true;
         		tsk1.OwnerId=UserInfo.getUserId();
                // tsk1.OwnerId=app[0].CreatedById;
         		Database.DMLOptions notifyOption = new Database.DMLOptions();
		 		notifyOption.EmailHeader.triggerUserEmail = true;   
         		insert tsk1;
                // database.insert(tsk1,notifyOption);
         		System.debug(tsk1); 
         }else{
             System.debug('There are no new and more than one day complaints');
         }
     }catch(Exception e){
           
         System.debug('error'+e);
        }
    }
}