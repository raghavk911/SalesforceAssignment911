/*
* @triggername    ContactTriggerCheckedUnchecked
* @author         Raghav
* @date           22-01-2023
* @description    This is Trigger of ContactTriggerCheckedUnchecked 
*
* @modification log
* 1. Raghav        31-01-2023  Update the code intentation
* 2. Raghav        01-02-2023  Add Code Comments
*/
trigger ContactTriggerCheckedUnchecked on Contact (after insert, before insert) {
    if( Trigger.isInsert && Trigger.isAfter ){
        HandlerCreateFamily.checkboxChecked(Trigger.new);
    }
     if(Trigger.isInsert && Trigger.isBefore  ){
        HandlerCreateFamily.checkboxUnchecked(Trigger.new);
    }
}