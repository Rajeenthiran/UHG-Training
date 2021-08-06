trigger CaseTrigger on Case (before insert,before update,after update,before delete) {
    if(Trigger.isUpdate && Trigger.isAfter){
       
        for(Case cs:Trigger.new){
           if(Trigger.oldMap.get(cs.Id).Status=='New' && cs.Status=='Working'){
                cs.Description='Date:'+date.today();
                
            }   
        }    
    }
}