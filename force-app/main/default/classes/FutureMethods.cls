public with sharing class FutureMethods 
{
    public static final String LEAD_SOURCE = 'email';
    /* 
     * 1. Create a future method that updates the Lead Source
     *    on a collection of Contacts. Pick any Lead Source 
    */
    @future
    public static void UpdateLeadSourceForContacts(List<ID> contactIds)
    {
        List<Contact> contacts = [SELECT LeadSource FROM Contact WHERE Id IN: contactIds];

        for (Contact contact : contacts)
        {
            contact.LeadSource = LEAD_SOURCE;
        }

        update contacts;
    }

    /* 
     * 3. Create a static method that queries Contacts from the database
     *    and executes the future method declared above
    */

    /*
     * 4. Refactor the method from step 1 so that the processing can be 
     *    carried out in an asychronous or synchronous context. 
     *    Note that your test should continue to work without any changes
     *    Hint: You will likely want to create a ContactUtils class.
     */
}
