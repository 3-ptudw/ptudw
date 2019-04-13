var express = require("express");
var app = express();

app.use(express.static('public'))

app.set("view engine", "ejs");
app.set("views", "./views");

app.listen(process.env.PORT || 3000);

app.get("/", function (request, response) {
    response.render("index");
});

app.get("/1", function (request, response) {
    response.render("index1");
});