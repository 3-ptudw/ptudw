var express = require('express');
var router = express.Router();

/* GET admin listing. */
router.get('/', function(req, res, next) {
    res.redirect('login');
});

/* GET admin login page. */
router.get('/login', function(req, res, next) {
    res.render('admin/login', { page: 'Login', menuId: 'Login' });
});

/* GET admin dashboard page. */
router.get('/dashboard', function(req, res, next) {
    res.render('admin/dashboard', { page: 'Dashboard', menuId: 'Dashboard' });
});

/* GET admin minor page. */
router.get('/minor', function(req, res, next) {
    res.render('admin/minor', { page: 'Minor', menuId: 'Minor' });
});

/* GET admin post page. */
router.get('/admin-post', function(req, res, next) {
    res.render('admin/admin-post', { page: 'Post', menuId: 'Post' });
});

/* GET admin post page. */
router.get('/admin-post-edit', function(req, res, next) {
    res.render('admin/admin-post-edit', { page: 'Edit', menuId: 'Edit' });
});

/* GET writer post page. */
router.get('/writer-post', function(req, res, next) {
    res.render('admin/writer-post', { page: 'Post', menuId: 'Post' });
});

/* GET writer post page. */
router.get('/writer-post-edit', function(req, res, next) {
    res.render('admin/writer-post-edit', { page: 'Edit', menuId: 'Edit' });
});

/* GET editor post page. */
router.get('/editor-post', function(req, res, next) {
    res.render('admin/editor-post', { page: 'Post', menuId: 'Post' });
});

/* GET editor post page. */
router.get('/editor-post-edit', function(req, res, next) {
    res.render('admin/editor-post-edit', { page: 'Edit', menuId: 'Edit' });
});

/* GET admin user page. */
router.get('/admin-user', function(req, res, next) {
    res.render('admin/admin-user', { page: 'User', menuId: 'User' });
});

module.exports = router;