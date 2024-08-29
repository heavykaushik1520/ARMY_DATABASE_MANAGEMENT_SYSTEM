-- Data Management using Procedure

-- 1 . INSERT NEW SOLDIER;
-- Drop the existing check constraint
call Procedure_insertSoldier(21, 'Kaushik Mandavkar', 'Captain', 2, '2020-03-25', '1993-02-12', 1, 117, 62, 37, 6, 'Active');

-- 2 . Get Soldier Details by ID
call Procedure_GetSoldierById(2);

-- 3 . Update Soldier Status
call Procedure_updateSoldierStatus(21 , "IN-ACTIVE");

-- 4 . Get Soldiers in a Battalion
call Procedure_GetSoldierByBatalion(1);

-- 5 . Count Soldiers by Post
call Procedure_CountSoldiersByPost("Captain");

-- 6 . Get Soldiers Posted to a Location
call Procedure_GetSoldiersByLocation(7);

-- 7 . Get All Missions Led by a Soldier
call Procedure_GetMissionsLedBySoldier(3);

-- 8 . Get Inventory by Weapon Category
call Procedure_GetInventoryByCategory('Rifle');

-- 9 . Update Mission End Date
CALL Procedure_UpdateMissionEndDate(2, '2001-04-19');

-- 10 . Get Average Height of Soldiers in Battalion
call Procedure_GetAverageHeightByBattalion(2);

-- 11 . Get Soldier Count By Post
SET @count = 0;

call Procedure_GetSoldierCountByPost('Captain' , @count);

SELECT @count;


