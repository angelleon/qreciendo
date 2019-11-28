let express = require('express'),
router = express.Router(),
util = require('../Utilities/util'),
articleService = require('../Services/comentario');
 
/**Api to create article */
router.post('/comentario', (req, res) => {
articleService.createArticle(req.body, (data) => {
res.send(data);
});
});
 
// /**Api to update article */
router.put('/comentario', (req, res) => {
articleService.updateArticle(req.body, (data) => {
res.send(data);
});
});
 
// /**Api to delete the article */
router.delete('/comentario', (req, res) => {
articleService.deleteArticle(req.query, (data) => {
res.send(data);
});
});
 
/**Api to get the list of article */
router.get('/comentario', (req, res) => {
documentService.getArticle(req.query, (data) => {
res.send(data);
});
});
 
// /**API to get the article by id... */
router.get('/comentario', (req, res) => {
articleService.getArticleById(req.query, (data) => {
res.send(data);
});
});
 
module.exports = router;