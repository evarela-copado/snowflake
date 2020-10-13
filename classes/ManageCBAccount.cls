global class ManageCBAccount {
   @future
    public static void createNewAccount(set<Id> accSetId) {
       List<Account> listAccount = new List<Account>();
       List<Lead> listLead = new List<Lead>(); 
       //Account acc = [Select Id, Converted_Lead_Id__c  from Account WHERE Id=:accSetId];
       for (Account acc :[Select Id, Converted_Lead_Id__c  from Account WHERE Id=:accSetId]) {
            acc.CB_Account_ID__c = 'DemoAccount123';
           acc.Status__c = 'Live';
           Lead objLead = new Lead();
           objLead.Id = acc.Converted_Lead_Id__c;
           objLead.State = 'Account Created'; 
           listLead.add(objLead); 
           listAccount.add(acc); 
       }
        if (!listAccount.isEmpty()){ 
       	  update listAccount;
        }
        
    }
    @future
    public static void activateAccount(set<Id> accSetId)
    {  
       List<Account> listAccount = new List<Account>();
       List<Lead> listLead = new List<Lead>();
       for (Account acc :[Select Id, Converted_Lead_Id__c  from Account WHERE Id=:accSetId]) {
        acc.Status__c = 'Live';
        Lead objLead = new Lead();
        objLead.Id = acc.Converted_Lead_Id__c;
        objLead.State = 'Account Created'; 
        listLead.add(objLead);
        listAccount.add(acc);    
       }
        if (!listAccount.isEmpty()){ 
       	  update listAccount;
        }
        
    }
}