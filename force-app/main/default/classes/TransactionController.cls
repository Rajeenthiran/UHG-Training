public class TransactionController {
    @AuraEnabled
    public static List<Transcation__c> getTranscation(){
        try{
            return [SELECT Id,Name,Amount_Status__c,Status__c,Transaction_Date__c,Amount__c FROM Transcation__c];
        }catch(Exception er){
            throw new AuraHandledException(er.getMessage());
        }
    }
    
    @AuraEnabled
    public static String addNewTransaction(Transcation__c newTransaction){
        try{
            System.debug('transaction:'+newTransaction);
            insert newTransaction;
            return 'Success';
        }catch(Exception er){
            System.debug('error:'+er);
            throw new AuraHandledException(er.getMessage());
           
        }
    }
}