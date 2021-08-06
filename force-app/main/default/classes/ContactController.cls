public with sharing class ContactController {
    public ContactController() {

    }
    @AuraEnabled
    public static List<Contact> getContacts(){
        try {
            return [SELECT Id FROM Contact];
            
        } catch (Exception e) {
            throw new AuraHandledException(e.getMessage());
        }
    }
    
}