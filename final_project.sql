-- Create Database
CREATE DATABASE DataCinema;

-- Use the created database
USE DataCinema;

-- Create Genres Table
CREATE TABLE Genres (
    genre_id INT AUTO_INCREMENT,
    genre_name VARCHAR(30) NOT NULL,
    CONSTRAINT PK_genre_id PRIMARY KEY (genre_id)
);

-- Create Movies Table
CREATE TABLE Movies (
    movie_id INT AUTO_INCREMENT,
    movie_name VARCHAR(255) NOT NULL,
    duration INT NOT NULL,
    release_year INT NOT NULL,
    genre_id INT NOT NULL,
    CONSTRAINT FK_movie_genre FOREIGN KEY (genre_id) REFERENCES Genres (genre_id),
    CONSTRAINT PK_movie_id PRIMARY KEY (movie_id)
);

-- Create Directors Table
CREATE TABLE Directors (
    director_id INT AUTO_INCREMENT,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    birth_date DATE NOT NULL,
    CONSTRAINT PK_director_id PRIMARY KEY (director_id)
);

-- Create Actors Table
CREATE TABLE Actors (
    actor_id INT AUTO_INCREMENT,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    birth_date DATE NOT NULL,
    CONSTRAINT PK_actor_id PRIMARY KEY (actor_id)
);

-- Create Reviews Table
CREATE TABLE Reviews (
    review_id INT AUTO_INCREMENT,
    review_comment VARCHAR(255),
    rate DECIMAL(2, 1),
    review_date TIMESTAMP,
    movie_id INT NOT NULL,
    CONSTRAINT FK_review_movie FOREIGN KEY (movie_id) REFERENCES Movies (movie_id),
    CONSTRAINT PK_review_id PRIMARY KEY (review_id)
);

-- Create MovieActors Table
CREATE TABLE MovieActors (
    movie_id INT NOT NULL,
    actor_id INT NOT NULL,
    CONSTRAINT FK_movieactor_movie FOREIGN KEY (movie_id) REFERENCES Movies (movie_id),
    CONSTRAINT FK_movieactor_actor FOREIGN KEY (actor_id) REFERENCES Actors (actor_id),
    CONSTRAINT PK_movieactor PRIMARY KEY (movie_id, actor_id)
);

-- Create MovieDirectors Table
CREATE TABLE MovieDirectors (
    movie_id INT NOT NULL,
    director_id INT NOT NULL,
    CONSTRAINT FK_moviedirector_movie FOREIGN KEY (movie_id) REFERENCES Movies (movie_id),
    CONSTRAINT FK_moviedirector_director FOREIGN KEY (director_id) REFERENCES Directors (director_id),
    CONSTRAINT PK_moviedirector PRIMARY KEY (movie_id, director_id)
);

-- Create a View Combining Multiple Tables
-- This view will display movie details including genre, director, and actors
CREATE VIEW MovieDetailsView_2 AS
SELECT 
    M.movie_name, 
    G.genre_name
    -- CONCAT(D.first_name, ' ', D.last_name) AS director_name,
    -- GROUP_CONCAT(CONCAT(A.first_name, ' ', A.last_name) SEPARATOR ', ') AS actor_names -- Concatenate actor names
FROM 
    Movies M
JOIN Genres G ON M.genre_id = G.genre_id
JOIN MovieDirectors MD ON M.movie_id = MD.movie_id
JOIN Directors D ON MD.director_id = D.director_id
JOIN MovieActors MA ON M.movie_id = MA.movie_id
JOIN Actors A ON MA.actor_id = A.actor_id
GROUP BY 
    M.movie_name, G.genre_name; -- director_name;

DELIMITER //
CREATE FUNCTION GetAverageRatingss(movieID INT)
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

SELECT GetAverageRatingss(1);

INSERT INTO Genres(genre_name)
VALUES('Action');

INSERT INTO Movies(movie_name, duration, release_year, genre_id)
VALUES('Tina and Joao', 120, 2024, 1);

CALL AddReview(1, 'Good film', 4.4);
CALL AddReview(1, 'Good film', 2.4);
CALL AddReview(1, 'Good film', 1.4);
CALL AddReview(1, 'Good film', 1.4);

SELECT * FROM Reviews;

-- Example Query with a Subquery
SELECT 
    movie_name, 
    release_year, 
    (SELECT COUNT(*) FROM Reviews WHERE movie_id = M.movie_id) AS review_count
FROM 
    Movies M
WHERE 
    release_year > 2010;

-- Create a Stored Procedure
DELIMITER //
CREATE PROCEDURE AddReview(IN p_movie_id INT, IN p_comment VARCHAR(255), IN p_rate DECIMAL(2, 1))
BEGIN
    INSERT INTO Reviews (movie_id, review_comment, rate, review_date)
    VALUES (p_movie_id, p_comment, p_rate, NOW());
END//
DELIMITER ;

CALL AddReview(1, 'Something', 6);

-- Create a Trigger
DELIMITER //
CREATE TRIGGER BeforeReviewInsert_2
BEFORE INSERT ON Reviews
FOR EACH ROW
BEGIN
    IF NEW.rate < 1 OR NEW.rate > 5 THEN
        SIGNAL SQLSTATE '45000' -- to display msg
        SET MESSAGE_TEXT = 'Rate must be between 1 and 5 7';
    END IF;
END //
DELIMITER ;

-- Example Query with Group By
SELECT 
    movie_id, 
    AVG(rate) AS average_rating, 
    COUNT(review_id) AS number_of_reviews
FROM 
    Reviews
GROUP BY 
    movie_id
HAVING 
    AVG(rate) >= 4 
    AND COUNT(review_id) >= 10;