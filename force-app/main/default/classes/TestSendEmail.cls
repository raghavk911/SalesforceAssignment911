@isTest
public class TestSendEmail {
	
    @isTest
    public static void sendEmail(){
        Contact conHead= new Contact();
       	ConHead.FirstName='Raghav';
        conHead.LastName='Kadam';
        conHead.Is_Family_Head__c=True;
        conHead.Skip_Validation_Rule__c=True;
        conHead.Email='raghav.k911@gmail.com';
        
        insert conHead;

    List <Contact>conList=new List <Contact>();
        Contact con= new Contact();
        con.FirstName='Sujit';
        con.LastName='Kadam';
        con.Email='raghav.k911@gmail.com';
        con.Skip_Validation_Rule__c=True;
        con.Is_Family_Head__c=False;
        con.Family_Heads__c=conHEad.Id;
        conList.add(con);
        insert conList;
        HandlerSendEmail obj2=new HandlerSendEmail();
        obj2.sendEmail(conList);
        
    }
}