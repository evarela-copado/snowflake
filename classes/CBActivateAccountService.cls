@RestResource(urlMapping='/activateAccount/*')
global with sharing class CBActivateAccountService {
     @HttpPost
    global static String activateAccount(String sfdcId) {
        Account account = new Account();
        account.Salesforce_Id__c  = sfdcId;
        account.Active__c = 'true';
        try {
        	update account;
            return 'sucess';
        } Catch (Exception ex) {
            return ex.getMessage();
        }
    }
}