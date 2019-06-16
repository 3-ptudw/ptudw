var express = require("express");
var projectModel = require("../../models/project.model");

var router = express.Router();

router.get("/", async(req, res) => {

    var page = req.query.page || 1;
    if (page < 1) page = 1;

    var limit = 10;
    var offset = (page - 1) * limit;

    let [projects, count_rows] = await Promise.all([
        projectModel.pagination(limit, offset),
        projectModel.count(),
    ])

    var total = count_rows[0].total;
    var nPages = Math.floor(total / limit);
    if (total % limit > 0) nPages++;
    var pages = [];
    for (i = 1; i <= nPages; i++) {
        var obj = { value: i, active: i === +page };
        pages.push(obj);
    }

    res.render("admin/projects/index", {
        url: 'project',
        projects: projects,
        pages,
        layout: 'admin.hbs',
    });

});

router.get("/add", (req, res) => {
    res.render("admin/projects/add", {
        url: 'project',
        layout: 'admin.hbs',
    });
});

router.post("/add", async(req, res) => {

    var entity = {
        name: req.body.name,
        created_at: new Date(),
        updated_at: new Date(),
    }

    let [] = await Promise.all([
        projectModel.add(entity)
    ])

    res.redirect("/admin/projects");
});

router.get("/edit/:id", async(req, res) => {
    var id = req.params.id;
    if (isNaN(id)) {
        res.render("admin/projects/edit", {
            url: 'project',
            error: true,
            layout: 'admin.hbs',
        });
    }

    let [project] = await Promise.all([
        projectModel.single(id)
    ])

    if (project.length > 0) {
        res.render("admin/projects/edit", {
            url: 'project',
            error: false,
            project: project[0],
            layout: 'admin.hbs',
        });
    } else {
        res.render("admin/projects/edit", {
            url: 'project',
            error: true,
            layout: 'admin.hbs',
        });
    }
});

router.post("/update", async(req, res) => {
    var entity = {
        id: req.body.id,
        name: req.body.name,
        updated_at: new Date(),
    }

    let [] = await Promise.all([
        projectModel.update(entity),
    ])

    res.redirect("/admin/projects");

});

router.get("/delete/:id", async(req, res) => {
    let [] = await Promise.all([
        projectModel.delete(req.params.id)
    ])

    res.redirect("/admin/projects");
});

module.exports = router;