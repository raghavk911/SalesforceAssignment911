({
    press : function(component, event, helper) {
    var buttonName = event.getSource().get("v.name");
    // Get the component event by using the name value from aura:registerEvent
    var cmpEvent = component.getEvent("DisplayValueEvent");
    cmpEvent.setParams({"message" : buttonName });
    cmpEvent.fire();

    var cmpEvent = component.getEvent("DisplayValue");
    cmpEvent.setParams({"messageDisplay" : buttonName });
  }
})