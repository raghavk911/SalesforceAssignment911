({
    press : function(component, event, helper) {
    var buttonName = event.getSource().get("v.name");
    console.log('buttonName=='+buttonName);
    // Get the component event by using the
    // name value from aura:registerEvent
    var cmpEvent = component.getEvent("DisplayVaueEvent");
    cmpEvent.setParams({"message" : buttonName });
    cmpEvent.fire();

    var cmpEvent = component.getEvent("DisplayVaue");
    cmpEvent.setParams({"messageDisplay" : buttonName });
    console.log('in press button event');
  }
})