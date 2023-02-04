/**
 * @classname            :   TestSendEmail02
 * @author               :   Raghavendra Kadam
 * @date                 :   22-Jan-2023
 * @description          :   This is Test class of HandlerSendEmail
 *
 * @modification log
 * 1. Raghavendra Kadam  :   31-Jan-2023  Update the code intentation
 * 2. Raghavendra Kadam  :   01-Feb-2023  Add Code Comments
*/
@isTest
public class TestSendEmail {
/**  @methodname 	      :   checkboxChecked
 *  @author             :   Raghavendra Kadam
 *  @description        :   This method test sending mail whenever new family is being added to Contact
 *  @return             :   none
*/
  @isTest
  public static void sendEmail(){
    Contact conHead= new Contact();
    ConHead.FirstName='Raghavendra Kadam';
    conHead.LastName='Kadam';
    conHead.Is_Family_Head__c=True;
    conHead.Skip_Validation_Rule__c=True;
    conHead.Email='Raghavendra Kadam.k911@gmail.com';
    insert conHead;
    List <Contact>conList=new List <Contact>();
    Contact con= new Contact();
    con.FirstName='Sujit'; 
    con.LastName='Kadam'; 
    con.Email='Raghavendra Kadam.k911@gmail.com';
    con.Skip_Validation_Rule__c=True;
    con.Is_Family_Head__c=False;
    con.Family_Heads__c=conHEad.Id;
    conList.add(con);
    insert conList;
    HandlerSendEmail obj2=new HandlerSendEmail();
    obj2.sendEmail(conList);
  }
}