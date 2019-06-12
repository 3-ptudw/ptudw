var express = require("express");
var userModel = require("../../models/user.model");

var router = express.Router();

router.get("/", (req, res) => {
    userModel
        .all()
        .then(rows => {
            res.render("admin/users/index", {
                users: rows,
                layout: 'admin.hbs',
            });
        })
        .catch(err => {
            console.log(err);
            res.end("error occured.");
        });
});

router.get("/edit/:id", (req, res) => {
    var id = req.params.id;
    if (isNaN(id)) {
        res.render("admin/users/edit", {
            error: true,
            layout: 'admin.hbs',
        });
    }

    userModel
        .single(id)
        .then(rows => {
            if (rows.length > 0) {
                res.render("admin/users/edit", {
                    error: false,
                    user: rows[0],
                    layout: 'admin.hbs',
                });
            } else {
                res.render("admin/users/edit", {
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
        other_name: req.body.other_name,
        id_role: req.body.id_role,
        premium: req.body.premium,
        is_active: req.body.is_active,
        updated_at: new Date(),
    }
    userModel
        .update(entity)
        .then(n => {
            res.redirect("/admin/users");
        })
        .catch(err => {
            console.log(err);
            res.end("error occured.");
        });
});


module.exports = router;