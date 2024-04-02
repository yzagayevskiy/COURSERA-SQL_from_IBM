-- Exercises
-- SELECT Statement
SELECT Locations, FunFacts FROM FilmLocations;

SELECT Title, ReleaseYear, Locations FROM FilmLocations WHERE ReleaseYear<=2000;

SELECT Title, ProductionCompany, Locations, ReleaseYear FROM FilmLocations WHERE Writer<>"James Cameron";

-- COUNT, DISTINCT, LIMIT Expressions
SELECT COUNT(Locations) FROM FilmLocations WHERE Director="Woody Allen";

SELECT Count(Title) FROM FilmLocations WHERE Locations="Russian Hill";

SELECT Count(*) FROM FilmLocations WHERE ReleaseYear<1950;

SELECT DISTINCT Title, ReleaseYear FROM FilmLocations WHERE ReleaseYear>=2001;

SELECT DISTINCT Title, Director FROM FilmLocations WHERE Locations="City Hall";

SELECT COUNT(DISTINCT Distributor) FROM FilmLocations WHERE Actor1="Clint Eastwood";

SELECT DISTINCT Title FROM FilmLocations LIMIT 50;

SELECT DISTINCT Title FROM FilmLocations WHERE ReleaseYear=2015 LIMIT 10;

SELECT DISTINCT Title FROM FilmLocations WHERE ReleaseYear=2015 LIMIT 3 OFFSET 5;

-- INSERT, UPDATE, DELETE Statements
INSERT INTO Instructor(ins_id, lastname, firstname, city, country)
VALUES(7, 'Cangiano', 'Antonio', 'Vancouver', 'CA');
SELECT * FROM Instructor;

INSERT INTO Instructor(ins_id, lastname, firstname, city, country)
VALUES(8, 'Ryan', 'Steve', 'Barlby', 'GB'), (9, 'Sannareddy', 'Ramesh', 'Hyderabad', 'IN');
SELECT * FROM Instructor;

UPDATE Instructor 
SET city='Markham' 
WHERE ins_id=1;
SELECT * FROM Instructor;

UPDATE Instructor
SET city='Dhakla', country='BD'
WHERE ins_id=4;
SELECT * FROM Instructor;

DELETE FROM Instructor
WHERE firstname='Hima';
SELECT * FROM Instructor;
