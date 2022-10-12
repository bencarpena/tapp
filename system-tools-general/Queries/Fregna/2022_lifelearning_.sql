use ehs;

SELECT * From learning l
Where 
	YEAR(CreatedOn) = 2022
    And
    IsDeleted = 0
    And
	Metadata like '%"SafeGuardPreventedLifeActual": true%'
    
Order by CreatedOn;


SELECT * from ehs.partnermanagement;