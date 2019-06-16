var express = require("express");
var postModel = require("../../models/post.model");
var projectModel = require("../../models/project.model");
var categoryModel = require("../../models/category.model");

var router = express.Router();

router.get("/", async(req, res) => {
    let [posts] = await Promise.all([
        postModel.all()
    ])

    res.render("admin/posts/index", {
        url: 'post',
        posts: posts,
        layout: 'admin.hbs',
    });

});

router.get("/add", async(req, res) => {
    let [projects, categories] = await Promise.all([
        projectModel.all(),
        categoryModel.all()
    ])

    res.render("admin/posts/add", {
        url: 'post',
        projects: projects,
        categories: categories,
        layout: 'admin.hbs',
    });

});

router.post("/add", async(req, res) => {
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
    let [] = await Promise.all([
        postModel.add(entity)
    ])

    res.redirect("/admin/posts");

});

router.get("/edit/:id", async(req, res) => {
    var id = req.params.id;
    if (isNaN(id)) {
        res.render("admin/posts/edit", {
            url: 'post',
            error: true,
            layout: 'admin.hbs',
        });
    }
    let [post, categories] = await Promise.all([
        postModel.single(id),
        categoryModel.all(),
    ])

    if (post.length > 0) {
        res.render("admin/posts/edit", {
            url: 'post',
            error: false,
            post: post[0],
            categories: categories,
            layout: 'admin.hbs',
        });
    } else {
        res.render("admin/posts/edit", {
            url: 'post',
            error: true,
            layout: 'admin.hbs',
        });
    }

});

router.post("/update", async(req, res) => {
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
    let [] = await Promise.all([
        postModel.update(entity)
    ])

    res.redirect("/admin/posts");

});

router.get("/delete/:id", async(req, res) => {
    let [] = await Promise.all([
        postModel.delete(req.params.id)
    ])

    res.redirect("/admin/posts");

});

module.exports = router;