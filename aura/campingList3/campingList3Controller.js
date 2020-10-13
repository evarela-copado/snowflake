({
	clickCreateItem : function(component, event, helper) {
        var validFields = component.find('campForm').reduce(funcation (validSoFar, inputCmp){
          inputCmp.showHelpMessageIfInvalid();
          return validFields && inputCmp.get('v.validity').valid;
         }, true) {
    		if (validFields) {
    			var camp = component.get('v.campForm');
                var newCamp = JSON.parse(JSON.stringify(camp));
    			var camps = component.get('v.items');
    			camps.pust(newCamp);
    			
    			component.set('v.items', camps);
			}
        }
	}
})