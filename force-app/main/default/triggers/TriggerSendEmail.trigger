/*
* @triggername    TriggerSendEmail
* @author         Raghav
* @date           22-01-2023
* @description    This is Trigger of TriggerSendEmail 
*
* @modification log
* 1. Raghav        31-01-2023  Update the code intentation
* 2. Raghav        01-02-2023  Add Code Comments
*/
trigger TriggerSendEmail on Contact (after insert) {
  HandlerSendEmail obj= new HandlerSendEmail();
  if(trigger.isInsert && trigger.isAfter){
    obj.sendEmail(trigger.new);
  }
}