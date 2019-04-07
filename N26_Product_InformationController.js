({
    init : function(component,event,helper)	{
      	helper.getCostByMonth(component,event,helper);  
    },
    
    tabSelected: function(component,event,helper) {
        
        if(component.get("v.selTabId")=="tab1")	{
            helper.getCostByMonth(component,event,helper);
        }
        if(component.get("v.selTabId")=="tab2")	{
            helper.getATMFees(component,event,helper);
        }
        if(component.get("v.selTabId")=="tab3")	{
           helper.getCardReplacementCost(component,event,helper); 
        }
        
        
    }
})