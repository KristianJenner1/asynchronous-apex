public with sharing class ContactUtils 
{
    // method to update the Contact Lead Source to the supplied value
    public List<Contact> updateLeadSource (List<Contact> contacts, String leadSource)
    {
        for (Contact contact : contacts)
        {
            contact.LeadSource = leadSource;
        }
        update contacts;

        return contacts;
    }

}
