@RestResource(urlMapping='/createAccount/*')
global with sharing class CBCreateAccountService {
  @HttpPost
    global static String createAccount(String name, String sfdcId) {
        System.debug('------EP');
        Account account = new Account();
        account.Name = name;
        account.Active__c  = 'true';
        account.Salesforce_Id__c = sfdcId;    
        insert account;
        return account.Id;
    }
}