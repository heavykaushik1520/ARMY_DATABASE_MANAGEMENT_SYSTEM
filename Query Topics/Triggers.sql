use Army;

-- 1 Trigger ensures that a soldier's height, weight, and chest measurements meet the minimum requirements before they are inserted into the database.

delimiter $$
create  trigger Before_Insert_Soldier
before insert on soldier
for each row
begin
	IF NEW.height <= 152 THEN
		 SET MESSAGE_TEXT = 'Height must be greater than 152 cm.';
	end if;
    
     IF NEW.weight <= 50 THEN
		SET MESSAGE_TEXT = 'Weight must be greater than 50 kg.';
	END IF;
    
    IF NEW.chest <= 30 THEN
		SET MESSAGE_TEXT = 'Chest measurement must be greater than 30 cm.';
	END IF;
    
    
end $$

delimiter ;

-- 2 trigger ensures that when a soldier's post (rank) is updated, the status of the soldier is also updated to "Active".

delimiter $$
create trigger Before_Update_Soldier
before update on soldier
for each row
begin
    IF NEW.post <> OLD.post THEN
        SET NEW.status = 'Active';
    END IF ;
end $$

delimiter ; 

-- 3  trigger logs an entry into a hypothetical audit_log table whenever a new soldier is added.

delimiter $$

create trigger After_Insert_Soldier
after insert on soldier
for each row
begin 
	BEGIN
    INSERT INTO audit_log (action, soldier_id, timestamp)
    VALUES ('INSERT', NEW.soldier_id, NOW());
end 
delimiter ;


-- 4  trigger automatically deletes all associated records in the Posting table when a soldier is removed from the soldier table.
delimiter &&
create trigger After_Delete_Soldier
after delete on soldier
for each row
begin
    DELETE FROM Posting WHERE soldier_id = OLD.soldier_id;
end ;

delimiter ;

