public without sharing class CaseController {
    public  Map<String,String> updateCaseEscalated(){
        String msg='error';
        Map<String,String> result=new Map<String,String>();
        try{
            List<Case> oldCase=[SELECT CaseNumber,Created_Date__c,Status FROM Case];
        if(oldCase.size()>0){
            for(Case c:oldCase){
                if(c.Status=='New'&&c.Created_Date__c.addDays(1)<date.today()){
                    c.Status='Escalated';
                     update c;
                    result.put('msg','success');
                    result.put('name',c.CaseNumber);
                }
                  
            }            
        }
        }catch(Exception e){
             result.put('msg','error');
            result.put('name',null);
            System.debug('error'+e);
        }
     return result;
    }
}