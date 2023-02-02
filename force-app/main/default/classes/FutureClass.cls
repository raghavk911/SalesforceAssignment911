/*
* @classname      FutureClass
* @author         Raghav
* @date           22-01-2023
* @description    This is Future class which create new Contact 
                  and in seperate transaction it creates new User an Organization
*
* @modification log
* 1. Raghav        31-01-2023  Update the code intentation
* 2. Raghav        01-02-2023  Add Code Comments
*/
global class FutureClass {
/*
* @methodname         createContact
* @param              none
* @description        This method is used for create new Contact
* @return             none
* @author             Raghav 
* @group              none
*/
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
  }
/*
* @methodname         createUser
* @param              FirstName, LastName, Email
* @description        This method seperates the transaction and create new User in an Organization
* @return             none
* @author             Raghav
* @group              none
*/
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
  }
}