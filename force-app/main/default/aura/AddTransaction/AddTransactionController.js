({
	doInit : function(component, event, helper) {
		
         helper.getNTransactions(component, event, helper);
      
	},
     handleTransactionForm:function(component,event,helper){
        var TransactionForm = component.find('TransactionForm');
        $A.util.toggleClass(TransactionForm,'hide');
        
    },
    addTransaction:function(component, event, helper) {
		 helper.addTransactions(component, event, helper);
	},
    handleAmountComponentEvent:function(component, event, helper) {
        alert('Event handler at the parent component');
		// Getting the value of totalIncome attribute of event using event.getParam()
		var totalAmount = event.getParam('totalAmount');
        console.log('amount:'+totalAmount);
        component.set('v.totalAmount',totalAmount);
    }
   
})