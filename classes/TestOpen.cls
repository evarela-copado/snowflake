public class TestOpen {
 
    public void test() {
        fflib_SObjectUnitOfWork uow =
    new fflib_SObjectUnitOfWork( 
        new Schema.SObjectType[] { 
            Product2.SObjectType, 
            PricebookEntry.SObjectType, 
            Opportunity.SObjectType, 
            OpportunityLineItem.SObjectType });
        for(Integer o=0; o<2; o++) {
            Opportunity opp = new Opportunity();
            opp.Name = 'UoW Test Name ' + o;
    		opp.StageName = 'Open';
    		opp.CloseDate = System.today();
        	uow.registerNew(opp);
            for(Integer p=0; p<2; p++) {
                Product2 product = new Product2();
      			product.Name = opp.Name + ' : Product : ' + p;
      			uow.registerNew(product);
                
                PricebookEntry pbe = new PricebookEntry();
                pbe.UnitPrice = 10;
                pbe.IsActive = true;
                pbe.UseStandardPrice = false;
                pbe.Pricebook2Id = '01sf4000001Xkf5AAC';
                
                uow.registerNew(pbe, PricebookEntry.Product2Id, product);
                
                OpportunityLineItem oppLineItem = new OpportunityLineItem();
      			oppLineItem.Quantity = 1;
      			oppLineItem.TotalPrice = 10;
      			uow.registerRelationship(oppLineItem, OpportunityLineItem.PricebookEntryId, pbe);
                
                uow.registerNew(oppLineItem, OpportunityLineItem.OpportunityId, opp);
            }
        }
        uow.commitWork();
    }
    
    //TestOpen cls = new TestOpen();
//cls.test();
    
}