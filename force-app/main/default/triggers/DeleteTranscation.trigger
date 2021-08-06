trigger DeleteTranscation on Transcation__c (before delete) {
	for(Transcation__c myOpps : Trigger.old) {
		if(myOpps.Status__c=='Completed') {
			myOpps.addError('You are not allowed to delete Completed Transcation');
	}
	}
}