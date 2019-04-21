var express = require('express');
var router = express.Router();

/* GET users listing. */
router.get('/', function(req, res, next) {
    res.send('respond with a resource');
});

/* GET user login page. */
router.get('/login', function(req, res, next) {
    res.render('users/login', { page: 'Login', menuId: 'Login' });
});

/* GET user register page. */
router.get('/register', function(req, res, next) {
    res.render('users/register', { page: 'Register', menuId: 'Register' });
});

module.exports = router;