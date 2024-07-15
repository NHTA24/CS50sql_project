CREATE VIEW "frequently_reviewed" AS
SELECT "listings"."id", "property_type", "host_name", COUNT("reviews"."listing_id") AS 'reviews' FROM "listings"
JOIN "reviews" ON "reviews"."listing_id" = "listings"."id"
GROUP BY "listings"."id"
ORDER BY "reviews" DESC, "property_type" ASC, "host_name" ASC
LIMIT 100;

