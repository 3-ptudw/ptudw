var express = require("express");
var projectModel = require("../../models/project.model");

var router = express.Router();

router.get("/", (req, res) => {
    projectModel
        .all()
        .then(rows => {
            res.render("admin/projects/index", {
                projects: rows,
                layout: 'admin.hbs',
            });
        })
        .catch(err => {
            console.log(err);
            res.end("error occured.");
        });
});

router.get("/add", (req, res) => {
    res.render("admin/projects/add", {
        layout: 'admin.hbs',
    });
});

router.post("/add", (req, res) => {

    var entity = {
        name: req.body.name,
        created_at: new Date(),
        updated_at: new Date(),
    }

    projectModel
        .add(entity)
        .then(id => {
            res.redirect("/admin/projects");
        })
        .catch(err => {
            console.log(err);
            res.end("error occured.");
        });
});

router.get("/edit/:id", (req, res) => {
    var id = req.params.id;
    if (isNaN(id)) {
        res.render("admin/projects/edit", {
            error: true,
            layout: 'admin.hbs',
        });
    }

    projectModel
        .single(id)
        .then(rows => {
            if (rows.length > 0) {
                res.render("admin/projects/edit", {
                    error: false,
                    project: rows[0],
                    layout: 'admin.hbs',
                });
            } else {
                res.render("admin/projects/edit", {
                    error: true,
                    layout: 'admin.hbs',
                });
            }
        })
        .catch(err => {
            console.log(err);
            res.end("error occured.");
        });
});

router.post("/update", (req, res) => {
    var entity = {
        id: req.body.id,
        name: req.body.name,
        status: req.body.status,
        updated_at: new Date(),
    }

    projectModel
        .update(entity)
        .then(n => {
            res.redirect("/admin/projects");
        })
        .catch(err => {
            console.log(err);
            res.end("error occured.");
        });
});

router.get("/delete/:id", (req, res) => {
    projectModel
        .delete(req.params.id)
        .then(n => {
            res.redirect("/admin/projects");
        })
        .catch(err => {
            console.log(err);
            res.end("error occured.");
        });
});

module.exports = router;