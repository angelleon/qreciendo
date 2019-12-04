let async = require("async"),
  parseString = require("xml2js").parseString;

let util = require("../util/util"),
  comentarioDAO = require("../dao/comentario");
//config = require("../Utilities/config").config;

/**API to create the atricle */
let createComentario = (data, callback) => {
  async.auto(
    {
      Comentario: cb => {
        var dataToSet = {
          category: data.comentario ? data.category : "",
          title: data.title
        };
        console.log(dataToSet);
        comentarioDAO.createComentario(dataToSet, (err, dbData) => {
          if (err) {
            cb(null, {
              statusCode: util.statusCode.FOUR_ZERO_ONE,
              statusMessage: util.statusMessage.SERVER_BUSY
            });
            return;
          }

          cb(null, {
            statusCode: util.statusCode.OK,
            statusMessage: util.statusMessage.DATA_UPDATED,
            result: dataToSet
          });
        });
      }
      //]
    },
    (err, response) => {
      callback(response.Comentario);
    }
  );
};

/**API to update the Comentario*/
let updateComentario = (data, callback) => {
  async.auto(
    {
      ComentarioUpdate: cb => {
        if (!data.id) {
          cb(null, {
            statusCode: util.statusCode.FOUR_ZERO_ONE,
            statusMessage: util.statusMessage.PARAMS_MISSING
          });
          return;
        }
        console.log("phase 1");
        var criteria = {
          id: data.id
        };
        var dataToSet = {
          category: data.category,
          title: data.title
        };
        console.log(criteria, "test", dataToSet);
        comentarioDAO.updateComentario(criteria, dataToSet, (err, dbData) => {
          if (err) {
            cb(null, {
              statusCode: util.statusCode.FOUR_ZERO_ONE,
              statusMessage: util.statusMessage.SERVER_BUSY
            });
            return;
          } else {
            cb(null, {
              statusCode: util.statusCode.OK,
              statusMessage: util.statusMessage.DATA_UPDATED,
              result: dataToSet
            });
          }
        });
      }
    },
    (err, response) => {
      callback(response.ComentarioUpdate);
    }
  );
};

/**API to delete the subject */
let deleteComentario = (data, callback) => {
  console.log(data, "data to set");
  async.auto(
    {
      removeComentario: cb => {
        if (!data.id) {
          cb(null, {
            statusCode: util.statusCode.FOUR_ZERO_ONE,
            statusMessage: util.statusMessage.PARAMS_MISSING
          });
          return;
        }
        var criteria = {
          id: data.id
        };
        comentarioDAO.deleteComentario(criteria, (err, dbData) => {
          if (err) {
            console.log(err);
            cb(null, {
              statusCode: util.statusCode.FOUR_ZERO_ONE,
              statusMessage: util.statusMessage.SERVER_BUSY
            });
            return;
          }
          cb(null, {
            statusCode: util.statusCode.OK,
            statusMessage: util.statusMessage.DELETE_DATA
          });
        });
      }
    },
    (err, response) => {
      callback(response.removeComentario);
    }
  );
};

/***API to get the Comentariolist */
let getComentario = (data, callback) => {
  async.auto(
    {
      Comentario: cb => {
        comentarioDAO.getComentario({}, (err, data) => {
          if (err) {
            cb(null, {
              errorCode: util.statusCode.INTERNAL_SERVER_ERROR,
              statusMessage: util.statusMessage.SERVER_BUSY
            });
            return;
          }
          cb(null, data);
          return;
        });
      }
    },
    (err, response) => {
      callback(response.comentario);
    }
  );
};

let getComentarioById = (data, callback) => {
  async.auto(
    {
      Comentario: cb => {
        let criteria = {
          id: data.id
        };
        comentarioDAO.getComentarioDetail(criteria, (err, data) => {
          if (err) {
            console.log(err, "error----");
            cb(null, {
              errorCode: util.statusCode.INTERNAL_SERVER_ERROR,
              statusMessage: util.statusMessage.SERVER_BUSY
            });
            return;
          }
          cb(null, data[0]);
          return;
        });
      }
    },
    (err, response) => {
      callback(response.Comentario);
    }
  );
};

module.exports = {
  createComentario: createComentario,
  updateComentario: updateComentario,
  deleteComentario: deleteComentario,
  getComentario: getComentario
};
