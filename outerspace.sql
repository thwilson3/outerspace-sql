CREATE TABLE stars (
    star_name VARCHAR(40) PRIMARY KEY,
    temp_kelvin FLOAT NOT NULL
);

CREATE TABLE planets (
    planet_name VARCHAR(40) PRIMARY KEY,
    orbital_years FLOAT NOT NULL,
    star_orbit VARCHAR(40) NOT NULL REFERENCES stars
);

CREATE TABLE moons (
    moon_name VARCHAR(40) PRIMARY KEY,
    planet_orbit VARCHAR(40) NOT NULL REFERENCES planets
);