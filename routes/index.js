var express = require('express');
var router = express.Router();

/* GET home page. */
router.get('/', function(req, res, next) {
  res.render('index', {page:'Home', menuId:'home'});
});

/* GET about page. */
router.get('/about', function(req, res, next) {
  res.render('about', {page:'About', menuId:'about'});
});

/* GET contact page. */
router.get('/contact', function(req, res, next) {
  res.render('contact', {page:'Contact', menuId:'contact'});
});

/* GET login page. */
router.get('/admin/login', function(req, res, next) {
  res.render('admin/login', {page:'Login', menuId:'login'});
});

module.exports = router;
