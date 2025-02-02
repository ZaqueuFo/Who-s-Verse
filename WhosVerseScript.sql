CREATE database WhosVerse;
USE WhosVerse;
DROP DATABASE WhosVerse;



CREATE TABLE usuario (
idUsuario int primary key auto_increment,
dataRegistro DATETIME DEFAULT CURRENT_TIMESTAMP,
cpf char(11),
nome varchar(45),
email varchar(45),
senha varchar(45),
fkDoutor int,
fkQuizz int,
Foreign key (fkQuizz) references quizz(idQuizz),
FOREIGN KEY (fkDoutor) REFERENCES doutores(idDoutores)
);

INSERT INTO usuario values
(DEFAULT, 11111111111, 'Sarah', 'sarah@email.com', 'Sarah@123', null, null),
(DEFAULT, 22222222222, 'Julia', 'julia@email.com', 'Julia@123', null, null);

CREATE TABLE quizz (
idQuizz int primary key auto_increment,
quizz varchar(100)
);



CREATE TABLE doutores (
idDoutores int primary key auto_increment,
nome varchar(45),
fkUsuario int
);



CREATE TABLE perguntas (
    idPergunta INT AUTO_INCREMENT PRIMARY KEY,
    fkQuizz INT,
    Pergunta VARCHAR(255),
    FOREIGN KEY (fkQuizz) references quizz(idQuizz)
);

CREATE TABLE erros_quizz (
idErro int primary key auto_increment,
fkPergunta int,
fkUsuario int,
Foreign key (fkPergunta) references perguntas(idPergunta),
Foreign key (fkUsuario) references usuario(idUsuario)
);

SELECT * FROM erros_quizz;

SELECT fkPergunta, COUNT(*) AS total_erros
FROM erros_quizz
GROUP BY fkPergunta
ORDER BY total_erros DESC;

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


INSERT INTO perguntas (pergunta) VALUES
('Os Senhores do Tempo têm a capacidade de regenerar seus corpos após sofrerem ferimentos graves. Na biologia real, qual criatura terrestre tem a capacidade de regenerar partes de seu corpo, como membros ou cauda?'),
('A TARDIS viaja no tempo e no espaço. Na física, qual teoria ajuda a explicar a possibilidade de viagens no tempo, mesmo que ainda não seja viável para humanos?'),
('Em The Waters of Mars, a tripulação encontra um vírus alienígena transmitido pela água. Na Terra, qual doença conhecida é frequentemente transmitida por água contaminada?'),
('O 10º Doutor menciona os tímelocks, que isolam eventos no tempo para impedir interferências. Qual fenômeno da física real pode ser comparado a um bloqueio no tempo ou espaço?'),
('Os Daleks usam armas de energia que desintegram matéria. Qual partícula subatômica seria mais próxima de explicar um feixe destrutivo de alta energia na física?'),
('O episódio Kill the Moon explora a ideia de que a Lua seria um ovo alienígena. Cientificamente, qual é a principal função da Lua em relação à Terra?'),
('Os Cybermen são ciborgues que misturam tecnologia com organismos vivos. Qual avanço real da ciência médica mais se aproxima dessa ideia?'),
('No episódio Blink, os Weeping Angels se movem apenas quando não estão sendo observados. Que princípio físico real se assemelha à ideia de algo ser alterado ao ser observado?');

select * from usuario;
select * from doutores;
DROP DATABASE WhosVerse;

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



CREATE VIEW view_usuarios_por_dia AS
SELECT DATE(dataRegistro) AS data, COUNT(idUsuario) AS quantidade_usuarios
FROM usuario
WHERE MONTH(dataRegistro) = MONTH(CURRENT_DATE()) 
AND YEAR(dataRegistro) = YEAR(CURRENT_DATE())
GROUP BY DATE(dataRegistro)
ORDER BY data ASC;


SELECT DATE(dataRegistro) AS dia, COUNT(*) AS total_usuarios
FROM usuario
WHERE MONTH(dataRegistro) = MONTH(CURRENT_DATE()) 
AND YEAR(dataRegistro) = YEAR(CURRENT_DATE())
GROUP BY dia
ORDER BY total_usuarios ASC
LIMIT 1;


SELECT * FROM view_usuarios_por_dia;

SELECT d.nome AS doutorMais, COUNT(u.fkDoutor) AS votos
FROM doutores d
LEFT JOIN usuario u ON u.fkDoutor = d.idDoutores
GROUP BY d.nome
ORDER BY votos DESC
LIMIT 1;

SELECT d.nome AS doutorMenos, COUNT(u.fkDoutor) AS votos
FROM doutores d
LEFT JOIN usuario u ON u.fkDoutor = d.idDoutores
GROUP BY d.nome
ORDER BY votos ASC
LIMIT 1;

SELECT COUNT(fkDoutor) AS total_votos
FROM usuario
WHERE fkDoutor IS NOT NULL;

SELECT COUNT(*) AS total_usuarios_quizz
FROM usuario
WHERE fkQuizz IS NOT NULL;

SELECT p.Pergunta, COUNT(e.idErro) AS total_erros
FROM erros_quizz e
JOIN perguntas p ON e.fkPergunta = p.idPergunta
GROUP BY p.Pergunta
ORDER BY total_erros DESC
LIMIT 1;

SELECT p.idPergunta, COUNT(e.idErro) AS total_erros
FROM erros_quizz as e
JOIN perguntas as p ON e.fkPergunta = p.idPergunta
GROUP BY p.idPergunta
ORDER BY total_erros DESC
LIMIT 1;
        
SELECT COUNT(*) AS total_erros FROM erros_quizz;


SELECT 
    MONTH(dataRegistro) AS mes_numero,
    MONTHNAME(dataRegistro) AS mes_nome, 
    COUNT(*) AS total_usuarios
FROM usuario
WHERE YEAR(dataRegistro) = YEAR(CURRENT_DATE()) 
GROUP BY mes_numero, mes_nome
ORDER BY mes_numero;

 

INSERT INTO usuario (dataRegistro, cpf, nome, email, senha, fkDoutor, fkQuizz) VALUES
('2025-01-05 10:15:00', '11111111111', 'Sarah', 'sarah@email.com', 'Sarah@123', NULL, NULL),
('2025-01-20 14:30:00', '22222222222', 'Julia', 'julia@email.com', 'Julia@123', NULL, NULL),
('2025-02-08 09:45:00', '33333333333', 'Lucas', 'lucas@email.com', 'Lucas@123', NULL, NULL),
('2025-02-15 11:10:00', '44444444444', 'Mariana', 'mariana@email.com', 'Mariana@123', NULL, NULL),
('2025-03-12 16:50:00', '55555555555', 'Bruno', 'bruno@email.com', 'Bruno@123', NULL, NULL),
('2025-03-28 13:20:00', '66666666666', 'Fernanda', 'fernanda@email.com', 'Fernanda@123', NULL, NULL),
('2025-04-02 08:40:00', '77777777777', 'Gabriel', 'gabriel@email.com', 'Gabriel@123', NULL, NULL),
('2025-04-18 19:05:00', '88888888888', 'Ana', 'ana@email.com', 'Ana@123', NULL, NULL),
('2025-05-07 22:15:00', '99999999999', 'Rafael', 'rafael@email.com', 'Rafael@123', NULL, NULL),
('2025-05-21 15:30:00', '10101010101', 'Paula', 'paula@email.com', 'Paula@123', NULL, NULL),
('2025-06-10 12:45:00', '11111111112', 'Rodrigo', 'rodrigo@email.com', 'Rodrigo@123', NULL, NULL),
('2025-06-25 18:20:00', '12121212121', 'Beatriz', 'beatriz@email.com', 'Beatriz@123', NULL, NULL),
('2025-07-03 09:55:00', '13131313131', 'Caio', 'caio@email.com', 'Caio@123', NULL, NULL),
('2025-07-19 16:00:00', '14141414141', 'Sofia', 'sofia@email.com', 'Sofia@123', NULL, NULL),
('2025-08-11 11:30:00', '15151515151', 'Thiago', 'thiago@email.com', 'Thiago@123', NULL, NULL),
('2025-08-27 20:45:00', '16161616161', 'Camila', 'camila@email.com', 'Camila@123', NULL, NULL),
('2025-09-06 14:10:00', '17171717171', 'Eduardo', 'eduardo@email.com', 'Eduardo@123', NULL, NULL),
('2025-09-22 17:25:00', '18181818181', 'Larissa', 'larissa@email.com', 'Larissa@123', NULL, NULL),
('2025-10-05 13:40:00', '19191919191', 'Diego', 'diego@email.com', 'Diego@123', NULL, NULL),
('2025-10-30 21:50:00', '20202020202', 'Juliana', 'juliana@email.com', 'Juliana@123', NULL, NULL),
('2025-11-09 08:30:00', '21212121212', 'Henrique', 'henrique@email.com', 'Henrique@123', NULL, NULL),
('2025-11-25 15:15:00', '22222222222', 'Tatiane', 'tatiane@email.com', 'Tatiane@123', NULL, NULL),
('2025-12-01 18:55:00', '23232323232', 'Felipe', 'felipe@email.com', 'Felipe@123', NULL, NULL),
('2025-12-20 23:10:00', '24242424242', 'Isabela', 'isabela@email.com', 'Isabela@123', NULL, NULL);

SELECT DATE(dataRegistro) AS dia, COUNT(*) AS total_usuarios
FROM usuario
WHERE MONTH(dataRegistro) = MONTH(CURRENT_DATE()) 
AND YEAR(dataRegistro) = YEAR(CURRENT_DATE())
GROUP BY dia
ORDER BY total_usuarios ASC
LIMIT 1;

SELECT DATE_FORMAT(dataRegistro, '%d/%m/%Y %H:%i:%s') AS dia, COUNT(*) AS total_usuarios
FROM usuario
WHERE MONTH(dataRegistro) = MONTH(CURRENT_DATE()) 
AND YEAR(dataRegistro) = YEAR(CURRENT_DATE())
GROUP BY dia
ORDER BY total_usuarios DESC
LIMIT 1;


SELECT MONTHNAME(dataRegistro) AS mes, COUNT(*) AS total_usuarios
FROM usuario
WHERE YEAR(dataRegistro) = YEAR(CURRENT_DATE())
GROUP BY mes
ORDER BY total_usuarios ASC
LIMIT 1;

SELECT MONTHNAME(dataRegistro) AS mes, COUNT(*) AS total_usuarios
FROM usuario
WHERE YEAR(dataRegistro) = YEAR(CURRENT_DATE())
GROUP BY mes
ORDER BY total_usuarios DESC
LIMIT 1;

INSERT INTO usuario (dataRegistro, cpf, nome, email, senha, fkDoutor, fkQuizz) VALUES
-- Janeiro (Baixo fluxo)
('2025-01-05 10:15:00', '10101010101', 'Carlos', 'carlos@email.com', 'Carlos@123', NULL, NULL),
-- Fevereiro (Alto fluxo)
('2025-02-10 09:00:00', '11111111111', 'Ana', 'ana@email.com', 'Ana@123', NULL, NULL),
('2025-02-10 12:30:00', '12121212121', 'Marcos', 'marcos@email.com', 'Marcos@123', NULL, NULL),
('2025-02-10 16:45:00', '13131313131', 'Fernanda', 'fernanda@email.com', 'Fernanda@123', NULL, NULL),
('2025-02-10 19:00:00', '14141414141', 'Pedro', 'pedro@email.com', 'Pedro@123', NULL, NULL),
-- Março (Baixo fluxo)
('2025-03-22 14:20:00', '15151515151', 'Juliana', 'juliana@email.com', 'Juliana@123', NULL, NULL),
-- Abril (Alto fluxo)
('2025-04-07 09:45:00', '16161616161', 'Eduardo', 'eduardo@email.com', 'Eduardo@123', NULL, NULL),
('2025-04-07 12:15:00', '17171717171', 'Mariana', 'mariana@email.com', 'Mariana@123', NULL, NULL),
('2025-04-07 15:30:00', '18181818181', 'Bruno', 'bruno@email.com', 'Bruno@123', NULL, NULL),
('2025-04-07 18:50:00', '19191919191', 'Paula', 'paula@email.com', 'Paula@123', NULL, NULL);

        
