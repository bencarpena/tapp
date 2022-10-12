/****** Object:  UserDefinedFunction [dbo].[fn_LeadP_Get_CostofFinding_RollingAvg]    Script Date: 8/5/2020 10:15:56 AM ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER ON
GO

ALTER    Function [dbo].[fn_pr_ds1103_getCostofFinding_RollingAvg] (
                                        @SYear nvarchar(4),
                                        @SBU nvarchar(50)
                                                    )
RETURNS nvarchar(50)
AS
BEGIN 

Declare @CostOfFindingRollingAvg float
Declare @msg nvarchar(200)
Declare @expcosts float, @discoveries float, @extensions float 

SET @SYear = Rtrim(Ltrim(UPPER((@SYear))))
SET @SBU = Rtrim(Ltrim(UPPER((@SBU))))

--> //  SET PRECONDITIONS : AUTO MATCH  //

IF (@SYear) = '' or (@SBU) = ''
    Begin
        SET @msg = 'Error : Required values missing.'
		SET @CostOfFindingRollingAvg = -1
    End
Else
    Begin
        SET @msg = 'Success!'
        SET @CostOfFindingRollingAvg = 0 --(@expcosts / (@discoveries + @extensions))

        --#### Compute for rolling average ####
		
        SELECT 
                @expcosts = SUM(s2.Total_Exploration),
                @discoveries = SUM(s1.Discoveries),
                @extensions = SUM(s1.Extensions)
            From    dbo.t_rf_ds1001_COFDA_DenoNR s1
                    Inner Join dbo.t_rf_ds1001_COFDA_NumCostsPerHFM s2
                    On 
                    s2.SBU = s1.SBU AND s2.[Year] = s1.[Year]


			Where 
					s1.SBU = @SBU 
					And (	s1.Discoveries <> 0 
							Or
							s1.Extensions <> 0
						)

			Group by s1.SBU



		 SET @CostOfFindingRollingAvg = (@expcosts / (@discoveries + @extensions))

    End




RETURN @CostOfFindingRollingAvg




END