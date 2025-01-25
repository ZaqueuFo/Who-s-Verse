var quizModel = require("../models/quizModel");

function doutor(req, res) {
    var questaoAtual = req.body.questaoAtualServer;
    var idUsuario = req.body.idUsuarioServer;
    console.log(req.body);
    if (doutor == undefined) {
        res.status(400).send("Seu nome está undefined!");
    } else {
        quizModel.doutor(questaoAtual, idUsuario)
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