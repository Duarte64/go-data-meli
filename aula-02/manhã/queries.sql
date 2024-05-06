-- Mostre o título e o nome do gênero de todas as séries.
SELECT series.title, genres.name FROM series LEFT JOIN genres ON series.genre_id = genres.id
-- Mostre o título dos episódios, o nome e sobrenome dos atores que trabalham em cada um deles.
SELECT episodes.title, actors.first_name, actors.last_name FROM actor_episode LEFT JOIN actors ON actors.id = actor_episode.actor_id LEFT JOIN episodes ON episodes.id = actor_episode.episode_id;
-- Mostre o título de todas as séries e o número total de temporadas que cada uma delas possui.
SELECT series.title, COUNT(seasons.id) as temporadas FROM seasons LEFT JOIN series ON series.id = seasons.serie_id GROUP BY serie_id
-- Mostre o nome de todos os gêneros e o número total de filmes de cada um, desde que seja maior ou igual a 3.
SELECT genres.name, COUNT(movies.id) as filmes FROM movies LEFT JOIN genres ON genres.id = movies.genre_id GROUP BY genre_id HAVING filmes >= 3
-- Mostre apenas o nome e sobrenome dos atores que atuam em Titanic e que estes não se repitam.
SELECT DISTINCT actors.first_name, actors.last_name FROM actor_movie LEFT JOIN actors ON actors.id = actor_movie.actor_id LEFT JOIN movies ON movies.id = actor_movie.movie_id WHERE movies.title LIKE "%Titanic%"