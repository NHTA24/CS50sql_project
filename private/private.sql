CREATE TABLE "code" (
    "sen_num" INTEGER,
    "cha_num" INTEGER,
    "length" INTEGER
);

INSERT INTO "code" ("sen_num", "cha_num", "length") VALUES
(14, 98, 4),
(114, 3, 5),
(618, 72, 9),
(630, 7, 3),
(932, 12, 5),
(2230, 50, 7),
(2346, 44, 10),
(3041, 14, 5);

CREATE VIEW "message" AS
SELECT substr ("sentence", "cha_num", "length") AS 'phrase' FROM "code"
JOIN "sentences" ON "code"."sen_num" = "sentences"."id";
