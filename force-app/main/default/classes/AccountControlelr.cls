public class AccountControlelr {
   @AuraEnabled
    public static List<Account> getAccount(){
        return [SELECT Id,Name from Account];
    }
}