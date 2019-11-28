var config = require("../util/config").config;
var mysql = require('mysql');
var connection = mysql.createConnection({
host: config.DB_URL_MYSQL.host,
user: config.DB_URL_MYSQL.user,
password: config.DB_URL_MYSQL.password,
database: config.DB_URL_MYSQL.database,
});
 
connection.connect(() => {
// require('../model/comentario').initialize();
});
 
let getDB = () => {
return connection;
}
 
module.exports = {
getDB: getDB
}






