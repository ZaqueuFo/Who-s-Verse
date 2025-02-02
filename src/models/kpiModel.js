var database = require("../database/config")

function doutorMaisVotado() {
    var instrucaoSql = `
       SELECT d.nome AS doutorMais, COUNT(u.fkDoutor) AS votos
        FROM doutores d
        LEFT JOIN usuario u ON u.fkDoutor = d.idDoutores
        GROUP BY d.nome
        ORDER BY votos DESC
        LIMIT 1;  
    `;
    console.log("Executando a instrução SQL: \n" + instrucaoSql);
    return database.executar(instrucaoSql);
}

function qtdVotos() {
    var instrucaoSql = `
       SELECT COUNT(fkDoutor) AS total_votos
        FROM usuario
        WHERE fkDoutor IS NOT NULL;
    `;
    console.log("Executando a instrução SQL: \n" + instrucaoSql);
    return database.executar(instrucaoSql);
}

function doutorMenosVotado() {
    var instrucaoSql = `
       SELECT d.nome AS doutorMenos, COUNT(u.fkDoutor) AS votos
        FROM doutores as d
        LEFT JOIN usuario as u ON u.fkDoutor = d.idDoutores
        GROUP BY d.nome
        ORDER BY votos ASC
        LIMIT 1;  
    `;
    console.log("Executando a instrução SQL: \n" + instrucaoSql);
    return database.executar(instrucaoSql);
}

function qtdUsuarios() {
    var instrucaoSql = `
       SELECT COUNT(*) AS total_usuarios_quizz
        FROM usuario
        WHERE fkQuizz IS NOT NULL;
    `;
    console.log("Executando a instrução SQL: \n" + instrucaoSql);
    return database.executar(instrucaoSql);
}

function perguntaErro() {
    var instrucaoSql = `
       SELECT p.idPergunta, COUNT(e.idErro) AS total_erros
        FROM erros_quizz as e
        JOIN perguntas as p ON e.fkPergunta = p.idPergunta
        GROUP BY p.idPergunta
        ORDER BY total_erros DESC
        LIMIT 1;
    `;
    console.log("Executando a instrução SQL: \n" + instrucaoSql);
    return database.executar(instrucaoSql);
}

function qtdErro() {
    var instrucaoSql = `
       SELECT COUNT(*) AS total_erros FROM erros_quizz;
    `;
    console.log("Executando a instrução SQL: \n" + instrucaoSql);
    return database.executar(instrucaoSql);
}

function diaMaiorUsuarios() {
    var instrucaoSql = `
       SELECT DATE_FORMAT(dataRegistro, '%d/%m/%Y %H:%i:%s') AS dia, COUNT(*) AS total_usuarios
        FROM usuario
        WHERE MONTH(dataRegistro) = MONTH(CURRENT_DATE()) 
        AND YEAR(dataRegistro) = YEAR(CURRENT_DATE())
        GROUP BY dia
        ORDER BY total_usuarios DESC
        LIMIT 1; 
    `;
    console.log("Executando a instrução SQL: \n" + instrucaoSql);
    return database.executar(instrucaoSql);
}

function diaMenorUsuarios() {
    var instrucaoSql = `
       SELECT DATE_FORMAT(dataRegistro, '%d/%m/%Y %H:%i:%s') AS dia, COUNT(*) AS total_usuarios
        FROM usuario
        WHERE MONTH(dataRegistro) = MONTH(CURRENT_DATE()) 
        AND YEAR(dataRegistro) = YEAR(CURRENT_DATE())
        GROUP BY dia
        ORDER BY total_usuarios ASC
        LIMIT 1;

    `;
    console.log("Executando a instrução SQL: \n" + instrucaoSql);
    return database.executar(instrucaoSql);
}

function mesMaiorUsuarios() {
    var instrucaoSql = `
       SELECT MONTHNAME(dataRegistro) AS mes, COUNT(*) AS total_usuarios
        FROM usuario
        WHERE YEAR(dataRegistro) = YEAR(CURRENT_DATE())
        GROUP BY mes
        ORDER BY total_usuarios DESC
        LIMIT 1;
    `;
    console.log("Executando a instrução SQL: \n" + instrucaoSql);
    return database.executar(instrucaoSql);
}

function mesMenorUsuarios() {
    var instrucaoSql = `
       SELECT MONTHNAME(dataRegistro) AS mes, COUNT(*) AS total_usuarios
        FROM usuario
        WHERE YEAR(dataRegistro) = YEAR(CURRENT_DATE())
        GROUP BY mes
        ORDER BY total_usuarios ASC
        LIMIT 1;
    `;
    console.log("Executando a instrução SQL: \n" + instrucaoSql);
    return database.executar(instrucaoSql);
}

module.exports = {
    doutorMaisVotado,
    qtdVotos,
    doutorMenosVotado,
    qtdUsuarios,
    perguntaErro,
    qtdErro,
    diaMaiorUsuarios,
    diaMenorUsuarios,
    mesMaiorUsuarios,
    mesMenorUsuarios
};