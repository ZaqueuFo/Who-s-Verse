var database = require("../database/config")

function cadastrar(questaoAtualServer, idUsuario) {

    var instrucaoSql = `
        INSERT INTO erros_quizz VALUES (DEFAULT, '${questaoAtualServer}', ${idUsuario});
    `;
    console.log("Executando a instrução SQL: \n" + instrucaoSql);
    return database.executar(instrucaoSql);
}

module.exports = {
    cadastrar,
};