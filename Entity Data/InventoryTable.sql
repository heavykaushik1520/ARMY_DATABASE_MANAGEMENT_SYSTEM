USE Army;

INSERT INTO Inventory (inventory_id, weapon_nm, category, soldier_id)
VALUES
(1, 'AK-47', 'Rifle', 8),
(2, 'Glock 19', 'Pistol', 3),
(3, 'M4 Carbine', 'Rifle', 10),
(4, 'Beretta 92FS', 'Pistol', 15),
(5, 'AR-15', 'Rifle', 2),
(6, 'FN FAL', 'Rifle', 14),
(7, 'MP5', 'Submachine gun', 19),
(8, 'Heckler & Koch G36', 'Rifle', 6),
(9, 'SIG Sauer P226', 'Pistol', 11),
(10, 'FN SCAR', 'Rifle', 13),
(11, 'AK-74', 'Rifle', 4),
(12, 'Glock 17', 'Pistol', 9),
(13, 'M16A4', 'Rifle', 12),
(14, 'Beretta 92X', 'Pistol', 1),
(15, 'AR-15 A2', 'Rifle', 7),
(16, 'FN FAL L1A1', 'Rifle', 17),
(17, 'MP5K', 'Submachine gun', 5),
(18, 'Heckler & Koch G36C', 'Rifle', 20),
(19, 'SIG Sauer P229', 'Pistol', 16),
(20, 'FN SCAR H', 'Rifle', 18);


select * from inventory;