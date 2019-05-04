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

/* GET admin article page. */
router.get('/admin-article', function(req, res, next) {
    res.render('admin/admin-article', { page: 'article', menuId: 'article' });
});

/* GET admin article page. */
router.get('/admin-article-edit', function(req, res, next) {
    res.render('admin/admin-article-edit', { page: 'article', menuId: 'article' });
});

/* GET admin post page. */
router.get('/admin-post', function(req, res, next) {
    res.render('admin/admin-post', { page: 'Post', menuId: 'Post' });
});

/* GET admin post page. */
router.get('/admin-post-edit', function(req, res, next) {
    res.render('admin/admin-post-edit', { page: 'Edit', menuId: 'Edit' });
});

/* GET admin tag page. */
router.get('/admin-tag', function(req, res, next) {
    res.render('admin/admin-tag', { page: 'tag', menuId: 'tag' });
});

/* GET admin user page. */
router.get('/admin-user', function(req, res, next) {
    res.render('admin/admin-user', { page: 'User', menuId: 'User' });
});

/* GET admin user page. */
router.get('/admin-user-edit', function(req, res, next) {
    res.render('admin/admin-user-edit', { page: 'User', menuId: 'User' });
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

/* GET admin subscriber page. */
router.get('/subscriber-infomation-edit', function(req, res, next) {
    res.render('admin/subscriber-infomation-edit', { page: 'infomation', menuId: 'infomation' });
});

/* GET admin user page. */
router.get('/404', function(req, res, next) {
    res.render('admin/404', { page: '404', menuId: '404' });
});

module.exports = router;