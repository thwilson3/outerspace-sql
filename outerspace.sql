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

INSERT INTO stars (star_name, temp_kelvin)
VALUES
    ('The Sun', 5800),
    ('Proxima Centauri', 3042),
    ('Gliese 876', 3192);

INSERT INTO planets (planet_name, orbital_years, star_orbit)
VALUES
    ('Earth', 1.00, 'The Sun'),
    ('Mars', 1.882, 'The Sun'),
    ('Venus', 0.62, 'The Sun'),
    ('Proxima Centauri b', .03, 'Proxima Centauri'),
    ('Gliese 876 b', .236, 'Gliese 876');

INSERT INTO moons (moon_name, planet_orbit)
VALUES
    ('The Moon', 'Earth'),
    ('Phobos', 'Mars'),
    ('Deimos', 'Mars');


SELECT planet_name, star_name, COUNT(moon_name) AS moon_count
FROM planets AS p
JOIN stars AS s ON (p.star_orbit = s.star_name)
LEFT JOIN moons AS m ON (p.planet_name = m.planet_orbit)
GROUP BY p.planet_name, s.star_name
ORDER BY p.planet_name;



