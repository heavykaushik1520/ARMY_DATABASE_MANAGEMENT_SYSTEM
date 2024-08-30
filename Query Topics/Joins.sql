use Army;

-- 1 . Retrieve the names of soldiers and the names of their respective battalions.
select s.name, b.batalian_name
from Soldier s
inner join batalian b ON s.batalian_id = b.batalian_id;

-- 2 .  Count the number of soldiers in each battalion.
select b.batalian_name, COUNT(s.soldier_id) AS number_of_soldiers
from Soldier s
inner join batalian b ON s.batalian_id = b.batalian_id
GROUP BY b.batalian_name;


-- 3 . Retrieve all soldiers and their postings. Include soldiers who do not have any postings.
select s.name, p.date
from Soldier s
left join Posting p ON s.soldier_id = p.soldier_id;

-- 4 . List all soldiers and their mission names. Include soldiers who do not have any missions assigned.
select s.name, m.mission_name
from Soldier s
left join Mission m ON s.soldier_id = m.soldier_id;

-- 5 .  Retrieve all postings and the names of soldiers assigned to those postings. Include postings that do not have an assigned soldier.
select p.date, s.name
from Posting p
right join Soldier s ON p.soldier_id = s.soldier_id;

-- 6 . List all locations and the names of soldiers posted at those locations. Include locations that do not have any soldiers posted
select l.location_name, s.name
from Location l
right join Posting p ON l.location_id = p.location_id
right join Soldier s ON p.soldier_id = s.soldier_id;

-- 7 . Retrieve all soldiers and all postings. Include soldiers without postings and postings without soldiers.
select s.name AS soldier_name, p.date
from Soldier s
left join Posting p ON s.soldier_id = p.soldier_id
UNION
select s.name AS soldier_name, p.date
from Posting p
left join Soldier s ON p.soldier_id = s.soldier_id;






