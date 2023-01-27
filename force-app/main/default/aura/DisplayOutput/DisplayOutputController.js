({
	handleApplicationEvent : function(component, event, helper) {
		 var message = event.getParam("messageDisplay");// event attribute name

        // set the handler attributes based on event data
        component.set("v.label", message);

	}
})