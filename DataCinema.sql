-- Create relational DB of your choice with minimum 5 tables
-- Set Primary and Foreign key
CREATE DATABASE DataCinema;

USE DataCinema;
 
CREATE TABLE Genres (
	genre_id INT NOT NULL,
	genre_name VARCHAR(30) NOT NULL,
	CONSTRAINT PK_genre_id PRIMARY KEY (genre_id)
);

CREATE TABLE Movies (
	movie_id INT NOT NULL,
	movie_name VARCHAR(255) NOT NULL,
	duration INT NOT NULL,
	release_year INT NOT NULL,
	genre_id INT NOT NULL,
	CONSTRAINT FK_movie_genre_id FOREIGN KEY (genre_id)
	REFERENCES Genres (genre_id),
	CONSTRAINT PK_movie_id PRIMARY KEY (movie_id)
);

CREATE TABLE Directors (
	director_id INT NOT NULL,
	movie_id INT NOT NULL,
	first_name VARCHAR(50) NOT NULL,
	last_name VARCHAR(50) NOT NULL,
	birth_date DATE NOT NULL,
	CONSTRAINT PK_director_id PRIMARY KEY (director_id)
);

CREATE TABLE Actors (
	actor_id INT NOT NULL,
	movie_id INT NOT NULL,
	first_name VARCHAR(50) NOT NULL,
	last_name VARCHAR(50) NOT NULL,
	birth_date DATE NOT NULL,
	CONSTRAINT PK_actor_id PRIMARY KEY (actor_id)
);

CREATE TABLE Reviews (
	review_id INT NOT NULL,
	review_comment VARCHAR(255),
	rate DECIMAL(2, 1) NOT NULL,
	review_date TIMESTAMP,
	movie_id INT NOT NULL,
	CONSTRAINT FK_review_movie_id FOREIGN KEY (movie_id)
    REFERENCES Movies (movie_id),
	CONSTRAINT PK_review_id PRIMARY KEY (review_id)
);

CREATE TABLE Movie_actors (
    movie_id INT NOT NULL,
    actor_id INT NOT NULL,
    CONSTRAINT FK_movieactor_movie FOREIGN KEY (movie_id)
    REFERENCES Movies (movie_id),
    CONSTRAINT FK_movieactor_actor FOREIGN KEY (actor_id)
    REFERENCES Actors (actor_id),
    CONSTRAINT PK_movieactor PRIMARY KEY (movie_id, actor_id)
);

CREATE TABLE Movie_directors (
    movie_id INT NOT NULL,
    director_id INT NOT NULL,
    CONSTRAINT FK_moviedirector_movie FOREIGN KEY (movie_id)
    REFERENCES Movies (movie_id),
    CONSTRAINT FK_moviedirector_director FOREIGN KEY (director_id)
    REFERENCES Directors (director_id),
    CONSTRAINT PK_moviedirector PRIMARY KEY (movie_id, director_id)
);

INSERT INTO Genres 
(genre_id, genre_name)
VALUES
(1, 'Comedy'),
(2, 'Action'),
(3, 'Romantic'),
(4, 'Horror'),
(5, 'Drama'),
(6, 'Sci-Fi');

INSERT INTO Movies 
(movie_id, movie_name, duration, release_year, genre_id)
VALUES
(1, 'Happy Gilmore', 92, 1996, 1),
(2, 'Die Hard', 132, 1988, 2),
(3, 'The Notebook', 123, 2004, 3),
(4, 'The Conjuring', 112, 2013, 4),
(5, 'Forrest Gump', 142, 1994, 5),
(6, 'Inception', 148, 2010, 6);

INSERT INTO Movies 
(movie_id, movie_name, duration, release_year, genre_id)
VALUES
(7, 'The Waterboy', 90, 1998, 1),
(8, 'Grown Ups', 102, 2010, 1),
(9, 'Grown Ups 2', 101, 2013, 1),
(10, 'Just Go With It', 92, 1996, 1);

INSERT INTO Directors 
(director_id, movie_id, first_name, last_name, birth_date)
VALUES
(1, 1, 'Adam', 'Sandler', '1966-09-09'),
(2, 2, 'Dennis', 'Dugan', '1951-09-26'),
(3, 3, 'John', 'McTiernan', '1952-01-08'),
(4, 4, 'Nick', 'Cassavetes', '1959-05-21'),
(5, 5, 'James', 'Wan', '1977-02-26');

INSERT INTO Actors 
(actor_id, movie_id, first_name, last_name, birth_date)
VALUES
(1, 1, 'Adam', 'Sandler', '1966-09-09'),
(2, 2, 'Bruce', 'Willis', '1955-03-19'),
(3, 3, 'Rachel', 'McAdams', '1978-11-17'),
(4, 4, 'Vera', 'Farmiga', '1973-08-06');

INSERT INTO Reviews 
(review_id, review_comment, rate, review_date, movie_id)
VALUES
(1, NULL, 4.5, '2024-07-20 10:30:00', 1),
(2, 'Good action movie', 4.1, '2024-07-20 11:00:00', 2),
(3, 'Excellent performances <3', 4.7, '2024-07-20 11:30:00', 3),
(4, 'Scarriest horror film.', 5, '2024-07-20 12:00:00', 4),
(5, 'Little bit boring', 3, '2024-07-20 12:30:00', 5),
(6, 'No plot.', 2.1, '2024-07-20 13:00:00', 6),
(7, 'Another great comedy from Adam Sandler.', 5, '2024-07-20 13:30:00', 7),
(8, 'Basic', 1, '2024-07-20 14:00:00', 8),
(9, 'hilarious cast', 2.2, '2024-07-20 14:30:00', 9),
(10, 'Not too good :/', 3.5, '2024-07-20 15:00:00', 10),
(11, 'hahaha', 5, '2024-07-20 14:30:00', 9),
(12, 'goog Adam Sandler', 4, '2024-07-20 14:30:00', 9),
(13, 'goog Adam Sandler', 3, '2024-07-20 14:30:00', 10),
(14, 'lol', 3, '2024-07-20 14:30:00', 8),
(15, 'fun', 4, '2024-07-20 14:30:00', 1);

INSERT INTO Movie_actors (movie_id, actor_id)
VALUES
(1, 1),  -- Adam Sandler in Happy Gilmore
(2, 2),  -- Bruce Willis in Die Hard
(3, 3),  -- Rachel McAdams in The Notebook
(4, 4),  -- Vera Farmiga in The Conjuring
(1, 2);  -- Another actor in Happy Gilmore

INSERT INTO Movie_directors (movie_id, director_id)
VALUES
(1, 1),  -- Adam Sandler directs Happy Gilmore
(2, 2),  -- Dennis Dugan directs Die Hard
(3, 3),  -- John McTiernan directs The Notebook
(4, 4),  -- Nick Cassavetes directs The Conjuring
(5, 5);  -- James Wan directs Forrest Gump

-- Using any type of the joins create a view that combines multiple tables in a logical way

CREATE VIEW Best_rated_movies
AS
	SELECT
		m.movie_id,
		m.movie_name,
		g.genre_name,
		AVG(r.rate) AS average_rating
	FROM Movies m
	JOIN Genres g ON m.genre_id = g.genre_id
	JOIN Reviews r ON m.movie_id = r.movie_id
	GROUP BY 
		movie_id, 
		m.movie_name, 
		g.genre_name
	HAVING
		AVG(r.rate) > 4
	ORDER BY 
		average_rating DESC;

SELECT * FROM Best_rated_movies;

-- In your database, create a stored function that can be applied to a query in your DB;

DELIMITER //
CREATE FUNCTION GetAverageRatings (movieID INT)
RETURNS DECIMAL(3, 2)
   DETERMINISTIC
BEGIN
    DECLARE avg_rating DECIMAL(3, 2);
    SELECT AVG(rate) INTO avg_rating
    FROM Reviews
    WHERE movie_id = movieID;
    RETURN avg_rating;
END //
DELIMITER ;

SELECT GetAverageRatings(8);

-- Prepare an example query with a subquery to demonstrate how to extract data from your DB for analysis

SELECT
    movie_name, 
    release_year, 
    (SELECT COUNT(*) FROM Reviews WHERE movie_id = M.movie_id) AS review_count
FROM 
    Movies M
WHERE 
	genre_id IN (
		SELECT genre_id FROM Genres 
		WHERE genre_name = 'Comedy'
);

-- In your database, create a stored procedure and demonstrate how it runs

DELIMITER //
CREATE PROCEDURE AddReview(IN p_review_id INT, IN p_comment VARCHAR(255), IN p_rate DECIMAL(2, 1), IN p_movie_id INT)
BEGIN
    INSERT INTO Reviews (review_id, review_comment, rate, review_date, movie_id)
    VALUES (p_review_id, p_comment, p_rate, NOW(), p_movie_id);
END//
DELIMITER ;

CALL AddReview(99, 'Something', 2.1, 8);
CALL AddReview(67, 'Something else', 6, 8);

SELECT * FROM Reviews;

-- In your database, create a trigger and demonstrate how it runs

DELIMITER //
CREATE TRIGGER ReviewErrorMessage
BEFORE INSERT ON Reviews
FOR EACH ROW
BEGIN
    IF NEW.rate < 1 OR NEW.rate > 5 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Please put a rate between 1 and 5';
    END IF;
END //
DELIMITER ;

CALL AddReview(17, 'okay', 6, 8);

INSERT INTO Reviews 
(review_id, review_comment, rate, review_date, movie_id)
VALUES
(81, 'okay', 5.1, '2024-07-20 10:30:00', 1);