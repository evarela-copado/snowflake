trigger BatchApexErrorTrigger on BatchApexErrorEvent (after insert) {
	List<BatchLeadConvertErrors__c> ss = new List<BatchLeadConvertErrors__c>();
    for (BatchApexErrorEvent bt : Trigger.New) {
        BatchLeadConvertErrors__c bts = new BatchLeadConvertErrors__c ();
        bts.AsyncApexJobId__c   = bt.AsyncApexJobId;
        bts.Records__c = bt.JobScope ;
        bts.StackTrace__c = bt.StackTrace;
        ss.add(bts);
    }
    if (!ss.isEmpty()) {
        upDATE ss;
    }
}