let app = require("express")(),
server = require("http").Server(app),
bodyParser = require("body-parser");
(express = require("express")),
(cors = require("cors")),
(http = require("http")),
(path = require("path"));

let comentarioRoute = require("./route/comentario");
let util = require("./util/util");

app.use(bodyParser.json());
app.use(bodyParser.urlencoded({ extended: false }));

app.use(cors());

app.use((err, req, res, next) => {
    res.send({
        statusCode: util.statusCode.ONE,
        statusMessage: util.statusMessage.SOMETHING_WENT_WRONG
    });
});

app.use("/comentario", comentarioRoute);

// catch 404 and forward to error handler
app.use((req, res, next) => {
    next();
});

/*first API to check if server is running*/
app.get("*", (req, res) => {
    res.sendFile(path.join(__dirname, "../server/client/dist/index.html"));
});

const port = 4200;
server.listen(port, () => {
    console.log("app listening on port: " + port);
});
