@isTest
private class FutureMethodsTest 
{
    /*
     * 2. Create a method that tests the future method from the FutureMethods class 
     * Ensure that you retrieve the updated Contacts from the database
     * and assert that the Lead Source has changed
     */
    @isTest static void test_UpdateLeadSourceForContacts()
    {
        // test setup - 200 Contacts
        List<Contact> testContacts = new List<Contact>();
        for (Integer i=1; i<=200; i++)
        {
            Contact testContact = TestDataHelper.GetContact('test',String.valueOf(i)); 
            testContacts.add(testContact);
        } 
        insert testContacts;
        
        // get the inserted contact Ids
        List<ID> testContactIds = new List<Id>();
        for (Contact c : [SELECT ID FROM Contact])
        {
            testContactIds.add(c.ID);
        }

        Test.startTest();

        FutureMethods.UpdateLeadSourceForContacts(testContactIds);

        Test.stopTest();
        
        List<Contact> updatedContacts = [SELECT LeadSource FROM Contact];
        System.assertEquals(200,updatedContacts.size(),'200 contacts should have been returned fro the database');
        for (Contact c : updatedContacts)
        {
            System.assertEquals('email',c.LeadSource,'the LeadSource of the Contact should be email');
        }

    }
}
