DROP database if exists Army ;

CREATE DATABASE Army;

USE Army;

show tables;

CREATE TABLE Location (
    location_id INT AUTO_INCREMENT PRIMARY KEY,
    pincode INT NOT NULL UNIQUE,
    location_name VARCHAR(255) NOT NULL
);


-- ---------------------------------------------------------------------------

CREATE TABLE batalian (
	batalian_id int primary key,
    batalian_name VARCHAR(100) NOT NULL,
    captain_name VARCHAR(100) NOT NULL,
    total_capacity INT NOT NULL CHECK (total_capacity > 0)
    
);


-- ---------------------------------------------------------------------------


CREATE TABLE soldier (
    soldier_id INT NOT NULL,
    name VARCHAR(100) NOT NULL,
    post VARCHAR(30) NOT NULL,
	batalian_id int NOT NULL,
    doj DATE NOT NULL, -- date of joining
    dob DATE NOT NULL, -- date of birth
    gender INT NOT NULL CHECK (gender IN (0, 1)), -- Gender 0 for female and 1 for male
    height INT CHECK (height > 152),
    weight INT CHECK (weight > 50),
    chest INT CHECK (chest > 52),
    squad_no INT NOT NULL,
    status VARCHAR(20) DEFAULT 'Active',
    PRIMARY KEY (soldier_id),
    FOREIGN KEY (batalian_id) REFERENCES batalian(batalian_id)
);

alter table soldier add column experience varchar(20) after squad_no;

ALTER TABLE Soldier DROP COLUMN chest;

ALTER TABLE Soldier ADD chest INT CHECK (chest > 30) after weight;

ALTER TABLE Soldier DROP COLUMN year;



desc soldier;
-- ---------------------------------------------------------------------------


CREATE TABLE Inventory (
    inventory_id INT AUTO_INCREMENT PRIMARY KEY,
    weapon_nm VARCHAR(100) NOT NULL,
    category VARCHAR(50) NOT NULL,
    soldier_id INT NOT NULL,
    FOREIGN KEY (soldier_id) REFERENCES Soldier(soldier_id)
);


-- ---------------------------------------------------------------------------


CREATE TABLE Posting (
    posting_id INT AUTO_INCREMENT PRIMARY KEY,
    date DATE NOT NULL,
    soldier_id INT NOT NULL,
    location_id INT NOT NULL,
    FOREIGN KEY (soldier_id) REFERENCES Soldier(soldier_id),
    FOREIGN KEY (location_id) REFERENCES Location(location_id)
);



-- ---------------------------------------------------------------------------


CREATE TABLE Mission (
    mission_id INT AUTO_INCREMENT PRIMARY KEY,
    soldier_id INT NOT NULL,
    mission_name VARCHAR(255) NOT NULL,
    start_date DATE NOT NULL,
    end_date DATE,
    lead_by INT,
    FOREIGN KEY (soldier_id) REFERENCES Soldier(soldier_id),
    FOREIGN KEY (lead_by) REFERENCES Soldier(soldier_id)
);


-- ---------------------------------------------------------------------------
