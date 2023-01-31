global class DuplicateLeads implements Database.Batchable<sObject>,Database.Stateful, Schedulable {
    
    global Database.QueryLocator start(Database.BatchableContext bc){
        return Database.getQueryLocator('Select Id, Name, LastName, Company, Status, Email from Lead');
    }
    
    global void execute(Database.BatchableContext bc, List<Lead> l){
        
        Map<String,Lead> LastNameLead = new Map<String,Lead>(); 
        
        list<Lead> duplicateToDelete = new list<Lead>();
        
        for (Lead leadObj : l)
        {
            
            If(!LastNameLead.containskey(leadObj.LastName) ){
                LastNameLead.put(leadObj.LastName, leadObj);
                system.debug(LastNameLead);
            }
            else{
                duplicateToDelete.add(leadObj);
                system.debug(duplicateToDelete);
            }
            
        }
        
        if(duplicateToDelete.size() > 0)
        {
            delete duplicateToDelete;
        }
        
    }
    
    global void finish(Database.BatchableContext bc)
    {
        
    }
    global void execute(SchedulableContext sc) {       
        DuplicateLeads lb = new DuplicateLeads();
        ID batchprocessid = Database.executeBatch(lb);
        String cronExp = '0 0 0/2 ? * * *';
        String jobIDNew = system.schedule('Batch Scheduled', cronExp, lb);
        
    }
    
    
}