public class PhysicianCallouts {
 public HttpResponse searchPhysician(String firstname){
     try{
        Http http = new Http();
        HttpRequest request = new HttpRequest();
        request.setTimeout(120000); 
     	// calouts Named Credentials here
        request.setEndpoint('callout:NPIRegistery/api/?version=2.1&first_name='+firstname+'&limit=100');
     	// set method is GET
        request.setMethod('GET');
        request.setHeader('Content-Type', 'application/json;charset=UTF-8');
        HttpResponse response = http.send(request);
        // If the request is successful, parse the JSON response.
        return response;
     }catch(Exception e){
        
         System.debug('exception:'+e);
         return null;
     }
       
    }
}