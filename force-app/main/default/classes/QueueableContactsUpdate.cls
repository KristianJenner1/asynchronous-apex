public with sharing class QueueableContactsUpdate implements Queueable
{
    /*
     * 5. Change this class to be a Queueable. 
     *    The constructor takes a list of Contacts 
     *    The Queueable delegates to the utility method
     *    created in step 4.
     */
    public static final String LEAD_SOURCE = 'email';
    private List<Contact> contacts;

    public QueueableContactsUpdate (List<Contact> contacts)
    {
        this.contacts = contacts;
    }

    public void execute(QueueableContext context)
    {
        ContactUtils ContactUtils = new ContactUtils();
        List<Contact> updatedContacts = ContactUtils.updateLeadSource(contacts, LEAD_SOURCE);
    }

     /*
      * 6. Create a static method to run the Queueable
      */
    public static void RunQueueable (List<Contact> contacts)
    {
        System.enqueueJob(new QueueableContactsUpdate(contacts));
    }

}
