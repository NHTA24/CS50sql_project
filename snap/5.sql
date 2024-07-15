SELECT "friend_id" FROM "friends"
WHERE "friend_id" IN (
    SELECT "friends"."friend_id" FROM "friends"
    JOIN "users" ON "users"."id" = "friends"."user_id"
    WHERE "username" = 'lovelytrust487'

    INTERSECT

    SELECT "friends"."friend_id" FROM "friends"
    JOIN "users" ON "users"."id" = "friends"."user_id"
    WHERE "username" = 'exceptionalinspiration482'
);

