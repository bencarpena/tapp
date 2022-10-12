SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[fn_rf_ds1101_generateTable_RevenueTotalnet] ()  
RETURNS TABLE 
AS
RETURN	(
		
SELECT
			scc.StrategicBusinessUnit,
			sp.CostElementKey, 
			sp.CostCenterkey, 
			scc.CostCenter,
			sp.CalendarDateKey,
			SUM(sp.Amount) as [Sum_Amount]

From [dbo].[t_rf_ds1101_CUPR_SAPProduction] sp

            Inner Join t_rf_ds1101_CUPR_SAPCostElement sce
            On sp.CostElementKey = sce.CostElementKey

            Inner Join t_rf_ds1101_CUPR_SAPCostCenter scc
            On scc.CostCenterKey = sp.CostCenterKey

Group by 	
			scc.StrategicBusinessUnit,
			sp.CalendarDateKey,
			sp.CostElementKey, 
			sp.CostCenterkey, 
			scc.CostCenter
