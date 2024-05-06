-- Explique o conceito de normalização e por que ele é usado.
-- A normalização é um processo de padronização e validação de dados que consiste em eliminar 
-- redundâncias e inconsistências em um banco de dados.

-- Adicione um filme à tabela de filmes.
INSERT INTO movies (created_at, title, rating, release_date, awards, genre_id, length) VALUES ('2021-09-01', 'Pobres Criaturas', 9.3, '2023-12-08', 3, 1, 141)

-- Adicione um gênero à tabela de gêneros.
INSERT INTO genres (created_at, name, ranking, active) VALUES ('2024-05-06', 'Comédia Romântica', 13, 1);

-- Associe o filme do Ex 2. ao gênero criado no Ex 3.
UPDATE movies SET genre_id = 13 WHERE ID = 23

-- Modifique a tabela de atores para que pelo menos um ator tenha o filme adicionado no Ex.2 como favorito.
UPDATE actors SET favorite_movie_id = 23 WHERE id = 14

-- Crie uma cópia de tabela temporária da tabela de filmes.
CREATE TEMPORARY TABLE movies_backup SELECT * FROM movies;
SELECT * FROM movies_backup

-- Elimine dessa tabela temporária todos os filmes que ganharam menos de 5 prêmios.
CREATE TEMPORARY TABLE movies_backup SELECT * FROM movies WHERE NOT awards < 5;
SELECT * FROM movies_backup

-- Obtenha a lista de todos os gêneros que possuem pelo menos um filme.
SELECT DISTINCT genres.name FROM genres INNER JOIN movies ON genres.id = movies.genre_id

-- Obtenha a lista de atores cujo filme favorito ganhou mais de 3 prêmios.
SELECT actors.first_name, actors.last_name, movies.title, movies.awards FROM actors INNER JOIN movies ON actors.favorite_movie_id = movies.id WHERE movies.awards > 3

-- Use o plano de explicação para analisar as consultas em Ex.6 e 7.
-- -----------

-- O que são índices? Para que servem?
-- São mecanimos para otimizar consultas SQL, trazendo melhora de desempenho em consultas complexas, pois
-- fornecem caminhos diretos para os registros.

-- Crie um índice no nome na tabela de filmes. 
CREATE INDEX idx_name ON movies (title);

-- Verifique se o índice foi criado corretamente.
SHOW INDEX FROM movies;