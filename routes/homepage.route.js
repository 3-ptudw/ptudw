var express = require("express");
var homepageModel = require("../models/homepage.model.");
var postModel = require("../models/post.model");

var router = express.Router();

router.get("/", (req, res) => {
    postModel
        .all()
        .then(rows => {
            res.render("home", {
                posts: rows,
            });
        })
        .catch(err => {
            console.log(err);
            res.end("error occured.");
        });
});

module.exports = router;