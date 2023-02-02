/*
* @classname      DuplicateLeads
* @author         Raghav
* @date           22-01-2023
* @description    This is Batch class which delete duplicate leads after a schedule of 2 hours
*
* @modification log
* 1. Raghav        31-01-2023  Update the code intentation
* 2. Raghav        01-02-2023  Add Code Comments
*/
global class DuplicateLeads implements Database.Batchable<sObject>,Database.Stateful, Schedulable {
/*
* @methodname         start
* @param              Database.BatchableContext
* @description        This method is used for querry from lead
* @return             Database.getQueryLocator
* @author             Raghav 
* @group              none
*/
  global Database.QueryLocator start(Database.BatchableContext bc){
    return Database.getQueryLocator('Select Id, Name, LastName, Company, Status, Email from Lead');
  }

/*
* @methodname         execute
* @param              Database.BatchableContext, List of lead
* @description        This method is used for delete duplicate leads using last name
* @return             none
* @author             Raghav
* @group              none
*/
  global void execute(Database.BatchableContext bc, List<Lead> l){
    Map<String,Lead> LastNameLead = new Map<String,Lead>();
    list<Lead> duplicateToDelete = new list<Lead>();
    for (Lead leadObj : l)
    {
      If(!LastNameLead.containskey(leadObj.LastName)){
        LastNameLead.put(leadObj.LastName, leadObj);
      }
      else{
        duplicateToDelete.add(leadObj);
      }
    }
    if(duplicateToDelete.size() > 0)
    {
      delete duplicateToDelete;
    }
  }
/*
* @methodname         finish
* @param              Database.BatchableContext
* @description        none
* @return             none
* @author             Raghav
* @group              none
*/
  global void finish(Database.BatchableContext bc)
  {

  }

/*
* @methodname         execute
* @param              SchedulableContext
* @description        none
* @return             none
* @author             Raghav
* @group              none
*/
  global void execute(SchedulableContext sc) {
    DuplicateLeads lb = new DuplicateLeads();
    ID batchprocessid = Database.executeBatch(lb);
    String cronExp = '0 0 0/2 ? * * *';
    String jobIDNew = system.schedule('Batch Scheduled', cronExp, lb);
  }
}