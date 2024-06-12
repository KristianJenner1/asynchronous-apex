/*
      * 8. Write a scheduled apex class that:
      * Starts this batch class with each batch containing a maximum of 
      * 15 records
      */
global with sharing class BatchProcessLeadsNoEmployees_Scheduler implements Schedulable
{
    global void execute (SchedulableContext sc)
	{
		ID batchprocessid = Database.executeBatch(new BatchProcessLeadsNoEmployees(), 15);
	}
}
