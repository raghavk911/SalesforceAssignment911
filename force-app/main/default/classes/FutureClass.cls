/*
* @classname            :   FutureClass
* @author               :   Raghav
* @date                 :   22-01-2023
* @description          :   This is Future class which create new Contact 
                        :   and in seperate transaction it creates new User an Organization
*
* @modification log
* 1. Raghavendra Kadam  :   31-01-2023  Updated the code intentation
* 2. Raghavendra Kadam  :   01-02-2023  Added Code Comments
* 3. Raghavendra Kadam  :   03-02-2023  Corrected Code Comments
*/
global class FutureClass {
/*
 * @methodname          :   createContact
 * @param               :   none
 * @description         :   This method is used for create new Contact
 * @return              :   none
 * @author              :   Raghav 
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
 * @methodname            :   createUser
 * @param                 :   FirstName, LastName, Email
 * @description           :   This method seperates the transaction and create new User in an Organization
 * @return                :   none
 * @author                :   Raghav
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