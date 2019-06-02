var express = require("express");
var categoryModel = require("../../models/category.model");
var projectModel = require("../../models/project.model");

var router = express.Router();

router.get("/", (req, res) => {
    categoryModel
        .all()
        .then(rows => {
            res.render("admin/categories/index", {
                categories: rows,
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
            res.render("admin/categories/add", {
                projects: rows,
                layout: 'admin.hbs',
            });
        })
        .catch(err => {
            console.log(err);
            res.end("error occured.");
        });
});

router.post("/add", (req, res) => {
    categoryModel
        .add(req.body)
        .then(id => {
            res.redirect("/admin/categories");
        })
        .catch(err => {
            console.log(err);
            res.end("error occured.");
        });
});

// router.get("/id_project/:id", (req, res) => {
//     var id = req.params.id;
//     console.log(id);
//     categoryModel
//         .getByProject(id)
//         .then(rows => {
//             res.json({
//                 categories: rows,
//             });
//         })
//         .catch(err => {
//             console.log(err);
//             res.end("error occured.");
//         });
// });

router.get("/edit/:id", (req, res) => {
    var id = req.params.id;
    if (isNaN(id)) {
        res.render("admin/categories/edit", {
            error: true,
            layout: 'admin.hbs',
        });
    }

    categoryModel
        .single(id)
        .then(rows => {
            projectModel
                .all()
                .then(rows1 => {
                    if (rows.length > 0) {
                        res.render("admin/categories/edit", {
                            error: false,
                            projects: rows1,
                            category: rows[0],
                            layout: 'admin.hbs',
                        });
                    } else {
                        res.render("admin/categories/edit", {
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
    categoryModel
        .update(req.body)
        .then(n => {
            res.redirect("/admin/categories");
        })
        .catch(err => {
            console.log(err);
            res.end("error occured.");
        });
});

router.get("/delete/:id", (req, res) => {
    categoryModel
        .delete(req.params.id)
        .then(n => {
            res.redirect("/admin/categories");
        })
        .catch(err => {
            console.log(err);
            res.end("error occured.");
        });
});

module.exports = router;