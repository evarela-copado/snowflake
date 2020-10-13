trigger AccountCBTrigger on Account (after insert) {
System.debug('----------');
    Set<Id> newAccIds = new Set<Id>();
    Set<Id> updateAccIds = new Set<Id>();
    for (Account objAcc : Trigger.New) {
        if (objAcc.CB_Account_ID__c != null) {
            updateAccIds.add(objAcc.Id);
        } else {
            newAccIds.add(objAcc.Id);
        }
    }
    if (!newAccIds.isEmpty()) {
       ManageCBAccount.createNewAccount(newAccIds); 
    }
    if (!updateAccIds.isEmpty()) {
        ManageCBAccount.activateAccount(newAccIds); 
    }
}