({
	handleApplicationEvent : function(component, event, helper) {
		var message = event.getParam("messageDisplay");
		component.set("v.label", message);
	}
})