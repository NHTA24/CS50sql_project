# Design Document

By NHUAN TA

Video overview: <https://youtu.be/ufv6k5xGyJE>

## Scope

The database for this CS50 SQL project includes all entities necessary to facilitate the process of tracking the Hematology's core lab orders at the Brigham and Women's Hospital.

* The purpose is to facilitate a quick and efficient way to pull out data of past orders for auditting, monitoring, or future orders references
* Suppliers, including basic information of a supplier
* Items, including basic information regarding nature of the item and where to order
* Catalogs, including the identification numbers associated with the items and who is the supplier
* Orders, which gives the information for past orders according to month and year
* Out of scope are elements like date when orders arrived, what items are back ordered or out of stock, and what items go missing after ordering

## Functional Requirements

Using this database, user can:

* Create, read, update, and delete information regarding suppliers, items, and catalogs.
* Create, read, and update new or old orders. However, deleting a past order is not permitted.

## Representation

Entities are captured in SQLite tables with the following schema.

### Entities

The database includes the following entities:

#### Suppliers

The `suppliers` table includes:
* `id` column specifies unique id for each supplier. Hence, `PRIMARY KEY` constraint was used.
* `name` column specifies the name of corresponding distributor as `TEXT`. The name should be `UNIQUE` because a distributor should not have 2 different ids.
* `delivery_estimate` specifies the number of days `INTEGER NOT NULL` the supplier delivers the goods. A `CHECK` is placed to make sure it is not a negative number.

#### Catalogs

The `catalogs` table includes:
* `id` column specifies unique id for each catalog number provided by the supplier. `PRIMARY KEY` constraint was placed.
* `amount_in` column describes whether the item is shipped in box or one singular item as `TEXT`.
* `price` column specifies what each item costs which be in decimal. Therefore, `NUMERIC` data type was used. There must be a price value `NOT NULL`, and a `CHECK` was placed to make sure the price is not negative.
* `supplier_id` column lists the corresponding supplier id that supplies the catalog numbers which would be in `INTEGER`. This column has the `FOREIGN KEY` constraint that ensures data integrity that references the column `id` from the `suppliers` table.

#### Items

The `items` table includes:
* `id` column specifies unique id for each item which is why `PRIMARY KEY` constarint was placed.
* `name` column specifies the name of the item in `TEXT` and should not be empty `NOT NULL`.
* `supplier_id` column lists the corresponding distributors that will be delivering the products. The constraint `FOREIGN KEY` was placed to reference the table `suppliers` column `id` to ensure data integrity.
* `catalog_id` column signifies the catalog number that represents the item. This column also has the `FOREIGN KEY` constraint that references to the table `catalogs` column `id`.

#### Orders

The `orders` table includes:
* `id` column specifies the unique id that identifies the order which `PRIMARY KEY` constraint was placed.
* `order_number` column is used with type `INTEGER` to record the order number that was given after each order is made.
* `quantity` column also used with type `INTEGER` to specify the number of items placed with the order. A `CHECK` is placed to make sure that this number is not a negative number.
* `date` column records the date that the order was placed using type `DATE` and with constraint `NOT NULL`.
* `item_id` column lists the corresponding ids of the items placed in the order. The constraint `FOREIGN KEY` that references the column `id` of table `items` was used to ensure data integrity.
* `tech` in `TEXT` specifies the name of the laboratory technician who placed the order.

### Relationships

The entity relationship diagram below describes the relationships among the entities in the database.

![ER diagram](orders.png)

From the diagram, the following relationship can be outlined:

* An item can be found with one supplier. A supplier can supply 0 to many items.
* A supplier can provide 0 to many catalog numbers. Each catalog number corresponds to only 1 supplier.
* A catalog number represents only 1 item, and vice versa, an item has only 1 catalog number.
* An order can have 0 to many items, and vice versa, an item can found in 0 to many orders.

## Optimizations

Given the settings of a hospital laboratory where there are hundreds of items and suppliers in the record along with the typical queries in `queries.sql`, indexes were set up to speed up searches.
The indexes `item_id` in `orders` table, `supplier_id` in `catalogs` table, and `catalog_id` in `items` table optimize the speed of searches commonly used in queries.

## Limitations

One limitation of this database is that it lacks real-time order status update. This database is supple in tracking past orders of the lab, however, the current inventory or any back-ordered items would result in manual labor to check.
