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
    
    @isTest static void getPhysicianNewTest(){
          // Create the mock response based on a static resource
        StaticResourceCalloutMock mock = new StaticResourceCalloutMock();
        mock.setStaticResource('GetPhysicianResource');
        mock.setStatusCode(200);
        mock.setHeader('Content-Type', 'application/json;charset=UTF-8');
        // Associate the callout with a mock response
        Test.setMock(HttpCalloutMock.class, mock);
        
        
         List<Object> results1=PhysicianController.getPhysician('john');
         List<Object> results2=PhysicianController.getPhysician('545');
         System.assertEquals(null, results1,'No items here.'); 
         System.assertEquals(10, results1.size(),
          'The array should only contain 10 items.'); 
          System.assertEquals(null, results2,
          'There are items here.'); 
         System.assertEquals(0, results2.size(),
          'The array should only contain 0 items.');
        
        
        PhysicianCallouts phyCall=new PhysicianCallouts();
        // Call method to test 
        HttpResponse result = phyCall.searchPhysician('peter');
        // Verify mock response is not null
        System.assertNotEquals(null,result,
            'The callout returned a null response.');
      
        // Verify status code
        System.assertEquals(200,result.getStatusCode(),
          'The status code is not 200.');
        // Verify content type   
        System.assertEquals('application/json;charset=UTF-8',
          result.getHeader('Content-Type'),
          'The content type value is not expected.');  
        // Verify the array contains 10 items     
        Map<String, Object> results = (Map<String, Object>) 
            JSON.deserializeUntyped(result.getBody());
        List<Object> physicians = (List<Object>) results.get('results');
        System.assertEquals(10, physicians.size(),
          'The array should only contain 10 items.');  
    }
   
}