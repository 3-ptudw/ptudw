var express = require("express");
var postModel = require("../../models/post.model");

var router = express.Router();

router.get("/", (req, res) => {
    postModel
        .all()
        .then(rows => {
            res.render("admin/posts/index", {
                posts: rows
            });
        })
        .catch(err => {
            console.log(err);
            res.end("error occured.");
        });
});

router.get("/add", (req, res) => {
    res.render("admin/posts/add");
});

router.post("/add", (req, res) => {
    postModel
        .add(req.body)
        .then(id => {
            // console.log(id);
            res.redirect("/admin/posts");
        })
        .catch(err => {
            console.log(err);
            res.end("error occured.");
        });
});

router.get("/edit/:id", (req, res) => {
    var id = req.params.id;
    if (isNaN(id)) {
        res.render("admin/posts/edit", {
            error: true
        });
    }

    postModel
        .single(id)
        .then(rows => {
            if (rows.length > 0) {
                res.render("admin/posts/edit", {
                    error: false,
                    post: rows[0]
                });
            } else {
                res.render("admin/posts/edit", {
                    error: true
                });
            }
        })
        .catch(err => {
            console.log(err);
            res.end("error occured.");
        });
});

router.post("/update", (req, res) => {
    postModel
        .update(req.body)
        .then(n => {
            res.redirect("/admin/posts");
        })
        .catch(err => {
            console.log(err);
            res.end("error occured.");
        });
});

router.get("/delete/:id", (req, res) => {
    postModel
        .delete(req.params.id)
        .then(n => {
            res.redirect("/admin/posts");
        })
        .catch(err => {
            console.log(err);
            res.end("error occured.");
        });
});

module.exports = router;