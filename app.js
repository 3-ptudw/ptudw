var express = require('express');
var morgan = require('morgan');
var auth = require("./middlewares/auth");
var app = express();

app.use(morgan('dev'));
app.use(express.urlencoded({ extended: true }));
app.use(express.static('public'));

require('./middlewares/view-engine')(app);
require('./middlewares/session')(app);
require('./middlewares/passport')(app);

app.use(require('./middlewares/auth-locals.mdw'));
app.use(require('./middlewares/locals.mdw'));

app.use('/', require('./routes/homepage.route'))
app.use('/admin', auth, require('./routes/admin.route'))
app.use('/admin/projects', auth, require('./routes/admin/project.route'))
app.use('/admin/categories', auth, require('./routes/admin/category.route'))
app.use('/admin/posts', auth, require('./routes/admin/post.route'))
app.use('/admin/users', auth, require('./routes/admin/user.route'))
app.use('/admin/writer', auth, require('./routes/admin/writer.route'))
app.use('/admin/editor', auth, require('./routes/admin/editor.route'))

app.use((req, res, next) => {
    res.render('404', { layout: false });
})

app.use((error, req, res, next) => {
    res.render('error', {
        layout: false,
        message: error.message,
        error,
    })
})

var port = process.env.PORT || 3000;

app.listen(port, function() {
    console.log('Example app listening on port ' + port + '!');
});