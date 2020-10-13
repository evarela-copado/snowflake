({doInit: function(component, event, helper) {
    console.log('11');
    var action = component.get("c.getItems");
    action.setCallback(this, function(response) {
        var state = response.getState();
        if (component.isValid() && state === "SUCCESS") {
            component.set("v.items", response.getReturnValue());
        }
        else {  console.log("Failed with state: " + state);  }
    });
    $A.enqueueAction(action);
},
  handleAddItem : function(component, event, helper) {
      console.log('-----------inside handleAddItem');
      var Item = event.getParam("Item");
        var action = component.get("c.saveItem");
        action.setParams({
            "Item": Item
    	});
    //if (callback) {
        //action.setCallback(this, callback);
        action.setCallback(this, function(response){
        var state = response.getState();
        if (state === "SUCCESS") {
            var items = component.get("v.items");
            items.push(response.getReturnValue());
            component.set("v.items", items);
        }
    });
    //}
    $A.enqueueAction(action);
      //helper.handleAdditem(component, Item);
  }
    /*clickCreateItem : function(component, event, helper) {
    var validCamping = component.find('campingform').reduce(function (validSoFar, inputCmp) {
            // Displays error messages for invalid fields
            inputCmp.showHelpMessageIfInvalid();
            return validSoFar && inputCmp.get('v.validity').valid;
        }, true);
            
        if(validCamping){
            var newCampingItem = component.get("v.newItem");
            helper.createItem (component,newCampingItem);
            var campings = component.get("v.items");
            var item = JSON.parse(JSON.stringify(newCampingItem));
            
            campings.push(item);
            
            //component.set("v.items",campings);
            component.set("v.newItem",{ 'sobjectType': 'Camping_Item__c','Name': '','Quantity__c': 0,
                                       'Price__c': 0,'Packed__c': false });
        }
    }*/
})