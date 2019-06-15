var express = require("express");
var userModel = require("../../models/user.model");
var adminModel = require("../../models/admin.model");

var router = express.Router();

router.get("/", async(req, res) => {

    let [users] = await Promise.all([
        userModel.all(),
    ])

    res.render("admin/users/index", {
        users: users,
        layout: 'admin.hbs',
    });

});

router.get("/edit/:id", async(req, res) => {
    var id = req.params.id;
    if (isNaN(id)) {
        res.render("admin/users/edit", {
            error: true,
            layout: 'admin.hbs',
        });
    }

    let [user, roles] = await Promise.all([
        userModel.single(id),
        adminModel.allrole(),
    ])

    if (user.length > 0) {
        res.render("admin/users/edit", {
            error: false,
            user: user[0],
            roles: roles,
            layout: 'admin.hbs',
        });
    } else {
        res.render("admin/users/edit", {
            error: true,
            layout: 'admin.hbs',
        });
    }

});

router.post("/update", (req, res) => {
    var entity = {
        id: req.body.id,
        name: req.body.name,
        other_name: req.body.other_name,
        id_role: req.body.id_role,
        premium: req.body.premium,
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