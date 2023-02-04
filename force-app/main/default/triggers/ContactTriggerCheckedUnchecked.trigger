/*
* @triggername              :   ContactTriggerCheckedUnchecked
* @author                   :   Raghavendra Kadam
* @date                     :   22-Jan-2023
* @description              :   This is Trigger of ContactTriggerCheckedUnchecked 
*
* @modification log
* 1. Raghavendra Kadam      :   31-Jan-2023  Update the code intentation
* 2. Raghavendra Kadam      :   01-Feb-2023  Add Code Comments
*/
trigger ContactTriggerCheckedUnchecked on Contact (after insert, before insert) {
  if( Trigger.isInsert && Trigger.isAfter ){
    HandlerCreateFamily.checkboxChecked(Trigger.new);
  }
   if(Trigger.isInsert && Trigger.isBefore  ){
    HandlerCreateFamily.checkboxUnchecked(Trigger.new);
  }
} 