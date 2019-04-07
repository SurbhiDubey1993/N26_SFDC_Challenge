/*  Author   : Surbhi Dubey
*	Reference: Batch job sends emails to customers if the Survet Date is in Past.
*			   Batch using email template:N26_DEMO_EMAIL_TEMPLATE which sends email to Customer based on their language.
*/
global class N26_Demo_SendEmail implements Database.Batchable<sObject> {
    
    public List<Contact> contactList = new List<Contact>();
    
    global database.querylocator start(Database.BatchableContext BC) {
        return Database.getQueryLocator([SELECT Id,Email,FirstName,Language__c from Contact WHERE Survey_Date__c < Today]);
    } 
    
    global void execute(Database.BatchableContext BC, Sobject[] scope)	{
        try {
            EmailTemplate emailTemplate = [select Id, Body from EmailTemplate where DeveloperName = 'N26_DEMO_EMAIL_TEMPLATE'];
            Boolean isSuccess= TRUE;
            for(Contact contactObj : (List<Contact>)scope) {
                contactObj.Survey_Date__c=null;
                contactList.add(contactObj);
                Messaging.SingleEmailMessage email = new Messaging.SingleEmailMessage();
                email.setToAddresses(new String[] {contactObj.Email});
                email.setTargetObjectId(contactObj.Id);
                email.setTemplateId(emailTemplate.Id);
                //There is a limitation about the max number of emails that can be sent a day.Can be avoid using this
                if(inspectResults(Messaging.sendEmail( new Messaging.SingleEmailMessage[] { email } )))	{
                    isSuccess=TRUE;
                }
            }
            if(isSuccess)	{
                update contactList;
            }
        }
        catch(Exception ex)	{
        	System.debug('Exception Occured...'+ex.getMessage());    
        }
    }
    global void finish(Database.BatchableContext BC) {
		
	}
               
    private static Boolean inspectResults(Messaging.SendEmailResult[] results)	{
        Boolean sendResult=TRUE;
        for(Messaging.SendEmailResult res: results)	{
            if(res.isSuccess())	{
                System.debug('Email Sent Successfully');
            }
            else {
                sendResult=FALSE;
            }
        }
        return sendResult;
    }
}