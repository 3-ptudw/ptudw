var express = require("express");
var bcrypt = require('bcrypt');
var moment = require('moment');
var passport = require('passport');
var auth = require("../middlewares/auth");
var postModel = require("../models/post.model");
var adminModel = require("../models/admin.model");
var categoryModel = require("../models/category.model");
var homepageModel = require("../models/homepage.model.");


var router = express.Router();

router.get("/", (req, res) => {
    postModel
        .trueStatus()
        .then(rows => {
            res.render("home", {
                posts: rows,
            });
        })
        .catch(err => {
            console.log(err);
            res.end("error occured.");
        });
});

router.get("/post/:url", (req, res) => {
    var url = req.params.url;
    postModel
        .getURL(url)
        .then(rows => {
            if (rows.length > 0) {
                res.render("post", {
                    error: false,
                    post: rows[0],
                });
            } else {
                res.render("post", {
                    error: true,
                });
            }
        })
        .catch(err => {
            console.log(err);
            res.end(err);
        });
});

router.get("/category/:url", (req, res) => {
    var url = req.params.url;
    categoryModel
        .getURL(url)
        .then(rows => {
            if (rows.length > 0) {
                res.render("category", {
                    error: false,
                    category: rows[0],
                });
            } else {
                res.render("category", {
                    error: true,
                });
            }
        })
        .catch(err => {
            console.log(err);
            res.end(err);
        });
});

router.post('/logout', auth, (req, res, next) => {
    req.logOut();
    res.redirect('/signin');
})


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
    res.render("signin", {
        layout: false,
    });
});

router.post('/signin', (req, res, next) => {
    passport.authenticate('local', (err, email, info) => {
        if (err) {
            return next(err);
        } else {
            if (!email) {
                return res.render('signin', {
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
    res.render("signup", {
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
        res.redirect('/signin');
    });
});

module.exports = router;