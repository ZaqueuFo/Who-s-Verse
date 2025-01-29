var quizModel = require("../models/quizModel");

function quizz(req, res) {
    var numeroDaQuestaoAtual = req.body.questaoAtualServer;
    var idUsuario = req.body.idUsuarioServer;
    console.log(req.body);
    if (quizz == undefined) {
        res.status(400).send("Nada foi salvo");
    } else {
        quizModel.cadastrar(numeroDaQuestaoAtual, idUsuario)
            .then(
                function (resultado) {
                    res.json(resultado);
                }
            ).catch(
                function (erro) {
                    console.log(erro);
                    console.log(
                        "\nHouve um erro ao cadastrar a pergunta! Erro: ",
                        erro.sqlMessage
                    );
                    res.status(500).json(erro.sqlMessage);
                }
            );
    }
}

function puxarDados(req, res) {
    quizModel.puxarDados()
        .then(
            function (resultado) {
                res.json(resultado);
            }
        ).catch(
            function (erro) {
                console.log(erro);
                console.log("houve um erro ao puxar dados ", erro.sqlMessage);
                res.status(500).json(erro.sqlMessage);
            }
        );
}

module.exports = {
  quizz,
  puxarDados
};