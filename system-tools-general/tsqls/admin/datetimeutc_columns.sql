
--###################################################
-- DATE TIME to UTC
--###################################################

--1 List all timezones supported by server
select * from sys.time_zone_info
Order by 1

--1.1 Get timezone of server
SELECT SYSDATETIMEOFFSET()

--2 Display UTC, Current Date time, and Current Timezone of server
SELECT GETUTCDATE() , GETDATE(), CURRENT_TIMEZONE()

--3 Conversions

-- Example #1 : Convert UTC to CST

    DECLARE @time_to_convert as DATETIME
    SET @time_to_convert = '2022-07-22 20:40:23' -- Time is in UTC
    SELECT @time_to_convert [UTC], @time_to_convert AT TIME ZONE 'UTC' AT TIME ZONE 'Central Standard Time' [CST]

-- Example #2 : Convert PST to CST
    DECLARE @time_to_convert as DATETIME
    SET @time_to_convert = getdate() -- Time is in PST
    SELECT @time_to_convert [PST], @time_to_convert AT TIME ZONE 'Pacific Standard Time' AT TIME ZONE 'Central Standard Time' [CST]


-- Example #2 : Convert CST to UTC
    DECLARE @time_to_convert as DATETIME
    SET @time_to_convert = '2022-07-22 15:40:23' -- Time is in CST
    SELECT @time_to_convert [CST], @time_to_convert AT TIME ZONE 'Central Standard Time' AT TIME ZONE 'UTC' [UTC]







--###################################################
-- List Columns via sp
--###################################################

exec sp_columns t_rw_ds40101_sureview_EU_AlarmEvents

