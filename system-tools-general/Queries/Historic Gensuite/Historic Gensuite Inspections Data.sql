select 
case when (sam.compdate < getdate()
       and fm.auditrecno is null)
	then 'Overdue - Not Started'
	when fm.TotalQNs = fm.CompleteQNs
	then 'Complete'
	when (sam.compdate > getdate()
       and fm.auditrecno is null)
	then 'Upcoming - Not Started'
	when (
       fm.TotalQNs > fm.CompleteQNs
       and sam.compdate > getdate() )
	then 'Started - Incomplete'
	when (
       fm.TotalQNs > fm.CompleteQNs
       and sam.compdate < getdate() )
	then 'Overdue - Incomplete'
	else 'No Due Date'
	end as 'Completion Status'
	,isnull(sfm.[Location], isnull(fm.location, sam.location)) as Location
	,isnull(sfm.orgname,sam.orgname) as 'World Region'

,sam.[Module]
,sam.modifypastdue
,am.archive
      ,sam.[RespPerson]
      ,cast(sam.[CompDate] as date) as CompDate
      ,sam.[Applicability]
      ,sam.[UpdateDate]
      ,sam.[UpdateBy] as samUpdateBy
      ,sam.[Applicable]
      ,sam.[DeptID]
	  ,coe.COE as Department
      ,sam.[SubCOEID]
      ,sam.[Building]
      ,sam.[Workstation]
      ,sam.[Frequency]
      ,sam.[BusRequired]
      ,sam.[SiteApplicModuleID]
      ,sam.[StartDate]
      ,sam.[AuditType]
      ,sam.[EndDate]
      ,sam.[NumDays]
      ,sam.[MasterSAMID]
	  ,sam.adhocinspection
     
      ,sam.[Module_ID]
	  ,sfm.[AuditRecNo]
      --,sfm.[Module]
      --,sfm.[AuditType]
	  
	  ,site.suborg
      --,sfm.[SiteApplicModuleID]
      ,sfm.[SecondaryAuditor]
      ,sfm.[InspectionTime]
      ,sfm.[GPS]

	--,fm.[AuditRecNo]
      --,fm.[Module]
      ,fm.[Team]
      ,fm.[AuditDate]
      ,fm.[FindingModDate]
      ,fm.[Pwd]
      ,fm.[Export]
      ,fm.[Status]
      ,fm.[FindingCreateDate]
      ,fm.[UpdateBy] as fmUpdateBy
      ,fm.[UpdateHistory]
      ,fm.[TotalQNs]
      ,fm.[CompleteQNs]
      ,fm.[InitiatedBy]
      ,fm.[LastUpdateby]
      ,fm.[LastCompletedBy]
      --,fm.[Module_ID]
	  
	  ,qna.question
	  ,find.qnid
	  ,find.anstext
	  ,act.*


from ehs_replication.dbo.siteapplicmodule sam
       inner join ehs_replication.dbo.siteapplicmodule mas on sam.MasterSAMID = mas.SiteApplicModuleID
       left join ehs_replication.dbo.sitefindingmodule sfm on sam.SiteApplicModuleID = sfm.SiteApplicModuleID
       left join ehs_replication.dbo.findingmodule fm on fm.auditrecno = sfm.AuditRecNo
	   left join ehs_replication.dbo.site site on site.location=sfm.location
	   left join ehs_replication.dbo.auditmodule am on am.module=sam.module
	   left join ehs_replication.dbo.ltbcoe coe on coe.deptid=sam.deptid
	  
	   left join [ehs_replication].[dbo].[FindingQn] find on find.auditrecno=sfm.auditrecno 
	   left join ehs_replication.dbo.auditqn qn on qn.qnid = find.qnid and qn.module_id = sam.module_id
	   left join ehs_replication.dbo.auditQN_QA qna on qna.qnid = find.qnid and qna.module_id = sam.module_id

	   left join (select 
	location as actLocation
	,id 
	,findingtype 
	,category 
	,responperson 
	,description 
	,correctiveaction
	,[ClosureDueDate]
	,closedate
	,status as ActStatus
	,refid 
	,classificationtype
	 ,reftype
	 
	,case 
		when len(refid) < 6 then null 
		else SUBSTRING(refid, charindex( 'T',refid)+2,len(refid)-charindex( 'T',refid)) 
	end as ActionID
	,case 
		when len(refid) < 6 then null 
		else SUBSTRING(refid, 0,charindex( 'P',refid)-1) end as QnNum
	
	from ehs_replication.dbo.tblaudit
	where location not like 'Demo%'
	and auditname  like '%inspection%'
	and reftype not like  'event'
	) act on act.actionid = sfm.[AuditRecNo] and find.qnid=qnnum



where 1=1
		and sam.orgname not like 'Demo%'