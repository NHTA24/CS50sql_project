-- Information of suppliers
CREATE TABLE "suppliers" (
    "id" INTEGER,
    "name" TEXT NOT NULL UNIQUE,
    "delivery_estimate" INTEGER NOT NULL CHECK ("delivery_estimate" > 0),
    PRIMARY KEY ("id")
);

-- Information of catalog numbers that indicate items
CREATE TABLE "catalogs" (
    "id" INTEGER,
    "amount_in" TEXT,
    "price" NUMERIC NOT NULL CHECK ("price" > 0),
    "supplier_id" INTEGER,
    PRIMARY KEY ("id"),
    FOREIGN KEY ("supplier_id") REFERENCES "suppliers"("id")
);

-- Information on items needed to be ordered in the lab
CREATE TABLE "items" (
    "id" INTEGER,
    "name" TEXT NOT NULL,
    "supplier_id" INTEGER,
    "catalog_id" INTEGER,
    PRIMARY KEY ("id"),
    FOREIGN KEY ("supplier_id") REFERENCES "suppliers"("id"),
    FOREIGN KEY ("catalog_id") REFERENCES "catalogs"("id")
);

-- Information on past orders
CREATE TABLE "orders" (
    "id" INTEGER,
    "order_number" INTEGER,
    "quantity" INTEGER CHECK ("quantity" >= 0),
    "date" DATE NOT NULL,
    "item_id" INTEGER,
    "tech" TEXT,
    PRIMARY KEY ("id"),
    FOREIGN KEY ("item_id") REFERENCES "items"("id")
);

-- Prevent deletion on past orders
CREATE TRIGGER "NoDeletion"
BEFORE DELETE ON "orders"
BEGIN
    SELECT RAISE(FAIL, 'Deletion of order rows is not allowed.');
END;

-- Indexes to speed up search
CREATE INDEX "order_search" ON "orders" ("item_id");
CREATE INDEX "catalog_search" ON "catalogs" ("supplier_id");
CREATE INDEX "item_search" ON "items" ("catalog_id");
