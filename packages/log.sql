
-- *** The Lost Letter ***
-- To find the address id of sender
SELECT * FROM addresses
WHERE address = "900 Somerville Avenue";
-- To find the address id of receiver
SELECT * FROM addresses
WHERE address LIKE "2 Fin%";
-- To find the package id of the letter
SELECT * FROM packages
WHERE from_address_id = 432 AND to_address_id = 854;
-- To find the information regarding the letter
SELECT * FROM scans
WHERE package_id = 384;
-- *** The Devious Delivery ***
-- To find information of the unknown sender package
SELECT * FROM packages
WHERE from_address_id IS NULL;
-- To find information of address id
SELECT * FROM scans
WHERE package_id = "5098";
-- To find info of where it ends up
SELECT * FROM addresses
WHERE id = 348;

-- *** The Forgotten Gift ***
--To find address id of sender
SELECT * FROM addresses
WHERE address = "109 Tileston Street";
--To find address id of receiver
SELECT * FROM addresses
WHERE address = "728 Maple Place";
--To find the package id
SELECT * FROM packages
WHERE from_address_id = 9873 AND to_address_id = 4983;
--To find where the package is
SELECT * FROM scans
WHERE package_id = 9523;
--To find who has the package
SELECT * FROM drivers
WHERE id = 17;

