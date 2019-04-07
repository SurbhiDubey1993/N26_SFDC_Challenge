({
	getCostByMonth : function(component,event,helper) {		
        var action = component.get("c.getCostPerCalendarMonth");
        action.setParams({
            "caseId": component.get("v.recordId")
        });
        action.setCallback(this, function(response) {
            var state = response.getState();
            if(state === "SUCCESS")	{
            	component.set("v.productInfoList",response.getReturnValue());
            } 
            else if(state == "ERROR")	{
                var errors = response.getError();                       
                component.set("v.showErrors",true);
                component.set("v.errorMessage",errors[0].message);                          
            }
  
        });
        $A.enqueueAction(action);
	},
    
    getATMFees : function(component,event,helper) {		
        var action = component.get("c.getATMFees");
        action.setParams({
            "caseId": component.get("v.recordId")
        });
        action.setCallback(this, function(response) {
            var state = response.getState();
            if(state === "SUCCESS")	{
            	component.set("v.productInfoList",response.getReturnValue());
            } 
  			else if(state == "ERROR")	{
                var errors = response.getError();                       
                component.set("v.showErrors",true);
                component.set("v.errorMessage",errors[0].message);                          
            }
        });
        $A.enqueueAction(action);
	},
    
    getCardReplacementCost : function(component,event,helper) {		
        var action = component.get("c.getCardReplacementCost");
        action.setParams({
            "caseId": component.get("v.recordId")
        });
        action.setCallback(this, function(response) {
            var state = response.getState();
            if(state === "SUCCESS")	{
            	component.set("v.productInfoList",response.getReturnValue());
            } 
  			else if(state == "ERROR")	{
                var errors = response.getError();                       
                component.set("v.showErrors",true);
                component.set("v.errorMessage",errors[0].message);                          
            }
        });
        $A.enqueueAction(action);
	}
})