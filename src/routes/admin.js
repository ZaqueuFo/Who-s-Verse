var express = require("express");
var router = express.Router();

var adminController = require("../controllers/adminController");

router.get("/checarUsuario", function (req, res) {
    adminController.checarUsuario(req, res);
});

router.get("/checarUsuarioMensal", function (req, res) {
    adminController.checarUsuarioMensal(req, res);
});

module.exports = router;