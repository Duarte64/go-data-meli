DROP DATABASE IF EXISTS emple_dep;
CREATE DATABASE emple_dep;
USE emple_dep;

CREATE TABLE departamento (
    `id` INT PRIMARY KEY UNIQUE AUTO_INCREMENT,
    `nome` VARCHAR(30),
    `endereco` VARCHAR(50)
);

CREATE TABLE colaboradores (
    `id` INT PRIMARY KEY UNIQUE AUTO_INCREMENT,
    `num_arquivo` INT,
    `nome` VARCHAR(30),
    `sobrenome` VARCHAR(30),
    `data_nascimento` DATE,
    `data_incorporacao` DATE,
    `cargo` VARCHAR(30),
    `salario` DECIMAL(10, 2),
    `departamento_id` INT,
    FOREIGN KEY (departamento_id) REFERENCES departamento(id)
);

INSERT INTO departamento (nome, endereco) VALUES
('TI', 'Rua da TI'),
('RH', 'Rua do RH'),
('Financeiro', 'Rua do Financeiro'),
('Comercial', 'Rua do Comercial'),
('Marketing', 'Rua do Marketing');

INSERT INTO colaboradores (num_arquivo, nome, sobrenome, data_nascimento, data_incorporacao, cargo, salario, departamento_id) VALUES
(123, 'João', 'Silva', '1990-01-01', '2010-01-01', 'Desenvolvedor', 5000.00, 1),
(124, 'Maria', 'Santos', '1991-01-01', '2011-01-01', 'Analista de RH', 4000.00, 2),
(125, 'José', 'Oliveira', '1992-01-01', '2012-01-01', 'Analista Financeiro', 3000.00, 3),
(126, 'Ana', 'Costa', '1993-01-01', '2013-01-01', 'Vendedor', 2000.00, 4),
(127, 'Carlos', 'Rocha', '1994-01-01', '2014-01-01', 'Analista de Marketing', 1000.00, 5),
(128, 'Mariana', 'Ferreira', '1995-01-01', '2015-01-01', 'Desenvolvedor', 6000.00, 1),
(129, 'Pedro', 'Mendes', '1996-01-01', '2016-01-01', 'Analista de RH', 7000.00, 2),
(130, 'Paula', 'Almeida', '1997-01-01', '2017-01-01', 'Analista Financeiro', 8000.00, 3),
(131, 'Felipe', 'Pereira', '1998-01-01', '2018-01-01', 'Vendedor', 9000.00, 4),
(132, 'Fernanda', 'Gomes', '1999-01-01', '2019-01-01', 'Analista de Marketing', 10000.00, 5),
(133, 'Rafael', 'Rodrigues', '2000-01-01', '2020-01-01', 'Desenvolvedor', 11000.00, 1),
(134, 'Roberta', 'Oliveira', '2001-01-01', '2021-01-01', 'Analista de RH', 12000.00, 2),
(135, 'Ricardo', 'Costa', '2002-01-01', '2022-01-01', 'Analista Financeiro', 13000.00, 3),
(136, 'Renata', 'Rocha', '2003-01-01', '2023-01-01', 'Vendedor', 14000.00, 4),
(137, 'Rita', 'Rocha', '2004-01-01', '2024-01-01', 'Analista de Marketing', 15000.00, 5);

--Uma vez que o banco de dados foi modelado e levantado, responda às seguintes perguntas:

--a. Qual é a chave primária da tabela de funcionários? Justifique a resposta.
-- A chave primária da tabela de funcionários é o campo id, pois é um campo único e autoincrementável, responsável por identificar cada registro de forma única.

-- b. Qual é a chave primária para a tabela de departamentos? Justifique a resposta.
-- A chave primária da tabela de departamentos é o campo id, pois é um campo único e autoincrementável, responsável por identificar cada registro de forma única.

-- c. Que relacionamento(s) existiriam entre as tabelas? Em qual tabela deve haver chave estrangeira? A qual campo de qual tabela essa chave estrangeira se refere? Justifique a resposta.
-- O relacionamento entre as tabelas é de um para muitos, onde um departamento pode ter vários colaboradores, mas um colaborador só pode pertencer a um departamento. A tabela de colaboradores deve ter a chave estrangeira, que se refere ao campo id da tabela de departamentos, pois cada colaborador deve pertencer a um departamento.