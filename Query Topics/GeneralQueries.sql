use Army;

Select * from Soldier;


-- 1 . Find All Soldiers with More than 5 Missions
select 
    s.name
from
    soldier s
where
    s.soldier_id in (select 
            m.soldier_id
        from
            Mission m
        group by m.soldier_id
        having COUNT(m.mission_id) > 2);
        
        
-- 2 . List All Missions Led by a Specific Soldier
select  
    m.mission_name, m.start_date, m.end_date
from
    Mission m
where
    m.lead_by = 1;
    
-- 3 . Find the Latest Posting Date for Each Soldier
SELECT 
    s.name AS name, MAX(p.date) AS Date
FROM
    soldier s
        JOIN
    posting p ON s.soldier_id = p.soldier_id
GROUP BY s.soldier_id;


-- 4. List Soldiers and Their Current Locations
SELECT 
    s.name, l.location_name
FROM
    soldier s
        JOIN
    posting p ON s.soldier_id = p.soldier_id
        JOIN
    Location l ON p.location_id = l.location_id;

-- 5 . Count the Number of Soldiers in Each Battalion
SELECT 
    b.batalian_name AS Batalian, COUNT(s.soldier_id) AS soldiers
FROM
    batalian b
        LEFT JOIN
    soldier s ON b.batalian_id = s.batalian_id
GROUP BY b.batalian_name;

-- 6. Find the Mission with the second Most Soldiers Involved
SELECT 
    m.mission_name, COUNT(DISTINCT m.soldier_id) AS Soldiers , COUNT(DISTINCT m.lead_by) AS leader_count
FROM
    Mission m
GROUP BY m.mission_id
ORDER BY soldiers + leader_count DESC
LIMIT 1 OFFSET 1;

-- 7 . Get the Average Weight of Soldiers in Each Battalion
SELECT 
    b.batalian_name,
    (SELECT 
            AVG(s.weight)
        FROM
            soldier s
        WHERE
            s.batalian_id = b.batalian_id) AS average_weight
FROM
    batalian b;
    
-- 8 . This view shows details about missions, including the mission name, the name of the soldier on the mission, and the leader's name.
CREATE VIEW View_MissionDetails AS
    SELECT 
        m.mission_id,
        m.mission_name,
        s.name AS soldier_name,
        (SELECT 
                name
            FROM
                soldier
            WHERE
                soldier_id = m.lead_by) AS leader_name,
        m.start_date,
        m.end_date
    FROM
        Mission m
            JOIN
        Soldier s ON m.soldier_id = s.soldier_id;
        
SELECT 
    *
FROM
    View_MissionDetails;
        
-- 9 .  view provides information about soldiers and their posting locations.
CREATE VIEW View_SoldierPostingDetails AS
    SELECT 
        s.soldier_id,
        s.name AS soldier_name,
        p.date AS posting_date,
        l.location_name
    FROM
        Posting p
            JOIN
        Soldier s ON p.soldier_id = s.soldier_id
            JOIN
        Location l ON p.location_id = l.location_id;
        
select * from View_SoldierPostingDetails;

-- 10 . view calculates the total number of soldiers in each battalion.
CREATE VIEW View_BatalianStrength AS
    SELECT 
        b.batalian_id,
        b.batalian_name,
        COUNT(s.soldier_id) AS total_soldiers
    FROM
        Batalian b
            LEFT JOIN
        Soldier s ON b.batalian_id = s.batalian_id
    GROUP BY b.batalian_id , b.batalian_name;
    
SELECT 
    *
FROM
    View_BatalianStrength;





