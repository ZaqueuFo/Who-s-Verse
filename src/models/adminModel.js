

var database = require("../database/config")

function checarUsuario() {
    var instrucaoSql = `
       SELECT * FROM view_usuarios_por_dia;  
    `;
    console.log("Executando a instrução SQL: \n" + instrucaoSql);
    return database.executar(instrucaoSql);
}

function checarUsuarioMensal() {
   var instrucaoSql = `
      SELECT 
      MONTH(dataRegistro) AS mes_numero,
      MONTHNAME(dataRegistro) AS mes_nome, 
      COUNT(*) AS total_usuarios
      FROM usuario
      WHERE YEAR(dataRegistro) = YEAR(CURRENT_DATE()) 
      GROUP BY mes_numero, mes_nome
      ORDER BY mes_numero; 
   `;
   console.log("Executando a instrução SQL: \n" + instrucaoSql);
   return database.executar(instrucaoSql);
}

module.exports = {
   checarUsuario,
   checarUsuarioMensal
};