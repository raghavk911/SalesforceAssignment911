/*
 * @classname               :   TestDuplicateLeads
 * @author                  :   Raghavendra Kadam
 * @date                    :   22-01-2023
 * @description             :   This is Test class of DuplicateLeads which delete duplicate leads after a schedule of 2 hours
 *
 * @modification log
 * 1. Raghavendra Kadam     :   31-01-2023  Update the code intentation
 * 2. Raghavendra Kadam     :   01-02-2023  Add Code Comments
*/
@isTest
public class TestDuplicateLeads {
/*
* @methodname               :   myLeadTest
* @param                    :   none
* @description              :   This method is used for test creation of Contact record
* @return                   :   none
* @author                   :   Raghavendra Kadam 
*/
  @isTest
  public static void myLeadTest(){
    List<Lead> leadList1 = new List<Lead>();
    lead l = new Lead();
    l.FirstName= 'Raghavendra Kadam';
    l.LastName = 'Kadam';
    l.Company = 'ABC';
    l.Status = 'Closed - Converted';
    leadList1.add(l);
    insert leadList1;

    //Creation of duplicate Contact record
    List<Lead> leadList2 = new List<Lead>();
    lead l1 = new Lead();
    l1.FirstName= 'Raghavendra Kadam';
    l1.LastName = 'Kadam';
    l1.Company = 'ABC';
    l1.Status = 'Closed - Converted';
    leadList2.add(l1);
    insert leadList2;

    //DataBase.executeBatch(); 
    Test.startTest();
    DuplicateLeads btc = new DuplicateLeads();
    ID batchprocessid = Database.executeBatch(btc);
    Test.stopTest();
    List<Lead> leads = [select Name, Company, Status from lead ];
    system.assertEquals(1,leads.size());  

  }
/*
* @methodname               :   testschedule
* @param                    :   none
* @description              :   This method is used for test schedule of delete duplicate records
* @return                   :   none
* @author                   :   Raghavendra Kadam 
*/
  @isTest
  public static void testschedule() {
    Test.StartTest();
    DuplicateLeads schedule = new DuplicateLeads();
    String sch = '0 0 0/2 ? * * *';
    system.schedule('Test status Check', sch, schedule );
    Test.stopTest();
  }
}