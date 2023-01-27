public class HandlerCreateFamily {
    
    public static void checkboxChecked(List<Contact> conList){          
        //	Generate Family from Family Head        
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

    //checkbox unchecked method populate Family Name    
    public Static void checkBoxUnChecked(List<Contact> conList ){
        List<Account> accLIst = [Select Id, Name, BillingCity, BillingState, BillingCountry From Account];
        for(Contact con : conList){
            System.debug('I am in For Loop');
            for(Account a : accList){
                if(con.Is_Family_Head__c == False && con.AccountId == Null){
                    System.debug('I am in if condition');
                    if(con.LastName == a.Name && con.MailingCity== a.BillingCity && con.MailingState== a.BillingState && con.MailingCountry== a.BillingCountry){
                        System.debug('I am in Nested if condition');
                        con.AccountId = a.Id;                    
                        System.debug('accountId'+con.AccountId);  
                    }  
                }         
            }         
        }    
    }
}