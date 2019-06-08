var express = require('express');
var exphbs = require('express-handlebars');
var hbs_sections = require('express-handlebars-sections');
var morgan = require('morgan');
var numeral = require('numeral');

var app = express();

app.use(morgan('dev'));
app.use(express.urlencoded({ extended: true }));
app.use(express.static('public'));

app.engine('hbs', exphbs({
    layoutsDir: 'views/_layouts',
    defaultLayout: 'main.hbs',
    helpers: {
        format: val => {
            return numeral(val).format('0,0');
        },
        section: hbs_sections(),
        opt: (val1, opt, val2) => {
            switch (opt) {
                case '==':
                    return val1 == val2
            }
        },
    }
}));
app.set('view engine', 'hbs');

app.use(require('./middlewares/locals.mdw'));

app.use('/', require('./routes/homepage.route'))
app.use('/admin', require('./routes/admin.route'))
app.use('/admin/projects', require('./routes/admin/project.route'))
app.use('/admin/categories', require('./routes/admin/category.route'))
app.use('/admin/posts', require('./routes/admin/post.route'))

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