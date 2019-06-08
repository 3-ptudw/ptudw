var express = require("express");
var bcrypt = require('bcrypt');
var moment = require('moment');
var passport = require('passport');
var adminModel = require("../models/admin.model");

var router = express.Router();

router.get('/is-available', (req, res, next) => {
    var username = req.query.username;
    adminModel.singleByUsername(username).then(rows => {
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

router.post('/signin', (req, res, next) => {
    passport.authenticate('local', (err, email, info) => {
        if (err) {
            return next(err);
        } else {
            if (!email) {
                return res.render('admin/signin', {
                    layout: false,
                    err_message: info.message
                })
            } else {
                req.logIn(email, err => {
                    if (err) {
                        return next(err);
                    } else {
                        return res.redirect('/');
                    }
                });
            }
        }
    })(req, res, next);
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
        username: req.body.username,
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