// TODO usar prepared statements para evitar sql injection

let dbConfig = require("../util/mysql_conf");

let getComentario = callback => {
    dbConfig
    .getDB()
    .query(`SELECT * FROM Comentario WHERE activo = TRUE `, callback);
};

let getComentarioById = (idComentario, callback) => {
    dbConfig
    .getDB()
    .query(
        `SELECT LIMIT 1 * FROM Comentario WHERE activo = TRUE AND idComentario = ? `,
        idComentario,
        callback
        );
    };
    
    let createComentario = (comentario, callback) => {
        dbConfig.getDB().query("INSERT INTO Comentario SET ? ", comentario, callback);
    };
    
    let deleteComentario = (idComentario, callback) => {
        dbConfig
        .getDB()
        .query(
            `UPDATE Comentario SET activo = FALSE WHERE idComentario = ?`,
            idComentario,
            callback
            );
        };
        
        module.exports = {
            getComentario: getComentario,
            getComentarioById: getComentarioById,
            createComentario: createComentario,
            deleteComentario: deleteComentario
        };
        