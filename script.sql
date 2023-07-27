CREATE DATABASE record_company;
USE record_company;

CREATE TABLE bands (
	id INT NOT NULL AUTO_INCREMENT,
    name VARCHAR(255) NOT NULL,
    PRIMARY KEY (id)
);
CREATE TABLE albums (
	id INT NOT NULL AUTO_INCREMENT,
    name VARCHAR(255) NOT NULL,
    release_year INT,
    band_id INT NOT NULL,
    PRIMARY KEY (id),
    FOREIGN KEY (band_id) REFERENCES bands(id)
);

INSERT INTO bands (name) VALUES ('Coldplay'), ('Imagine Dragons'), ('Maroon 5'), ('Fifth Harmony');

SELECT * FROM bands;
SELECT * FROM bands LIMIT 2;
SELECT name FROM bands;

SELECT id AS 'ID', name AS 'Band Name' FROM bands;

SELECT * FROM bands ORDER BY name;

INSERT INTO albums (name, release_year, band_id)
VALUES  ('Parachutes', 2000, 1),
		('X&Y', 2005, 1),
        ('Night Visions', 2012, 2),
        ('Hands All Over', 2010, 3),
        ('Reflection', 2015, 4),
        ('Test Album', NULL, 3);
SELECT * FROM albums;

SELECT DISTINCT name FROM albums;

UPDATE albums SET release_year = 2001 WHERE id = 1;

SELECT * FROM albums WHERE release_year < 2010;
SELECT * FROM albums WHERE name LIKE '%n%';
SELECT * FROM albums WHERE name LIKE '%n%' OR band_id = 1;
SELECT * FROM albums WHERE release_year = 2005 AND band_id = 1;
SELECT * FROM albums WHERE release_year BETWEEN 2000 AND 2010;
SELECT * FROM albums WHERE release_year IS NULL;

TRUNCATE TABLE albums;

DELETE FROM albums WHERE id = 6;



SELECT * FROM bands JOIN albums ON bands.id = albums.band_id;


SELECT AVG(release_year) FROM albums;
SELECT SUM(release_year) FROM albums;

SELECT band_id, COUNT(band_id) FROM albums GROUP BY band_id;
