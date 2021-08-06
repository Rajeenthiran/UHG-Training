({
	addTransactions : function(component, event, helper) {
        var myTransaction = component.get("v.myNewTransaction");
		var addTransactionAction = component.get('c.addNewTransaction');
        console.log(addTransactionAction);
        addTransactionAction.setParams({
            newTransaction:myTransaction
        });
         addTransactionAction.setCallback(this,function(response){
           var state = response.getState();
             console.log(state);
             if(state==='SUCCESS'){
            		component.set('v.error',null);
                    component.set('v.success','Transaction  Succesfully');
                }else{
                     component.set('v.success',null);
                  	 component.set('v.error',"Transaction Faild"); 
                }
           
             
         });
         $A.enqueueAction(addTransactionAction);
        
	},
    getNTransactions : function(component, event, helper) {
        var getTransactionAction = component.get('c.getTranscation');
        getTransactionAction.setCallback(this,function(response){
           var state = response.getState();
             
             if(state==='SUCCESS'){
                 var transactionList=response.getReturnValue();
                 console.log('list:'+transactionList.length);
                 component.set('v.myTransaction',transactionList);
                }else{
                     
                }
           
             
         });
         $A.enqueueAction(getTransactionAction);
        
    }
})