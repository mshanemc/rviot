({
    reset : function(component, event, helper) {
        var action = component.get("c.fullReset");
        action.setCallback(this, function(a){
            var state = a.getState();
            if (state === "SUCCESS") {
                console.log(a);
                $A.get("e.force:showToast").setParams({"type" : "success", "message" : "Demo Reset!"}).fire();
            } else if (state === "ERROR") {
                console.log(a.getError());
            }
        });
        $A.enqueueAction(action);
    },

    allClear : function(component, event, helper) {
        var action = component.get("c.allComponentsSendOK");
        action.setCallback(this, function (a) {
            var state = a.getState();
            if (state === "SUCCESS") {
                console.log(a);
                $A.get("e.force:showToast").setParams({"type" : "success", "message" : "All devices sent an OK event"}).fire();
            } else if (state === "ERROR") {
                console.log(a.getError());
            }
        });
        $A.enqueueAction(action);
    },
})
