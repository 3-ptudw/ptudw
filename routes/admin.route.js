var express = require("express");
var bcrypt = require('bcrypt');
var moment = require('moment');
var adminModel = require("../models/admin.model");

var router = express.Router();

router.get('/is-available', (req, res, next) => {
    var email = req.query.email;
    adminModel.singleByEmail(email).then(rows => {
        if (rows.length > 0) {
            return res.json(false);
        } else {
            return res.json(true);
        }
    });
});

router.get("/signin", (req, res) => {
    res.render("admin/signin", {
        layout: false,
    });
});

router.get("/signup", (req, res) => {
    res.render("admin/signup", {
        layout: false,
    });
});

router.post('/signup', (req, res, next) => {
    var saltRounds = 10;
    var hash = bcrypt.hashSync(req.body.password, saltRounds);
    var dob = moment(req.body.date_of_birth, 'DD/MM/YYYY').format('YYYY-MM-DD');

    var entity = {
        email: req.body.email,
        password: hash,
        name: req.body.name,
        other_name: req.body.name,
        date_of_birth: dob,
        id_role: 0,
    }

    adminModel.add(entity).then(id => {
        res.redirect('/admin/signin');
    });
});

module.exports = router;