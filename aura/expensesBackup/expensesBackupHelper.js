({
	createExpense: function(component, expense) {
     console.log('-----3');    
    this.saveExpense(component, expense, function(response){
        var state = response.getState();
        if (state === "SUCCESS") {
            var expenses = component.get("v.expenses");
            expenses.push(response.getReturnValue());
            component.set("v.expenses", expenses);
        }
      });
    },
    updateExpense: function(component, expense) {
       console.log('-----2');
      this.saveExpense(component, expense);
	},
    saveExpense: function(component, expense, callback) {
     console.log('-----3');    
    var action = component.get("c.saveExpense");
    action.setParams({
        "expense": expense
    });
    if (callback) {
        action.setCallback(this, callback);
    }
    $A.enqueueAction(action);
    },
})