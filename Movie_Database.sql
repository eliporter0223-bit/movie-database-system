USE master
GO

IF DB_ID('Movie_DB') IS NOT NULL
BEGIN
    ALTER DATABASE Movie_DB SET SINGLE_USER WITH ROLLBACK IMMEDIATE
    DROP DATABASE Movie_DB
END
GO

CREATE DATABASE Movie_DB
GO

USE Movie_DB
GO

CREATE TABLE Genres (
    GenreID INT PRIMARY KEY,
    GenreCategory VARCHAR(50) NOT NULL
)
GO

CREATE TABLE Movies (
    MovieID INT PRIMARY KEY,
    MovieName VARCHAR(100) NOT NULL,
    ReleaseDate DATE NOT NULL,
    MovieRating DECIMAL(3,1) NOT NULL
)
GO

CREATE TABLE Reviews (
    ReviewID INT PRIMARY KEY,
    ReviewType VARCHAR(50) NOT NULL
)
GO

CREATE TABLE Actors (
    ActorID INT PRIMARY KEY,
    ActorName VARCHAR(100) NOT NULL
)
GO

CREATE TABLE MovieActors (
    MovieID INT NOT NULL,
    ActorID INT NOT NULL,
    PRIMARY KEY (MovieID, ActorID)
)
GO

ALTER TABLE Movies
ADD GenreID INT NOT NULL
GO

ALTER TABLE Movies
ADD CONSTRAINT FK_Movies_Genres
FOREIGN KEY (GenreID)
REFERENCES Genres(GenreID)
GO

ALTER TABLE Reviews
ADD MovieID INT NOT NULL
GO

ALTER TABLE Reviews
ADD CONSTRAINT FK_Reviews_Movies
FOREIGN KEY (MovieID)
REFERENCES Movies(MovieID)
GO

ALTER TABLE MovieActors
ADD CONSTRAINT FK_MovieActors_Movies
FOREIGN KEY (MovieID)
REFERENCES Movies(MovieID)
GO

ALTER TABLE MovieActors
ADD CONSTRAINT FK_MovieActors_Actors
FOREIGN KEY (ActorID)
REFERENCES Actors(ActorID)
GO

INSERT INTO Genres VALUES
(1, 'Action'),
(2, 'Comedy'),
(3, 'Drama')
GO

INSERT INTO Movies VALUES
(1, 'John Wick', '2014-10-24', 8.5, 1),
(2, 'Superbad', '2007-08-17', 7.6, 2),
(3, 'Creed', '2015-11-25', 7.6, 3)
GO

INSERT INTO Reviews VALUES
(1, 'Positive', 1),
(2, 'Negative', 2),
(3, 'Neutral', 3)
GO

INSERT INTO Actors VALUES
(1, 'Keanu Reeves'),
(2, 'Michael Cera'),
(3, 'Jonah Hill'),
(4, 'Michael B. Jordan')
GO

INSERT INTO MovieActors VALUES
(1, 1),
(2, 2),
(2, 3),
(3, 4)
GO

SELECT * FROM Genres
SELECT * FROM Movies
SELECT * FROM Reviews
SELECT * FROM Actors
SELECT * FROM MovieActors
GO

SELECT Movies.MovieName, Genres.GenreCategory
FROM Movies
JOIN Genres
ON Movies.GenreID = Genres.GenreID
GO

SELECT Movies.MovieName, Reviews.ReviewType
FROM Reviews
JOIN Movies
ON Reviews.MovieID = Movies.MovieID
GO

SELECT Movies.MovieName, Actors.ActorName
FROM MovieActors
JOIN Movies
ON MovieActors.MovieID = Movies.MovieID
JOIN Actors
ON MovieActors.ActorID = Actors.ActorID
GO

SELECT *
FROM Movies
WHERE MovieRating > 8
GO

UPDATE Movies
SET MovieRating = 9.0
WHERE MovieID = 1
GO

SELECT * FROM Movies
GO

DELETE FROM Reviews
WHERE ReviewID = 2
GO

SELECT * FROM Reviews
GO