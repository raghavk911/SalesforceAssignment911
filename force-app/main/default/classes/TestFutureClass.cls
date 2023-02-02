/*
* @classname      public class TestFutureClass {

* @author         Raghav
* @date           22-01-2023
* @description    This is Test class of Future class which create new Contact 
                  and in seperate transaction it creates new User an Organization
*
* @modification log
* 1. Raghav        31-01-2023  Update the code intentation
* 2. Raghav        01-02-2023  Add Code Comments
*/
@isTest
public class TestFutureClass {
/*
* @methodname         createContactTest
* @param              none
* @description        This method is used for test creation of Contact record
* @return             none
* @author             Raghav 
* @group              none
*/
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