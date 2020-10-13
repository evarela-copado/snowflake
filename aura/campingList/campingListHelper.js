({
	/*createItem : function(component, campingItem) {
        console.log('------1');
	 var action = component.get("c.saveItem");
        action.setParams({
            "campingItem":campingItem  
     });console.log('------2');
        action.setCallback(this, function(response){
        var state = response.getState();
        if (state === "SUCCESS") {
            var expenses = component.get("v.items");
            expenses.push(response.getReturnValue());
            component.set("v.items", expenses);
        }
    });console.log('------3');
        $A.enqueueAction(action);
	}*/
    handleAddItem : function(component, Item, callback) {
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
	}
})