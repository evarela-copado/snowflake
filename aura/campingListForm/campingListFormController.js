({
	clickCreateItem : function(component, event, helper) {
    var validCamping = component.find('campingform').reduce(function (validSoFar, inputCmp) {
            // Displays error messages for invalid fields
            inputCmp.showHelpMessageIfInvalid();
            return validSoFar && inputCmp.get('v.validity').valid;
        }, true);
            
        if(validCamping){
            var newCampingItem = component.get("v.newItem");
            console.log('----get2');
            helper.createItem (component,newCampingItem);
            //var handleAddEvent = component.getEvent("handleAddItem");
            //handleAddEvent.setParams({ newItem : newCampingItem});
            //handleAddEvent.fire();
            //component.set("v.items",campings);
            //component.set("v.newItem",{ 'sobjectType': 'Camping_Item__c','Name': '','Quantity__c': 0,
                                      // 'Price__c': 0,'Packed__c': false });
        }
    }
})