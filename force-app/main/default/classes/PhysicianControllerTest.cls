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
    
    @isTest static void getPhysicianCalloutTest(){
          // Create the mock response based on a static resource
        Test.startTest(); 
        StaticResourceCalloutMock mock = new StaticResourceCalloutMock();
        mock.setStaticResource('GetPhysicianResource');
        mock.setStatusCode(200);
        mock.setHeader('Content-Type', 'application/json;charset=UTF-8');
        // Associate the callout with a mock response
        Test.setMock(HttpCalloutMock.class, mock);
        List<Object> results1=PhysicianController.getPhysician('peter');
        System.assertNotEquals(null, results1,
          'There are items here.'); 
         System.assertEquals(10, results1.size(),
          'The array should only contain 10 items.'); 
        Test.stopTest();
         
        
       
    }
    @isTest static void getPhysicianTest(){
         Test.startTest(); 
        List<Object> results2=PhysicianController.getPhysician('545');
           System.assertEquals(null, results2,
          'There are items here.'); 
         List<Object> results3=PhysicianController.getPhysician('par');
           System.assertEquals(null, results3,
          'There are items here.'); 
         Test.stopTest();
    }
    @isTest static void getPhysicianCalloutErrorTest(){
         Test.startTest(); 
        StaticResourceCalloutMock mock = new StaticResourceCalloutMock();
        mock.setStaticResource('GetPhysicianResource');
        mock.setStatusCode(400);
        mock.setHeader('Content-Type', 'application/json;charset=UTF-8');
        // Associate the callout with a mock response
        Test.setMock(HttpCalloutMock.class, mock);
        List<Object> results1=PhysicianController.getPhysician('peter');
        System.assertEquals(null, results1,
          'There are items here.'); 
        Test.stopTest();
    }
     @isTest static void getPhysicianCalloutNoErrorTest(){
         Test.startTest(); 
        StaticResourceCalloutMock mock = new StaticResourceCalloutMock();
        mock.setStaticResource('GetPhysicianResource');
        mock.setStatusCode(300);
        mock.setHeader('Content-Type', 'application/json;charset=UTF-8');
        // Associate the callout with a mock response
        Test.setMock(HttpCalloutMock.class, mock);
        List<Object> results1=PhysicianController.getPhysician('peter');
        System.assertEquals(null, results1,
          'There are items here.'); 
        Test.stopTest();
    }
   
}