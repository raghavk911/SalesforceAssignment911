@isTest
public class TestFutureClass {
    @isTest
    static void createContactTest(){
    Contact con = new Contact();
        con.LastName='testClass1';
        con.Email='tests1@gmail.com';    
        con.FirstName='Tests1';
        con.Is_Family_Head__c=True;
        con.MailingCity='Satara';
        con.MailingState='Maharashtra';
        con.MailingCountry='India';
        con.MailingPostalCode='411030';
        Insert con;
        
        FutureClass.createContact();
        FutureClass.createUser(con.FirstName, con.LastName, con.Email) ;
    }
    
}