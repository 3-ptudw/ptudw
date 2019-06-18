var express = require("express");
var bcrypt = require('bcrypt');
var moment = require('moment');
var passport = require('passport');
var auth = require("../middlewares/auth");
var postModel = require("../models/post.model");
var adminModel = require("../models/admin.model");
var categoryModel = require("../models/category.model");
var homepageModel = require("../models/homepage.model");
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

router.get("/search", async(req, res) => {

    data = req.query.search;

    let [projects, categories, posts] = await Promise.all([
        projectModel.all(),
        categoryModel.all(),
        homepageModel.search(data),
    ])

    res.render("search", {
        projects: projects,
        categories: categories,
        posts: posts,
        data,
    });
});

router.get("/category/:url", async(req, res, next) => {
    var url = req.params.url;
    var page = req.query.page || 1;
    if (page < 1) page = 1;

    var limit = 9;
    var offset = 1 + (page - 1) * limit;

    let [projects, categories, category, topPost, skipTopPost, news3, count_rows] = await Promise.all([
        projectModel.all(),
        categoryModel.all(),
        categoryModel.getURL(url),
        categoryModel.topPost(url),
        categoryModel.skipTopPost(url, limit, offset),
        homepageModel.news3(),
        categoryModel.countByURL(url),
    ])

    if (!count_rows[0]) {
        res.render("category", {
            error: true,
            projects: projects,
            categories: categories,
            news3: news3,
        });
    }
    var total = count_rows[0].total;
    var nPages = Math.floor(total / limit);
    if (total % limit > 0) nPages++;
    var pages = [];
    for (i = 1; i <= nPages; i++) {
        var obj = { value: i, active: i === +page };
        pages.push(obj);
    }

    if (category.length > 0) {
        res.render("category", {
            error: false,
            category: category[0],
            topPost: topPost[0],
            skipTopPost: skipTopPost,
            projects: projects,
            categories: categories,
            news3: news3,
            pages
        });
    } else {
        res.render("category", {
            error: true,
        });
    }
});

router.get("/post/:url", async(req, res) => {
    var url = req.params.url;
    let [projects, categories, post, random5, news3, comments] = await Promise.all([
        projectModel.all(),
        categoryModel.all(),
        postModel.getURL(url),
        postModel.random5(url),
        homepageModel.news3(),
        homepageModel.loadCommentGetByURL(url),
    ])

    if (post.length > 0) {
        res.render("post", {
            error: false,
            post: post[0],
            random5: random5,
            projects: projects,
            categories: categories,
            news3: news3,
            comments: comments,
        });
    } else {
        res.render("post", {
            error: true,
        });
    }
});

router.post('/comment/post/:id/:url', async(req, res, next) => {

    url = '/post/' + req.params.url + '#comments';
    var entity = {
        id_user: req.user.id,
        id_post: req.params.id,
        content: req.body.content,
        created_at: new Date(),
        updated_at: new Date(),
    }

    let [] = await Promise.all([
        homepageModel.addComment(entity),
    ])

    res.redirect(url);
});



router.post('/logout', auth, (req, res, next) => {
    req.logOut();
    res.redirect('/signin');
})


router.get('/is-available', async(req, res, next) => {
    var username = req.query.username;

    let [rows] = await Promise.all([
        adminModel.singleByUsername(username),
    ])
    if (rows.length > 0) {
        return res.json(false);
    } else {
        return res.json(true);
    }
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

router.post('/signup', async(req, res, next) => {
    var saltRounds = 10;
    var hash = bcrypt.hashSync(req.body.password, saltRounds);
    var dob = moment(req.body.date_of_birth, 'DD/MM/YYYY').format('YYYY-MM-DD');

    var entity = {
        username: req.body.username,
        password: hash,
        name: req.body.name,
        other_name: req.body.name,
        date_of_birth: dob,
        id_role: 4,
        avatar: 'http://www.medya32.com/themes/gold/assets/images/no-author-photo.png',
        created_at: new Date(),
        updated_at: new Date(),
    }

    let [] = await Promise.all([
        adminModel.add(entity),
    ])

    res.redirect('/signin');
});

router.get("/profile", auth, async(req, res) => {
    let [projects, categories, user_profile, news3] = await Promise.all([
        projectModel.all(),
        categoryModel.all(),
        adminModel.singleByUsername(req.user.username),
        homepageModel.news3(),
    ])
    if (user_profile.length > 0) {
        res.render("profile", {
            user_profile: user_profile[0],
            projects: projects,
            categories: categories,
            news3: news3,
        });
    } else {
        res.redirect('/signin');
    }
});

router.post("/profile", auth, async(req, res) => {

    var dob = moment(req.body.date_of_birth, "DD/MM/YYYY").format("YYYY-MM-DD");
    var entity = {
        id: req.user.id,
        name: req.body.name,
        other_name: req.body.other_name,
        date_of_birth: dob,
        avatar: req.body.avatar,
        updated_at: new Date(),
    }

    let [] = await Promise.all([
        adminModel.update(entity),
    ])

    res.redirect("/profile");

});

router.get("/changepassword", auth, async(req, res) => {

    let [projects, categories, user_profile, news3] = await Promise.all([
        projectModel.all(),
        categoryModel.all(),
        adminModel.singleByUsername(req.user.username),
        homepageModel.news3(),
    ])
    if (user_profile.length > 0) {
        res.render("changepassword", {
            user_profile: user_profile[0],
            projects: projects,
            categories: categories,
            news3: news3,
        });
    } else {
        res.redirect('/signin');
    }

});

router.post("/changepassword", auth, async(req, res) => {

    var saltRounds = 10;
    var hash = bcrypt.hashSync(req.body.password, saltRounds);
    var entity = {
        id: req.user.id,
        password: hash,
        updated_at: new Date(),
    }

    let [] = await Promise.all([
        adminModel.update(entity),
    ])

    res.redirect("/changepassword");

});

module.exports = router;