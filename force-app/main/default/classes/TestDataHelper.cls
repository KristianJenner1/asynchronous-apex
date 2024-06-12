@isTest
public class TestDataHelper 
{
    public static Contact GetContact(String firstName, String lastName)
    {
        Contact newContact = new Contact();
        newContact.firstName = firstName;
        newContact.lastName = lastName;
        return newContact;
    }
}