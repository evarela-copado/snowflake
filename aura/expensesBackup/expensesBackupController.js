({
    doInit: function(component, event, helper) {
    var action = component.get("c.getExpenses");
    action.setCallback(this, function(response) {
        var state = response.getState();
        if (state === "SUCCESS") {
            component.set("v.expenses", response.getReturnValue());
        }
        else {
            console.log("Failed with state: " + state);
        }
    });
    $A.enqueueAction(action);
},
    handleUpdateExpense: function(component, event, helper) {
        console.log('-----1');
    	var updatedExp = event.getParam("expense");
		helper.updateExpense(component, updatedExp);
	},
    handleCreateExpense: function(component, event, helper) {
        var newExpense = event.getParam("expense");
        helper.createExpense(component, newExpense);
    },
})