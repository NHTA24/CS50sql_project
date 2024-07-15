CREATE TABLE users (
    "id" INTEGER,
    "first_name" TEXT,
    "last_name" TEXT,
    "username" TEXT UNIQUE,
    "pass_word" TEXT,
    PRIMARY KEY ("id")
);

CREATE TABLE schools_universities (
    "id" INTEGER,
    "school_name" TEXT,
    "school_location" TEXT,
    "school_year" INTEGER,
    PRIMARY KEY ("id")
);

CREATE TABLE companies (
    "id" INTEGER,
    "company_industry" TEXT,
    "company_location" TEXT,
    PRIMARY KEY ("id")
);

CREATE TABLE user_connection (
    "user_A" INTEGER,
    "user_B" INTEGER,
    PRIMARY KEY ("user_A", "user_B"),
    FOREIGN KEY ("user_A") REFERENCES "users"("id"),
    FOREIGN KEY ("user_B") REFERENCES "users"("id")
);

CREATE TABLE school_connection (
    "user_id" INTEGER,
    "school_id" INTEGER,
    "start_date" DATE,
    "end_date" DATE,
    "degree" TEXT,
    PRIMARY KEY ("user_id", "school_id"),
    FOREIGN KEY ("user_id") REFERENCES "users"("id"),
    FOREIGN KEY ("school_id") REFERENCES schools_universities("id")
);

CREATE TABLE company_connection (
    "user_id" INTEGER,
    "company_id" INTEGER,
    "start_date" DATE,
    "end_date" DATE,
    "title" TEXT,
    PRIMARY KEY ("user_id", "company_id"),
    FOREIGN KEY ("user_id") REFERENCES "users"("id"),
    FOREIGN KEY ("company_id") REFERENCES "companies"("id")
);
