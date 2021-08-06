public class InsertPhysicianHelper {
    public static Physician__c insertPhysicianHelper(Map<String,String> phyObject){
         Physician__c phy=new Physician__c();      
         phy.Name=phyObject.get('phyname');
		String gender=phyObject.get('gender');        
        if(gender=='M'){
            phy.Gender__c='Male';
        }else{
             phy.Gender__c='Female';
        }
        phy.Physician_ID__c=phyObject.get('pid');
        phy.Physician_Speciality__c='CARDIOLIST';
        phy.Street__c=phyObject.get('address');
        phy.City__c = phyObject.get('city');
        phy.State__c=phyObject.get('state');
        phy.Zip__c= phyObject.get('zip');                                                       
        phy.Country__c=phyObject.get('country');
        phy.Email__c='superrajee10@gmail.com';                                                
        return phy;                                                
    }
}