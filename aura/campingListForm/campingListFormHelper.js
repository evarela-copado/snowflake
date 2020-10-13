({
	createItem : function(component, campingItem) {
        console.log('----get3');
      var handleAddEvent = component.getEvent("addItem");
      handleAddEvent.setParams({ Item : campingItem});
      handleAddEvent.fire();
      component.set("v.newItem",{ 'sobjectType': 'Camping_Item__c','Name': '','Quantity__c': 0,
                                      'Price__c': 0,'Packed__c': false });
	}
})