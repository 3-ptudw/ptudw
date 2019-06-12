var express = require("express");
var postModel = require("../../models/post.model");
var projectModel = require("../../models/project.model");
var categoryModel = require("../../models/category.model");

var router = express.Router();

router.get("/", (req, res) => {
    postModel
        .all()
        .then(rows => {
            res.render("admin/posts/index", {
                posts: rows,
                layout: 'admin.hbs',
            });
        })
        .catch(err => {
            console.log(err);
            res.end("error occured.");
        });
});

router.get("/add", (req, res) => {
    projectModel
        .all()
        .then(rows => {
            categoryModel
                .all()
                .then(rows1 => {
                    res.render("admin/posts/add", {
                        projects: rows,
                        categories: rows1,
                        layout: 'admin.hbs',
                    });
                })
                .catch(err => {
                    console.log(err);
                    res.end("error occured.");
                });
        })
        .catch(err => {
            console.log(err);
            res.end("error occured.");
        });
});

router.post("/add", (req, res) => {
    var entity = {
        title: req.body.title,
        url: req.body.url,
        id_category: req.body.id_category,
        id_user: req.user.id,
        url_thumbnail: req.body.url_thumbnail,
        abstract: req.body.abstract,
        content: req.body.content,
        tag: req.body.tag,
        posted_at: req.body.posted_at,
        created_at: new Date(),
        updated_at: new Date(),
    }
    postModel
        .add(entity)
        .then(id => {
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
            error: true,
            layout: 'admin.hbs',
        });
    }

    postModel
        .single(id)
        .then(rows => {
            categoryModel
                .all()
                .then(rows1 => {
                    if (rows.length > 0) {
                        res.render("admin/posts/edit", {
                            error: false,
                            post: rows[0],
                            categories: rows1,
                            layout: 'admin.hbs',
                        });
                    } else {
                        res.render("admin/posts/edit", {
                            error: true,
                            layout: 'admin.hbs',
                        });
                    }
                })
                .catch(err => {
                    console.log(err);
                    res.end("error occured.");
                });
        })
        .catch(err => {
            console.log(err);
            res.end("error occured.");
        });
});

router.post("/update", (req, res) => {
    var entity = {
        id: req.body.id,
        title: req.body.title,
        url: req.body.url,
        id_category: req.body.id_category,
        url_thumbnail: req.body.url_thumbnail,
        abstract: req.body.abstract,
        content: req.body.content,
        tag: req.body.tag,
        status: req.body.status,
        posted_at: req.body.posted_at,
        updated_at: new Date(),
    }
    postModel
        .update(entity)
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