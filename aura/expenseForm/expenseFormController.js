({  
    createExpense: function(component, newExpense) {
        console.log("createEvent: ");
        var createEvent = component.getEvent("createExpense");
        createEvent.setParams({ "expense": newExpense });
        console.log("createEvent: ");
        createEvent.fire();
	},
    clickCreate : function(component, event, helper) {
        console.log('----inputCmp');
        var validExpense = component.find('expenseform').reduce(function (validSoFar , inputCmp) {
            inputCmp.showHelpMessageIfInvalid();
            console.log('----inputCmp'+inputCmp.get('v.value'));
            return validSoFar && inputCmp.get('v.validity').valid;
        },true);
        if (validExpense) {
           console.log('----2');
           var newExpense = component.get('v.newExpense'); 
           console.log("Create expense: " + JSON.stringify(newExpense));
           //createExpense(component, newExpense);
           console.log("createEvent: ");
           var createEvent = component.getEvent("createExpense");
           createEvent.setParams({ "expense": newExpense });
           console.log("createEvent: ");
           createEvent.fire();
        }
	},
	
})