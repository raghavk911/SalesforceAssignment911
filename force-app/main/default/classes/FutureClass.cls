global class FutureClass {

  public static void createContact(){
        
        Contact con = new Contact();
        con.FirstName = 'Raghav';
        con.LastName = 'Kadam';
        con.Is_Family_Head__c = true;
        con.Email ='raghavendra.k@deciphercloud.com';
        con.MailingCountry = 'India';
        con.MailingState = 'Maharashtra';
        
        Insert con;
        createUser(con.FirstName, con.LastName, con.Email );
        system.debug(con);
    }
    @future
    public static void createUser(string FirstName, string LastName, string Email){
        User useobj = new User();
        useobj.FirstName = FirstName;
        useobj.LastName = LastName;
        useobj.Alias = 'Alias';
        useobj.Email = Email;
        useobj.IsActive =true;
        useobj.ProfileId ='00e5g000005q8nAAAQ';
        datetime dt = DateTime.now();
        useobj.Username = Email;
        useobj.TimeZoneSidKey = 'America/Los_Angeles';
        useobj.LocaleSidKey = 'en_US';
        useobj.EmailEncodingKey = 'UTF-8';
        useobj.LanguageLocaleKey = 'en_US'; 

        insert useobj;
        system.debug(useobj);
    }    
}