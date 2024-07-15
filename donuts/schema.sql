CREATE TABLE ingredients (
    "id" INTEGER,
    "name" TEXT,
    "price_per_unit" FLOAT,
    "unit" TEXT,
    PRIMARY KEY ("id")
);

CREATE TABLE donuts (
    "id" INTEGER,
    "name" TEXT,
    "is_gluten_free" BOOLEAN,
    "price_per_donut" REAL,
    PRIMARY KEY ("id")
);

CREATE TABLE donut_ingredients (
    "donut_id" INTEGER,
    "ingredient_id" INTEGER,
    PRIMARY KEY ("donut_id", "ingredient_id"),
    FOREIGN KEY ("donut_id") REFERENCES "donuts"("id"),
    FOREIGN KEY ("ingredient_id") REFERENCES "ingredients"("id")
);

CREATE TABLE customers (
    "id" INTEGER
    "first_name" TEXT,
    "last_name" TEXT,
    PRIMARY KEY ("id")
);

CREATE TABLE orders (
    "id" INTEGER,
    "customer_id" INTEGER,
    PRIMARY KEY ("id"),
    FOREIGN KEY ("customer_id") REFERENCES "customers"("id")
);

CREATE TABLE donut_orders (
    "order_id" INTEGER,
    "donut_id" INTEGER,
    "donut_count" INTEGER,
    PRIMARY KEY ("order_id", "donut_id"),
    FOREIGN KEY ("order_id") REFERENCES "orders"("id"),
    FOREIGN KEY ("donut_id") REFERENCES "donuts"("id")
);
