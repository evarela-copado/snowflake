@isTest
private class TestApplicationStatus {
	@testSetup
    static void methodName () {
    	Lead objLead = new Lead(FirstName = 'Test',LastName = 'Lname', email = 'test@gmail.com', phone='701-540-5857',company='Test', Status='Qualified');
        insert objLead;
        Lead objLeadConvert = new Lead(FirstName = 'Test2',LastName = 'Lname2', email = 'test2@gmail.com', phone='711-540-5857',company='Test', Status='Account Created');
        insert objLeadConvert;
        
        Database.LeadConvert lc = new Database.LeadConvert();
        lc.setConvertedStatus('Account Created');

        lc.setLeadId(objLeadConvert.id);
        Database.LeadConvertResult lcr = Database.convertLead(lc);
        
        Lead objLead3 = new Lead(FirstName = 'Test3',LastName = 'Lname3', email = 'test10@gmail.com', phone='741-540-5857',company='Test3', Status='Account Created', CB_Account_ID__c ='Test123');
        insert objLead3;
        
        lc.setLeadId(objLead3.id);
        lcr = Database.convertLead(lc);
        Account aa = new Account(Name = 'Tets', CB_Account_ID__c ='Test');
        insert aa;
    }
    static testMethod void testApplicationStatusCon() {
       Lead objLead = [Select Id from Lead where email='test@gmail.com' limit 1];
       ApexPages.currentPage().getParameters().put('id', String.valueOf(objLead.Id));
	   ApplicationStatus cls = new ApplicationStatus();
       cls.textEmail = 'test@gmail.com';
       cls.save(); 
       System.assertEquals('Qualified',cls.status);
    }
    static testMethod void testLeadToAccount() {
       Lead objLeadConvert = [Select Id from Lead where email='test2@gmail.com' limit 1];
       //Account objAccount = [SelecT Id from Account Where Converted_Lead_Id__c =: objLeadConvert.Id];
    }
}