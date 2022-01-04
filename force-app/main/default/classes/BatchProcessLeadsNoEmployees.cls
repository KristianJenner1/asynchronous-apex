public with sharing class BatchProcessLeadsNoEmployees implements Database.Batchable<sObject>, Database.Stateful 
{
    /*
     * 7. Change this class to be a Batch class that does the following:
     */

    // instance variable to hold the lead Ids accross all batches
    String leadIds;

    /* Start  - Identifies all leads in the system that have an empty
     *          Number of Employees field
     */
    global Database.QueryLocator start(Database.BatchableContext BC) 
    {
        String query = 'SELECT Id FROM Lead WHERE NumberOfEmployees = null';
        return Database.getQueryLocator(query);
    } 
    
    /* Execute  - processes the leads in batches and adds the record ids 
     *            to a comma separated string.
     */
    global void execute(Database.BatchableContext BC, List<Lead> leads) 
    {
        // process each batch of records default size is 200
        for (Lead lead : leads) 
        {  
            leadIds += lead.Id + ',';
        }
    }   
    /* Finish - writes the string out to System.debug.
     */ 
    global void finish(Database.BatchableContext BC) 
    {
        System.debug(leadIds);    
    }

     /*
      * 8. Write a scheduled apex class that:
      * Starts this batch class with each batch containing a maximum of 
      * 15 records
      */
}
