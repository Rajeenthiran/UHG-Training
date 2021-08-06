({
	doInit : function(component, event, helper) {
		component.set('v.myTransaction', [
            {label: 'Transaction Id', fieldName: 'Name', type: 'String'},
            {label: 'Amount', fieldName: 'Amount__c', type: 'number'},
            {label: 'Transaction Date', fieldName: 'Transaction_Date__c', type: 'date'}
        ]);
        
	},
    handleAmountComponentEvent: function(component, event, helper) {
        alert('Event is Fired');
    },
    totalAmount:function(component, event, helper) {
        var trasaction=component.get('v.Transaction');
        var totalAmount=0;
        for(var i=0;i<trasaction.length;i++){
            if(trasaction[i].Amount__c!=undefined && trasaction[i].Amount__c!=null&& trasaction[i].Amount__c!=''){
                 totalAmount=totalAmount+trasaction[i].Amount__c;
                 
            }
          
        }
        var totalAmountComponentEvent = component.getEvent('totalAmountComponentEvent');
		// Setting the attribute of event using setParams()
		totalAmountComponentEvent.setParams({
			totalAmount: totalAmount
		});
		// Firing the event
		totalAmountComponentEvent.fire();
       
    }
})