var express = require('express');
var router = express.Router();

/* GET admin listing. */
router.get('/', function(req, res, next) {
    res.send('respond with a resource');
});

/* GET admin login page. */
router.get('/login', function(req, res, next) {
    res.render('admin/login', { page: 'Login', menuId: 'login' });
});

module.exports = router;