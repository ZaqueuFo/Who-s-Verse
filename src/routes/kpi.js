var express = require("express");
var router = express.Router();

var kpiController = require("../controllers/kpiController");

router.get("/doutorMaisVotado", function (req, res) {
    kpiController.doutorMaisVotado(req, res);
});

router.get("/qtdVotos", function (req, res) {
    kpiController.qtdVotos(req, res);
});

router.get("/doutorMenosVotado", function (req, res) {
    kpiController.doutorMenosVotado(req, res);
});

router.get("/qtdUsuarios", function (req, res) {
    kpiController.qtdUsuarios(req, res);
});

router.get("/perguntaErro", function (req, res) {
    kpiController.perguntaErro(req, res);
});

router.get("/quantidadeErro", function (req, res) {
    kpiController.qtdErro(req, res);
});

router.get("/diaMaiorUsuarios", function (req, res) {
    kpiController.diaMaiorUsuarios(req, res);
});

router.get("/diaMenorUsuarios", function (req, res) {
    kpiController.diaMenorUsuarios(req, res);
});

router.get("/mesMaiorUsuarios", function (req, res) {
    kpiController.mesMaiorUsuarios(req, res);
});

router.get("/mesMenorUsuarios", function (req, res) {
    kpiController.mesMenorUsuarios(req, res);
});

module.exports = router;