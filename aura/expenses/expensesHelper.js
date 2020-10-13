({
    createExpense: function(component, expense) {
        var theExpenses = component.get("v.expenses");
        // Copy the expense to a new object
        // THIS IS A DISGUSTING, TEMPORARY HACK
        console.log("Create expense1: " + expense);
        var newExpense = JSON.parse(JSON.stringify(expense));
        console.log("Create expense: " + newExpense);
        theExpenses.push(newExpense);
        component.set("v.expenses", theExpenses);
    }
})