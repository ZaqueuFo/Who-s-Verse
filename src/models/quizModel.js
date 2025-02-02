var database = require("../database/config")

function cadastrar(questaoAtualServer, idUsuario) {

    var instrucaoSql = `
        INSERT INTO erros_quizz VALUES (DEFAULT, '${questaoAtualServer}', ${idUsuario});
    `;
    console.log("Executando a instrução SQL: \n" + instrucaoSql);
    return database.executar(instrucaoSql);
}

function usuarioQuiz(idUsuario) {

    var instrucaoSql = `
        UPDATE usuario 
        SET fkQuizz = 1
        WHERE idUsuario = ${idUsuario};
    `;
    console.log("Executando a instrução SQL: \n" + instrucaoSql);
    return database.executar(instrucaoSql);
}

function puxarDados() {
    var instrucaoSql = `
       SELECT fkPergunta, COUNT(*) AS total_erros
       FROM erros_quizz
       GROUP BY fkPergunta
       ORDER BY total_erros DESC;  
    `;
    console.log("Executando a instrução SQL: \n" + instrucaoSql);
    return database.executar(instrucaoSql);
}

module.exports = {
    cadastrar,
    puxarDados,
    usuarioQuiz
};