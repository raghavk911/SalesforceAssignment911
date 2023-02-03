/**
 * @triggername             :   TriggerSendEmail
 * @author                  :   Raghavendra Kadam 
 * @date                    :   22-01-2023
 * @description             :   This is Trigger of TriggerSendEmail Handler class 
 *
 * @modification log
 * 1. Raghavendra Kadam     :   31-01-2023  Updated the code intentation
 * 2. Raghavendra Kadam     :   01-02-2023  Added Code Comments
 * 3. Raghavendra Kadam     :   03-02-2023  Corrected Code Comments
*/
trigger TriggerSendEmail on Contact (after insert) {
  HandlerSendEmail obj= new HandlerSendEmail();
  if(trigger.isInsert && trigger.isAfter){
    obj.sendEmail(trigger.new);
  }
}