CREATE TABLE passengers (
    id INTEGER,
    first_name TEXT,
    last_name TEXT,
    age INTEGER,
    PRIMARY KEY(id)
);

CREATE TABLE airlines (
    id INTEGER,
    name TEXT,
    concourse TEXT,
    PRIMARY KEY(id)
);

CREATE TABLE flights (
    id INTEGER,
    flight_number INTEGER,
    airline_id INTEGER,
    destination TEXT,
    departure_location TEXT,
    departure_time DATETIME,
    arrival_time DATETIME,
    PRIMARY KEY(id),
    FOREIGN KEY(airline_id) REFERENCES airlines(id)
);

CREATE TABLE check_ins (
    id INTEGER,
    datetime DATETIME,
    passenger_id INTEGER,
    flight_id INTEGER,
    PRIMARY KEY(id),
    FOREIGN KEY(passenger_id) REFERENCES passengers(id),
    FOREIGN KEY(flight_id) REFERENCES flights(id)
);
