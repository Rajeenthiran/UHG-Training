public class test1 {
    public static void testnw(){
         Transcation__c tr1 = [SELECT Id,Branch__c,Branch__r.Name FROM Transcation__c WHERE Id='a055g0000010L9LAAU'];
         System.debug('tr1:'+tr1.Branch__c);
         System.debug('tr2:'+tr1.Branch__r.Name);
         
         
    }
}