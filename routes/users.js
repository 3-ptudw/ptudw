var express = require('express');
var router = express.Router();

/* GET users listing. */
router.get('/', function(req, res, next) {
    res.redirect('login');
});

/* GET user login page. */
router.get('/login', function(req, res, next) {
    res.render('users/login', { page: 'Login', menuId: 'Login' });
});

/* GET user register page. */
router.get('/register', function(req, res, next) {
    res.render('users/register', { page: 'Register', menuId: 'Register' });
});

/* GET user register page. */
router.get('/forgot_password', function(req, res, next) {
    res.render('users/forgot_password', { page: 'forgot_password', menuId: 'forgot_password' });
});

module.exports = router;