var express = require("express");
var bcrypt = require('bcrypt');
var moment = require('moment');
var passport = require('passport');
var auth = require("../middlewares/auth");
var postModel = require("../models/post.model");
var adminModel = require("../models/admin.model");
var categoryModel = require("../models/category.model");
var homepageModel = require("../models/homepage.model.");
var projectModel = require("../models/project.model");


var router = express.Router();

router.get("/", async(req, res) => {

    let [projects, categories, views10, news10, news3, top10Cat, posts] = await Promise.all([
        projectModel.all(),
        categoryModel.all(),
        homepageModel.view10(),
        homepageModel.news10(),
        homepageModel.news3(),
        homepageModel.top10Cat(),
        postModel.trueStatus(),
    ])

    res.render("home", {
        projects: projects,
        categories: categories,
        view10: views10,
        news10: news10,
        news3: news3,
        top10Cat: top10Cat,
        posts: posts,
    });
});

router.get("/post/:url", async(req, res) => {
    var url = req.params.url;
    let [post, random5] = await Promise.all([
        postModel.getURL(url),
        postModel.random5(url),
    ])

    if (post.length > 0) {
        res.render("post", {
            error: false,
            post: post[0],
            random5: random5,
        });
    } else {
        res.render("post", {
            error: true,
        });
    }
});

router.get("/category/:url", async(req, res) => {
    var url = req.params.url;
    let [category, topPost, skipTopPost] = await Promise.all([
        categoryModel.getURL(url),
        categoryModel.topPost(url),
        categoryModel.skipTopPost(url),
    ])

    if (category.length > 0) {
        res.render("category", {
            error: false,
            category: category[0],
            topPost: topPost[0],
            skipTopPost: skipTopPost,
        });
    } else {
        res.render("category", {
            error: true,
        });
    }

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
    if (!req.user) {
        res.render("signin", {
            layout: false,
        });
    } else {
        res.redirect('/');
    }
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

router.get('/auth/facebook',
    passport.authenticate('facebook'));

router.get('/auth/facebook/callback',
    passport.authenticate('facebook', { failureRedirect: '/signin' }),
    function(req, res) {
        res.redirect('/');
    });

router.get("/signup", (req, res) => {
    if (!req.user) {
        res.render("signup", {
            layout: false,
        });
    } else {
        res.redirect('/');
    }
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
        created_at: new Date(),
        updated_at: new Date(),
    }

    adminModel.add(entity).then(id => {
        res.redirect('/signin');
    });
});

router.get("/profile", auth, (req, res) => {
    adminModel.singleByUsername(req.user.username).then(rows => {
        if (rows.length > 0) {
            res.render("profile", {
                user_profile: rows[0],
            });
        } else {
            res.redirect('/signin');
        }
    });
});

router.post("/profile", auth, (req, res) => {

    var dob = moment(req.body.date_of_birth, 'YYYY-MM-DD').format('YYYY-MM-DD');
    var entity = {
        id: req.user.id,
        name: req.body.name,
        other_name: req.body.other_name,
        date_of_birth: dob,
        updated_at: new Date(),
    }

    adminModel.update(entity).then(n => {
            res.redirect("/profile");
        })
        .catch(err => {
            console.log(err);
            res.end("error occured.");
        });
});

router.get("/changepassword", auth, (req, res) => {

    adminModel.singleByUsername(req.user.username).then(rows => {
        if (rows.length > 0) {
            res.render("changepassword", {
                user_profile: rows[0],
            });
        } else {
            res.redirect('/signin');
        }
    });
});

router.post("/changepassword", auth, (req, res) => {

    var saltRounds = 10;
    var hash = bcrypt.hashSync(req.body.password, saltRounds);
    var entity = {
        id: req.user.id,
        password: hash,
        updated_at: new Date(),
    }

    adminModel.update(entity).then(n => {
            res.redirect("/changepassword");
        })
        .catch(err => {
            console.log(err);
            res.end("error occured.");
        });
});

module.exports = router;