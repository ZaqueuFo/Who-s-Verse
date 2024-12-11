-- Arquivo de apoio, caso você queira criar tabelas como as aqui criadas para a API funcionar.
-- Você precisa executar os comandos no banco de dados para criar as tabelas,
-- ter este arquivo aqui não significa que a tabela em seu BD estará como abaixo!

/*
comandos para mysql server
*/

CREATE database WhosVerse;
USE WhosVerse;

CREATE TABLE usuario (
idUsuario int primary key auto_increment,
cpf char(11),
nome varchar(45),
email varchar(45),
senha varchar(45),
fkDoutor int,
FOREIGN KEY (fkDoutor) REFERENCES doutores(idDoutores)
);

CREATE TABLE doutores (
idDoutores int primary key auto_increment,
nome varchar(45),
fkUsuario int
);

INSERT INTO doutores (nome) VALUES
('William Hartnell'),
('Patrick Troughton'),
('Jon Pertwee'),
('Tom Baker'),
('Peter Davison'),
('Colin Baker'),
('Sylvester McCoy'),
('Paul McGann'),
('Christopher Eccleston'),
('David Tennant'),
('Matt Smith'),
('Peter Capaldi'),
('Jodie Whittaker'),
('David Tennant'); 

SELECT d.nome AS doutor, COUNT(u.fkDoutor) AS votos
        FROM usuario u
        JOIN doutores d ON u.fkDoutor = d.idDoutores
        GROUP BY d.nome
        ORDER BY votos DESC;
        
SELECT d.nome AS doutor, 
       COUNT(u.fkDoutor) AS votos
FROM doutores d
LEFT JOIN usuario u ON u.fkDoutor = d.idDoutores
GROUP BY d.nome
ORDER BY votos DESC;   