trigger TriggerSendEmail on Contact (after insert) {
    HandlerSendEmail obj= new HandlerSendEmail();
    if(trigger.isInsert && trigger.isAfter){
        obj.sendEmail(trigger.new);    
    }
  
}