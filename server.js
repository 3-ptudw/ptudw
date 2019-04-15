var express = require("express");
var app = express();

app.use('/static', express.static('public'));

app.set("view engine", "ejs");
app.set("views", "./views");

app.listen(process.env.PORT || 3000);

app.get('*', function(req, res){
   res.send('Sorry, this is an invalid URL.');
});
