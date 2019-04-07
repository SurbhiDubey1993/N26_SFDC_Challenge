/*  Author   : Surbhi Dubey
	Reference: Controller used in N26_Product_Information Lightning Component
*/
public class N26_Product_Info_Controller {
     
    /* Method 		: getCostPerCalendarMonth
    *  Description  : Retrieve related Contact and return Product Information(related to Cost Per Calendar Month) based on 
    *                 Home Country and Product.Result will be displayed under Cost Per Calender Month tab.				  
    *  Input Param	: Id
	*  Return Type  : List<N26_Cost_Per_Calender_Month__mdt>	
    */
    @AuraEnabled
    public static List<N26_Cost_Per_Calender_Month__mdt> getCostPerCalendarMonth(Id caseId)	{
        try	{
            List<N26_Cost_Per_Calender_Month__mdt> costList=new List<N26_Cost_Per_Calender_Month__mdt>();
            Case caseObj=[SELECT Id,ContactId from Case WHERE ID =:caseId];
            if(caseObj.ContactId!=null)	{
                Contact contactObj=[SELECT Id,Product__c,Home_Country__c FROM Contact WHERE ID =:caseObj.ContactId];
                if(contactObj.Home_Country__c!=null && contactObj.Product__c!=null )	{
                	costList=[SELECT Product__c,Home_Country__c,Rates__c FROM N26_Cost_Per_Calender_Month__mdt WHERE 
                              Product__c= :contactObj.Product__c AND Home_Country__c= :contactObj.Home_Country__c];
                }
            }
            return costList;
        }
        catch(Exception e){
			throw new AuraHandledException('Error Exception happend!!!'+e.getMessage());           
		}
    }
    
    /* Method 		: getATMFees
    * Description  	: Retrieve related Contact and return Product Information(related to ATM Fees) based on 
    * 				  Home Country and Product.Result will be displayed under ATM Fees in Currencies tab.
    *  Input Param	: Id
	*  Return Type  : List<N26_ATM_Fee_in_other_currencies__mdt>	
    */
    @AuraEnabled
    public static List<N26_ATM_Fee_in_other_currencies__mdt> getATMFees(Id caseId)	{
        try {
        	List<N26_ATM_Fee_in_other_currencies__mdt> costList=new List<N26_ATM_Fee_in_other_currencies__mdt>();
        	Case caseObj=[SELECT Id,ContactId from Case WHERE ID =:caseId];
        	if(caseObj.ContactId!=null)	{
        		Contact contactObj=[SELECT Id,Home_Country__c,Product__c FROM Contact WHERE ID =:caseObj.ContactId];
        		if(contactObj.Home_Country__c!=null && contactObj.Product__c!=null )	{
                	costList=[SELECT Product__c,Home_Country__c,Rates__c FROM N26_ATM_Fee_in_other_currencies__mdt WHERE 
                  		 	 Product__c= :contactObj.Product__c AND Home_Country__c= :contactObj.Home_Country__c];
                }
        	}
        	return costList;
        }
        catch(Exception e){
			throw new AuraHandledException('Error Exception happend!!!'+e.getMessage());           
		}
    }
    /* Method 		: getCardReplacementCost
    *  Description  : Retrieve related Contact and return Product Information(related to Card Replacement Cost) based on 
    * 				  Home Country and Product.Result will be displayed under Card Replacement Cost tab.
    *  Input Param	: Id
	*  Return Type  : List<N26_Card_Replacement_Cost__mdt>	
    */
    @AuraEnabled
    public static List<N26_Card_Replacement_Cost__mdt> getCardReplacementCost(Id caseId)	{
        try	{
            List<N26_Card_Replacement_Cost__mdt> costList=new List<N26_Card_Replacement_Cost__mdt>();
        	Case caseObj=[SELECT Id,ContactId from Case WHERE ID =:caseId];
        	if(caseObj.ContactId!=null)	{
            	Contact contactObj=[SELECT Id,Product__c,Home_Country__c FROM Contact WHERE ID =:caseObj.ContactId];
                if(contactObj.Home_Country__c!=null && contactObj.Product__c!=null )	{
                	costList=[SELECT Product__c,Home_Country__c,Rates__c FROM N26_Card_Replacement_Cost__mdt WHERE 
                         	 Product__c= :contactObj.Product__c AND Home_Country__c= :contactObj.Home_Country__c];
                }
       		}
       	 return costList;
        }
        catch(Exception e){
			throw new AuraHandledException('Error Exception happend!!!'+e.getMessage());           
		}
    }
    
}