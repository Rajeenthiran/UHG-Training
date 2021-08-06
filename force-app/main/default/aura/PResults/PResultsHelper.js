({
	 insertPhysicians: function(component, event, helper) {
        
    var physician = component.get("v.phy");
  	 var actions = component.get("c.insertPhysician");
         var phyObject={
            phyname:physician.basic.name,
        	gender:physician.basic.gender,
       		pid:physician.number,
        	mobile:physician.addresses[0].telephone_number,
        	address:physician.addresses[0].address_1,
        	city:physician.addresses[0].city,
        	state:physician.addresses[0].state,
        	zip:physician.addresses[0].postal_code,
        	country:physician.addresses[0].country_name
         };      
    actions.setParams({
        phyObject:phyObject
        });
    actions.setCallback(this,function(response){
           var state = response.getState();
            if(state==='SUCCESS'){
             var dataMap = response.getReturnValue();
             console.log(dataMap.status);
                if(dataMap.status=='success'){
                    component.set('v.error',null);
                    component.set('v.success','Physician Added Succesfully');
                }else{
                     component.set('v.success',null);
                   component.set('v.error',"Physician Already Added"); 
                }
             console.log(dataMap.message);
            }else{
                console.log('not load');
            }
        }); 
        $A.enqueueAction(actions);
    }
})