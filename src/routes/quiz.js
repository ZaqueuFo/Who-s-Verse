var express = require("express");
var router = express.Router();

var quizController = require("../controllers/quizController");

router.post("/quizz", function (req, res) {
    quizController.quizz(req, res);
});

router.get("/puxarDados", function (req, res) {
    quizController.puxarDados(req, res);
});



module.exports = router;