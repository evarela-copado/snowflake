public class ApplicationStatus {

    public PageReference save() {
       String leadId = ApexPages.currentPage().getParameters().get('id');
       if (textEmail != null && leadId != null) {
          Lead objLead = [Select Id,Email, Status from Lead where Id =:leadId];
          if (objLead.Email == textEmail) {
            status = objLead.Status;
          }
       }
       return null;
    }
   
    public String textEmail {get;set;}
    public String status {get;set;}
}