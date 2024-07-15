-- Insert values into suppliers table
INSERT INTO "suppliers" ("id", "name", "delivery_estimate")
VALUES
(1, 'Medline', '5-10 days'),
(6, 'Owens & Minor', 'next day'),
(1045,'Fisher', '2 days'),
(3, 'Sigma', '2-3 days'),
(2, 'Smart Works', '2 weeks'),
(4, 'The Allied Group', '2 days'),
(17303, 'VWR International', '3-5 days'),
(271096, 'Westnet', '3-5 days'),
(2881, 'Advanced Instruments', '3-5 days'),
(98691, 'Sysmex', '5-10 days'),
(16299, 'Staples',  '2 days'),
(5, 'Cardinal', '5-10 days'),
(2254, 'Immucor', '5 days'),
(12118, 'Leica Biosystems', '2-3 days'),
(16409, 'Streck Laboratories',  '5-10 days'),
(1459, 'Diagnostica Stago', '2-5 days');


-- Insert values into catalogs table
INSERT INTO "catalogs" ("id", "amount_in", "price", "supplier_id")
VALUES
(90735, 'BX', 0.99, 1),
(344719, 'BX', 0.99, 1),
(10027, 'CS', 22.38, 1),
(1773712, 'CS', 16.96, 1),
(128564, 'PK', 1.36, 1),
(41912, 'BX', 7.92, 1),
(40944,'BX', 6.75, 1),
(112977, 'EA', 300.00, 1459),
(112978, 'EA', 349.82, 1459),
(111013, 'EA', 157.00, 2881),
(111012, 'EA', 242.25, 2881),
(111011, 'EA', 363.75, 2881);


-- Insert values into items table
INSERT INTO "items" ("name", "supplier_id", "catalog_id")
VALUES
('Alcohol Wipes', 1, 90735),
('Bandaids', 1, 344719),
('Bleach', 1, 10027),
('Clorox Bleach', 1, 1773712),
('Gauze Sponge', 1, 128564),
('Gloves_xsmall', 1, 41912),
('Gloves_small', 1, 40944),
('Needle_1', 1459, 112977),
('Needle_2', 1459, 112978),
('Controls', 2881, 111013),
('TNC Reagents', 2881, 111012),
('RBC Reagents', 2881, 111011);


-- Insert values into orders table
INSERT INTO "orders" ("order_number", "quantity", "date", "item_id", "tech")
VALUES
(6734, 2, '2023-09-05', 3, 'Vivian'),
(6734, 1, '2023-09-05', 5, 'Vivian'),
(6734, 5, '2023-09-05', 7, 'Vivian'),
(2535, 5, '2023-11-01', 6, 'Susan'),
(2535, 6, '2023-11-10', 4, 'Susan');


-- Attempt to delete from table "orders"
DELETE FROM "orders"
WHERE "tech" = 'Vivian';


-- Query to find all supliers
SELECT * FROM "suppliers"
ORDER BY "name";


-- Query to find out how many boxes of xsmall gloves was ordered in Nov 23
SELECT "quantity", "amount_in" FROM "orders"
JOIN "items" ON "items"."id" = "orders"."item_id"
JOIN "catalogs" ON "catalogs"."id" = "items"."catalog_id"
WHERE "name" = 'Gloves_xsmall' AND "date" = '2023-11-01';


-- Query to find out who supplies the TNC reagents
SELECT "suppliers"."name" FROM "suppliers"
JOIN "items" ON "items"."supplier_id" = "suppliers"."id"
WHERE "items"."name" = 'TNC Reagents';


-- Query to find the total spent on orders in Nov 23
SELECT SUM("quantity" * "price") AS 'total' FROM "orders"
JOIN "catalogs" ON "items"."catalog_id" = "catalogs"."id"
JOIN "items" ON "items"."id" = "orders"."item_id"
WHERE "date" LIKE "%2023-11%";


-- Query to find the 3 most expensive items with name, price, and suppliers
SELECT "items"."name", "suppliers"."name" AS 'distributor', "price" FROM "items"
JOIN "suppliers" ON "suppliers"."id" = "items"."supplier_id"
JOIN "catalogs" ON "catalogs"."id" = "items"."catalog_id"
ORDER BY "price" DESC
LIMIT 3;


-- Query to update or change the name of tech who ordered
UPDATE "orders"
SET "tech" = (
    SELECT "tech" FROM "orders"
    WHERE "date" = '2023-11-01'
)
WHERE "item_id" = (
    SELECT "id" FROM "items"
    WHERE "name" = 'Bleach'
);
