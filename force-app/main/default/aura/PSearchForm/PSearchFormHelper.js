({
	getPhysicians : function(component, event, helper) {
       
		var physicianName = component.get("v.phName");
       
        if(physicianName!=undefined || physicianName!=null){
             
         var actions = component.get("c.getPhysician");
        actions.setParams({
            name:physicianName
        });
        actions.setCallback(this,function(response){
            var state=response.getState();
            if(state==='SUCCESS'){
               
                var physicianList=response.getReturnValue();
                if(physicianList!=null){
                    component.set('v.error',null);
                     component.set('v.physicians',physicianList);
                }else{
                     component.set('v.physicians',null);
                      component.set('v.error',"There are no physician with  "+physicianName+" Name ?");
                }
               
                console.log(physicianList);
                
            }else{
                console.log('not load');
            }
        });
        $A.enqueueAction(actions);
        }else{
             component.set('v.physicians',null);
            component.set('v.error',"Please Enter Physician Name!");
        }
       
        
	},
   
})