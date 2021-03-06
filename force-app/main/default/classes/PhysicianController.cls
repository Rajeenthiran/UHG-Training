public with sharing class PhysicianController {
    // Get Physician Method
 	@AuraEnabled
    public static List<Object> getPhysician(String name){
        try{
             // Initalize PhysicianCallouts Class
        PhysicianCallouts physicianCall=new PhysicianCallouts();
        // Call Search Physician Method
        HttpResponse response=physicianCall.searchPhysician(name);
        if(response.getStatusCode()==200){
           // Get Resutls and Map to object get from string 
           Map<String,Object> physician=(Map<String,Object>) JSON.deserializeUntyped(response.getBody());
           List<Object> results = (List<Object>) physician.get('results');
           List<Object> returnResults=null;
           Integer result_count=(Integer) physician.get('result_count');
          //  result count is 10 only but governer limits 100  so no care about governer limits
            if(result_count>0){
                // return physyicans
                returnResults= results;
            }
            return returnResults;
        }else if(response.getStatusCode()==400){
            System.debug('The request couldn’t be understood, usually because the JSON or XML body contains an error.');
            return null;
        }else if(response.getStatusCode()==404){
            System.debug('The server has not found anything matching the URI given');
            return null;
        }
        else{
            // Print get error response and return null
              System.debug('Error:'+response.getStatusCode());
            	return null;
        }
        }catch(Exception e){
            
            System.debug('error:'+e);
            return null;
        }
       
    }
    // UPSERT PHYSICIAN METHOD
    @AuraEnabled
    public static Map<String,String> insertPhysician(Map<String,String> phyObject){
        // Initalize Physician Object
        Physician__c phy=new Physician__c();
        // Return Message Map                                                 
        Map<String,String> resultMap = new Map<String,String>();
        // Helper class for add physician details                                                
		 phy=InsertPhysicianHelper.insertPhysicianHelper(phyObject);                                              
        try {
           // UPSERT PHYSICIAN 
           upsert phy;
           System.debug('success'); 
           // SUCCESS MESAAGE STATUS 
           resultMap.put('status', 'success');
           resultMap.put('message', 'Physcican Added Successfully');  
        }  catch(Exception e) {
              System.debug('error'); 
            // ERROR MESAAGE STATUS 
            resultMap.put('status', 'error');
            resultMap.put('message',e.getMessage());
        }
        // return message                                                
        return resultMap;
    }
    @AuraEnabled
    public static List<Physician__c> getPhysicianListNew(){
      return [SELECT Id,Name,Gender__c,Country__c,City__c FROM Physician__c];
    }
}