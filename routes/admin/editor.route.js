var express = require("express");
var adminModel = require("../../models/admin.model");
var postModel = require("../../models/post.model");
var projectModel = require("../../models/project.model");
var categoryModel = require("../../models/category.model");

var router = express.Router();

router.get("/", async(req, res) => {

    let [editorAll] = await Promise.all([
        adminModel.editorAll(req.user.username),
    ])

    res.render("admin/editor/index", {
        editorAll: editorAll,
        layout: 'admin.hbs',
    });

});

router.get("/wait", async(req, res) => {

    let [editorWait] = await Promise.all([
        adminModel.editorWait(req.user.username),
    ])

    res.render("admin/editor/wait", {
        editorWait: editorWait,
        layout: 'admin.hbs',
    });

});

router.get("/approve/:id", async(req, res) => {
    var id = req.params.id;
    if (isNaN(id)) {
        res.render("admin/editor/approve", {
            error: true,
            layout: 'admin.hbs',
        });
    }

    let [post, categories] = await Promise.all([
        postModel.single(id),
        categoryModel.all(),
    ])

    if (post.length > 0) {
        res.render("admin/editor/approve", {
            error: false,
            post: post[0],
            categories: categories,
            layout: 'admin.hbs',
        });
    } else {
        res.render("admin/editor/approve", {
            error: true,
            layout: 'admin.hbs',
        });
    }
});

router.post("/update", async(req, res) => {
    var entity = {
        id: req.body.id,
        status: 1,
        posted_at: req.body.posted_at,
        updated_at: new Date(),
    }

    let [] = await Promise.all([
        postModel.update(entity)
    ])

    res.redirect("/admin/editor");


});

router.get("/refuse/:id", async(req, res) => {
    var id = req.params.id;
    var entity = {
        id: id,
        status: -1,
        updated_at: new Date(),
    }

    let [] = await Promise.all([
        postModel.update(entity)
    ])

    res.redirect("/admin/editor");
});


module.exports = router;