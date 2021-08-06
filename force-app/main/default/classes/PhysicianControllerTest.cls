@isTest
public class PhysicianControllerTest {
  @isTest static  void insertPhysicianTest() {
      	// initalize physyican controller for call insert method
      PhysicianController phys=new PhysicianController();
        Test.startTest();
         Map<String,String> phyObject1=new Map<String,String>();
              phyObject1.put('phyname','JOHN');
              phyObject1.put('gender','M');
              phyObject1.put('pid','123');
              phyObject1.put('address','STREET');
              phyObject1.put('city','COLOMBO');
              phyObject1.put('state','GFGFG');
              phyObject1.put('zip','FG');
              phyObject1.put('country','GF');
          Map<String,String> phyObject2=new Map<String,String>();
              phyObject2.put('phyname','JOR');
              phyObject2.put('gender','F');
              phyObject2.put('pid','1234');
              phyObject2.put('address','STREET');
              phyObject2.put('city','COLOMBO');
              phyObject2.put('state','GFGFG');
              phyObject2.put('zip','FG');
              phyObject2.put('country','GF');
       Map<String,String> phyObject3=new Map<String,String>();
              phyObject3.put('phyname','JOHN');
              phyObject3.put('gender','M');
              phyObject3.put('pid','123');
              phyObject3.put('address','STREET');
              phyObject1.put('city','COLOMBO');
              phyObject3.put('state','GFGFG');
              phyObject3.put('zip','FG');
              phyObject3.put('country','GF');
         Map<String,String> msg1=PhysicianController.insertPhysician(phyObject1);
         Map<String,String> msg3=PhysicianController.insertPhysician(phyObject2);
         Map<String,String> msg2=PhysicianController.insertPhysician(phyObject3);
         System.assertEquals('success',msg1.get('status'),
          'Success.');
         System.assertEquals('success',msg3.get('status'),
          'Success.');
          System.assertEquals('error',msg2.get('status'),
          'error.');
         Test.stopTest();
    }
     @isTest static  void getPhysicianTest() {
         Test.startTest();
         List<Object> results=PhysicianController.getPhysician('john');
         System.assertNotEquals(null, results,
          'No items here.'); 
         System.debug('results:'+results);
         System.assertEquals(100, results.size(),
          'The array should only contain 100 items.');  
          Test.stopTest();
    }
   
}