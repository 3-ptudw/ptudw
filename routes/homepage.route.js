var express = require("express");
var homepageModel = require("../models/homepage.model.");
var postModel = require("../models/post.model");
var categoryModel = require("../models/category.model");

var router = express.Router();

router.get("/", (req, res) => {
    postModel
        .trueStatus()
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

router.get("/post/:url", (req, res) => {
    var url = req.params.url;
    postModel
        .getURL(url)
        .then(rows => {
            if (rows.length > 0) {
                res.render("post", {
                    error: false,
                    post: rows[0],
                });
            } else {
                res.render("post", {
                    error: true,
                });
            }
        })
        .catch(err => {
            console.log(err);
            res.end(err);
        });
});

router.get("/category/:url", (req, res) => {
    var url = req.params.url;
    categoryModel
        .getURL(url)
        .then(rows => {
            if (rows.length > 0) {
                res.render("category", {
                    error: false,
                    category: rows[0],
                });
            } else {
                res.render("category", {
                    error: true,
                });
            }
        })
        .catch(err => {
            console.log(err);
            res.end(err);
        });
});


module.exports = router;