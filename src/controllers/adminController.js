var adminModel = require("../models/adminModel");

function checarUsuario(req, res) {
    adminModel.checarUsuario()
        .then(
            function (resultado) {
                res.json(resultado);
            }
        ).catch(
            function (erro) {
                console.log(erro);
                console.log("Houve um erro ao buscar os USUARIOS Erro: ", erro.sqlMessage);
                res.status(500).json(erro.sqlMessage);
            }
        );
}

function checarUsuarioMensal(req, res) {
    adminModel.checarUsuarioMensal()
        .then(
            function (resultado) {
                res.json(resultado);
            }
        ).catch(
            function (erro) {
                console.log(erro);
                console.log("Houve um erro ao buscar os USUARIOS Erro: ", erro.sqlMessage);
                res.status(500).json(erro.sqlMessage);
            }
        );
}

module.exports = {
   checarUsuario,
   checarUsuarioMensal
  };