trigger ContactTriggerCheckedUnchecked on Contact (after insert, before insert) {
    if( Trigger.isInsert && Trigger.isAfter ){
        HandlerCreateFamily.checkboxChecked(Trigger.new);
    }
     if(Trigger.isInsert && Trigger.isBefore  ){
        HandlerCreateFamily.checkboxUnchecked(Trigger.new);
    }
}