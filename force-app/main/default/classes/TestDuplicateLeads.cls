@isTest
public class TestDuplicateLeads {
    
    @isTest
    public static void myLeadTest(){
        
        List<Lead> leadList1 = new List<Lead>();
        lead l = new Lead();
        l.FirstName= 'Raghav';
        l.LastName = 'Kadam';
        l.Company = 'ABC';
        l.Status = 'Closed - Converted';
        leadList1.add(l);
        insert leadList1;
        
        //creating second lead record 
        
        List<Lead> leadList2 = new List<Lead>();
        lead l1 = new Lead();
        l1.FirstName= 'Raghav';
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
    
     @isTest
        public static void testschedule() {
            Test.StartTest();
            DuplicateLeads schedule = new DuplicateLeads();
            String sch = '0 0 0/2 ? * * *';
            system.schedule('Test status Check', sch, schedule );
            Test.stopTest();
        }
}