CREATE TABLE film(
	film_id INT NOT NULL AUTO_INCREMENT,
	title VARCHAR(200) ,
	description TEXT ,
	release_year DATE,
	CONSTRAINT pk_film_id PRIMARY KEY (film_id)
);

CREATE TABLE actor(
	actor_id INT NOT NULL AUTO_INCREMENT,
	firs_name VARCHAR(50),
	last_name VARCHAR(50),
	CONSTRAINT pk_actor_id PRIMARY KEY (actor_id)
);

CREATE TABLE film_actor (
	actor_id INT NOT NULL ,
	film_id INT NOT NULL
);

ALTER TABLE film ADD COLUMN last_update TIMESTAMP;
ALTER TABLE actor ADD COLUMN last_update TIMESTAMP;

ALTER TABLE film_actor ADD CONSTRAINT fk_film_actor FOREIGN KEY (film_id) REFERENCES film(film_id);
ALTER TABLE film_actor ADD CONSTRAINT fk_film_actor_actorid FOREIGN KEY (actor_id) REFERENCES actor(actor_id);

INSERT INTO imdb.actor
(firs_name, last_name, last_update)
VALUES('NEMO', 'DORY', CURRENT_TIMESTAMP);


INSERT INTO imdb.actor
(firs_name, last_name, last_update)
VALUES('GONZALO', 'MUNOZ', CURRENT_TIMESTAMP);

INSERT INTO imdb.film
(title, description, release_year, last_update)
VALUES('BUSCANDO A NEMO', 'NEMO Y DORY', '2012-02-11', CURRENT_TIMESTAMP);

INSERT INTO imdb.film
(title, description, release_year, last_update)
VALUES('GOL', 'FUTBOL', '2010-09-06', CURRENT_TIMESTAMP);







