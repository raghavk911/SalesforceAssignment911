/*
 * @classname              :   HandlerCreateFamily
 * @author                 :   Raghavendra Kadam
 * @date                   :   22-Jan-2023
 * @description            :   This is Handler class of ContactTriggerCheckedUnchecked 
 *
 * @modification log
 * 1. Raghavendra Kadam    :   31-Jan-2023  Update the code intentation
 * 2. Raghavendra Kadam    :   01-Feb-2023  Add Code Comments
*/ 
public class HandlerCreateFamily {
/**  @methodname 	         :   checkboxChecked
  *  @author               :   Raghavendra Kadam
  *  @param                :   List<Contact>
  *  @description          :   This method Generate Family from Family Head when is family head checkbox is checked
  *  @return               :   none
*/ 
  public static void checkboxChecked(List<Contact> conList){
    List<Account> accList = new List<Account>();  
    List<String> accName = new List<String>();
    for (Contact con : conList){
      if (con.Is_Family_Head__c==True){
        Account acc = new Account();
        acc.Name = con.LastName;
        acc.Phone= con.MobilePhone;
        acc.BillingCity=con.MailingCity;
        acc.BillingState=con.MailingState;
        acc.BillingCountry=con.MailingCountry;
        accList.add(acc);  
        accName.add(acc.Id);
      }
    }
    insert accList;
    List<Contact>cont=[select Id, AccountId from Contact where AccountId In: accName];
    List<Contact>conListUpdateFamNm=new List<Contact>();
    for(Contact con:cont){
        for(Account acc:accList){
          con.AccountId=acc.Id;
          conListUpdateFamNm.add(con);
        }
    }
    update conListUpdateFamNm;
  }
/**  @methodname          :   checkboxChecked
  *  @author              :   Raghavendra Kadam
  *  @param               :   List<Contact>
  *  @description         :   This method populate Family Name when checkbox unchecked
  *  @return              :   none
*/
  public Static void checkBoxUnChecked(List<Contact> conList ){
    List<Account> accLIst = [Select Id, Name, BillingCity, BillingState, BillingCountry From Account];
    for(Contact con : conList){
      for(Account a : accList){
        if(con.Is_Family_Head__c == False && con.AccountId == Null){
          if(con.LastName == a.Name && con.MailingCity== a.BillingCity && con.MailingState== a.BillingState && con.MailingCountry== a.BillingCountry){
            con.AccountId = a.Id;
          }
        }
      }
    }
  }
}