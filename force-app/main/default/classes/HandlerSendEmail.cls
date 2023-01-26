public class HandlerSendEmail {
    public void sendEmail(List<Contact> conList){
        set<Id> headidset =new Set<Id>();
        for(Contact con:conList){
            headidset.add(con.Family_Heads__c);
        }
        
        List<String> allheademail=new List<String>();
        for(Contact con:[Select Id, Name, Email from Contact where Id In:headidset]){
            allheademail.add(con.Email);
        }
        
        List <Messaging.SingleEmailMessage> mails= new List <Messaging.SingleEmailMessage>();
        //step 1- create email
        Messaging.SingleEmailMessage mail= new Messaging.SingleEmailMessage();
        
        //step 2- email id list for people
        mail.setToAddresses(allheademail);
        
        //step 3- Take all contacts and add one contact in one mail
        for(Contact con:conList){
            mail.setSubject('New member has been added to Family : ');
            mail.PlainTextBody = 'This is the message body.';
            String body = 'Dear ' + con.FirstName + ', '; 
            body += 'New voter from your family has been added successful';
            mail.setHtmlBody(body);
            
            // Step 4. Add one to the list of mails
            mails.add(mail);
        } 
        // Step 5: Send all list of mails
        Messaging.sendEmail(mails);
    }
}