/**  @triggername 	    :   ContactTriggerCheckedUnchecked
  *  @author 			:   Raghav
  *  @group  			:   none
  *  @param  			:   context variable after insert, before insert
  *  @description       :   This is trigger of HandlerCreateFamily handler
  *  @return 			:   none
*/
trigger ContactTriggerCheckedUnchecked on Contact (after insert, before insert) {
    if( Trigger.isInsert && Trigger.isAfter ){
        HandlerCreateFamily.checkboxChecked(Trigger.new);
    }
     if(Trigger.isInsert && Trigger.isBefore  ){
        HandlerCreateFamily.checkboxUnchecked(Trigger.new);
    }
}