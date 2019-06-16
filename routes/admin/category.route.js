var express = require("express");
var categoryModel = require("../../models/category.model");
var projectModel = require("../../models/project.model");
var userModel = require("../../models/user.model");

var router = express.Router();

router.get("/", async(req, res) => {

    var page = req.query.page || 1;
    if (page < 1) page = 1;

    var limit = 10;
    var offset = (page - 1) * limit;

    let [categories, count_rows] = await Promise.all([
        categoryModel.pagination(limit, offset),
        categoryModel.count(),
    ])

    var total = count_rows[0].total;
    var nPages = Math.floor(total / limit);
    if (total % limit > 0) nPages++;
    var pages = [];
    for (i = 1; i <= nPages; i++) {
        var obj = { value: i, active: i === +page };
        pages.push(obj);
    }

    res.render("admin/categories/index", {
        url: 'category',
        categories: categories,
        pages,
        layout: 'admin.hbs',
    });

});

router.get("/add", async(req, res) => {
    let [projects] = await Promise.all([
        projectModel.all(),
    ])

    res.render("admin/categories/add", {
        url: 'category',
        projects: projects,
        layout: 'admin.hbs',
    });

});

router.post("/add", async(req, res) => {

    var entity = {
        name: req.body.name,
        url: req.body.url,
        id_project: req.body.id_project,
        created_at: new Date(),
        updated_at: new Date(),
    }
    let [] = await Promise.all([
        categoryModel.add(entity),
    ])

    res.redirect("/admin/categories");

});

router.get("/id_project/:id", async(req, res) => {
    var id = req.params.id;
    let [categories] = await Promise.all([
        categoryModel.getByProject(id),
    ])

    res.json({
        categories: categories,
    });
});

router.get("/edit/:id", async(req, res) => {
    var id = req.params.id;
    if (isNaN(id)) {
        res.render("admin/categories/edit", {
            url: 'category',
            error: true,
            layout: 'admin.hbs',
        });
    }

    let [projects, category, editor] = await Promise.all([
        projectModel.all(),
        categoryModel.single(id),
        userModel.writer(),
    ])

    if (category.length > 0) {
        res.render("admin/categories/edit", {
            url: 'category',
            error: false,
            projects: projects,
            category: category[0],
            editor: editor,
            layout: 'admin.hbs',
        });
    } else {
        res.render("admin/categories/edit", {
            url: 'category',
            error: true,
            layout: 'admin.hbs',
        });
    }
});

router.post("/update", async(req, res) => {
    var entity = {
        id: req.body.id,
        name: req.body.name,
        url: req.body.url,
        id_project: req.body.id_project,
        updated_at: new Date(),
    }
    let [] = await Promise.all([
        categoryModel.update(entity),
    ])

    res.redirect("/admin/categories");
});

router.get("/delete/:id", async(req, res) => {
    let [] = await Promise.all([
        categoryModel.delete(req.params.id),
    ])

    res.redirect("/admin/categories");

});

module.exports = router;