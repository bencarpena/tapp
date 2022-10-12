Drop table t_pr_ds10121_EnvironmentalMetrics

use dEnvMetrics

SET STATISTICS TIME ON

SET ANSI_NULLS ON

SET QUOTED_IDENTIFIER ON

CREATE TABLE [dbo].[t_pr_ds10121_EnvironmentalMetrics](
	
	[EnvironmentalMetric_ID] [nvarchar](36) NOT  NULL,


	[Responsible_Person] [nvarchar] (500) NULL,
	[TRT_ID] [nvarchar] (500) NULL,
	[Archive] [nvarchar] (500) NULL,
	[Archive_Reason] [nvarchar] (500) NULL,
	[Location_Comments] [nvarchar] (2000) NULL,
	[Exclude_Metric_Electricity] [nvarchar] (500) NULL,
	[Exclude_Metric_Electricity_Reason] [nvarchar] (500) NULL,
	[Electricity_Unit] [nvarchar] (500) NULL,
	[Electricity_General_Comments] [nvarchar] (2000) NULL,
	[Exclude_Metric_Water] [nvarchar] (500) NULL,
	[Exclude_Metric_Water_Reason] [nvarchar] (500) NULL,
	[Water_Unit] [nvarchar] (500) NULL,
	[Water_General_Comments] [nvarchar] (2000) NULL,
	[Exclude_Metric_Refrigerant] [nvarchar] (500) NULL,
	[Exclude_Metric_Refigerant_Reason] [nvarchar] (500) NULL,
	[Refrigerant_Unit] [nvarchar] (500) NULL,
	[Refrigerant_General_Comments] [nvarchar] (2000) NULL,
	[Exclude_Metric_Natural_Gas] [nvarchar] (500) NULL,
	[Exclude_Metric_Natural_Gas_Reason] [nvarchar] (500) NULL,
	[Natural_Gas_Unit] [nvarchar] (500) NULL,
	[Natural_Gas_General_Comments] [nvarchar] (2000) NULL,
	[Exclude_Metric_District_Heating] [nvarchar] (500) NULL,
	[Exclude_Metric_District_Heating_Reason] [nvarchar] (500) NULL,
	[District_Heating_Unit] [nvarchar] (500) NULL,
	[District_Heating_General_Comments] [nvarchar] (2000) NULL,
	[Exclude_Metric_Haz_Waste] [nvarchar] (500) NULL,
	[Exclude_Metric_Haz_Waste_Reason] [nvarchar] (500) NULL,
	[Haz_Waste_Unit] [nvarchar] (500) NULL,
	[Haz_Waste_General_Comments] [nvarchar] (2000) NULL,
	[Exclude_Metric_NonHaz_Waste] [nvarchar] (500) NULL,
	[Exclude_Metric_NonHaz_Waste_Reason] [nvarchar] (500) NULL,
	[NonHaz_Waste_Unit] [nvarchar] (500) NULL,
	[NonHaz_Waste_General_Comments] [nvarchar] (2000) NULL,
	[Exclude_Metric_Diesel] [nvarchar] (500) NULL,
	[Exclude_Metric_Diesel_Reason] [nvarchar] (500) NULL,
	[Diesel_Unit] [nvarchar] (500) NULL,
	[Diesel_General_Comments] [nvarchar] (2000) NULL,
	[Exclude_Metric_Gasoline] [nvarchar] (500) NULL,
	[Exclude_Metric_Gasoline_Reason] [nvarchar] (500) NULL,
	[Gasoline_Unit] [nvarchar] (500) NULL,
	[Gasoline_General_Comments] [nvarchar] (2000) NULL,
	[Exclude_Metric_Propane] [nvarchar] (500) NULL,
	[Exclude_Metric_Propane_Reason] [nvarchar] (500) NULL,
	[Propane_Unit] [nvarchar] (500) NULL,
	[Propane_General_Comments] [nvarchar] (2000) NULL,
	



	[AUD_ID] [nvarchar](50) NULL,
	[AUD_CD] [int] NULL,
	[AUD_DT] [datetime]  NULL,


CONSTRAINT [PK_t_pr_ds10121_EnvironmentalMetrics] PRIMARY KEY CLUSTERED 
(
	[EnvironmentalMetric_ID] ASC
)


WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]

) ON [PRIMARY]


ALTER TABLE [dbo].[t_pr_ds10121_EnvironmentalMetrics] ADD  CONSTRAINT [DF_t_pr_ds10121_EnvironmentalMetrics_AUD_ID]  DEFAULT (N'datawizards@tesla.com') FOR [AUD_ID]

ALTER TABLE [dbo].[t_pr_ds10121_EnvironmentalMetrics] ADD  CONSTRAINT [DF_t_pr_ds10121_EnvironmentalMetrics_AUD_CD]  DEFAULT ((2)) FOR [AUD_CD] 
/*
	2 = Inserted
	3 = Updated
	4 = Deleted
*/

ALTER TABLE [dbo].[t_pr_ds10121_EnvironmentalMetrics] ADD  CONSTRAINT [DF_t_pr_ds10121_EnvironmentalMetrics_AUD_DT]  DEFAULT (getdate()) FOR [AUD_DT]