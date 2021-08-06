@isTest
private class PhysiciansCalloutsTest {
@isTest static  void testGetCallout() {
         // Create the mock response based on a static resource
        StaticResourceCalloutMock mock = new StaticResourceCalloutMock();
        mock.setStaticResource('GetPhysicianResource');
        mock.setStatusCode(200);
        mock.setHeader('Content-Type', 'application/json;charset=UTF-8');
        // Associate the callout with a mock response
        //Test.setMock(HttpCalloutMock.class, mock);
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