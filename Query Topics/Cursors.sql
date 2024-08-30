use Army;

-- 1 . Fetch and print the posting details (date and location) for each soldier using a cursor.
call Cursor_PrintPostingDetails();

-- 2 . Retrieve and list all missions that are led by a specific soldier using a cursor.
-- call Cusror_GetMissionsLedBySoldier(8);

-- 3 . Calculate and display the total number of weapons in each category using a cursor.
call Cursor_CountWeaponsByCategory();

-- 4 . Retrieve the names of all soldiers belonging to a specific battalion using a cursor.
call Cursor_GetSoldiersInBattalion(2);