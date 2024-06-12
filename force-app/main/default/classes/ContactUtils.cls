/**
 * Utility class for working with Contact records.
 */
public with sharing class ContactUtils 
{
    /**
     * Updates the lead source for the given list of contacts.
     * 
     * @param contacts The list of contacts to update.
     * @param leadSource The new lead source to set for the contacts.
     * @return The updated list of contacts.
     */
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
