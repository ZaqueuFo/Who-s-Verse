function cadastrar(req, res) {
    var resposta = req.body.respostaServer;
    

    // Faça as validações dos valores
    if (respostaServer == undefined) {
        res.status(400).send("Seu nome está undefined!");
    } else {
        quizModel.cadastrar(resposta)
            .then(
                function (resultado) {
                    res.json(resultado);
                }
            ).catch(
                function (erro) {
                    console.log(erro);
                    console.log(
                        "\nHouve um erro ao guardar a resposta! Erro: ",
                        erro.sqlMessage
                    );
                    res.status(500).json(erro.sqlMessage);
                }
            );
    }
}