let mysqlConfig = require("../util/mysql_conf");
 
let initialize = () => {
mysqlConfig.getDB().query(`CREATE TABLE IF NOT EXISTS qreciendo.Comentario (
    idComentario INT NOT NULL,
    idProyecto INT NULL,
    idUsuario INT NULL,
    texto VARCHAR(280) NULL,
    PRIMARY KEY (idComentario),
    INDEX fk_Comentario_Proyecto_idx (idProyecto ASC),
    INDEX fk_Comentario_Usuario_idx (idUsuario ASC),
    CONSTRAINT fk_Comentario_Proyecto
      FOREIGN KEY (idProyecto)
      REFERENCES qreciendo.Proyecto (idProyecto)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION,
    CONSTRAINT fk_Comentario_Usuario
      FOREIGN KEY (idUsuario)
      REFERENCES qreciendo.Usuario (idUsuario)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION)
  ENGINE = InnoDB;`);
 
}
 
module.exports = {
initialize: initialize
}