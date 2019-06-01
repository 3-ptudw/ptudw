var express = require('express');
var exphbs = require('express-handlebars');
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
        }
    }
}));
app.set('view engine', 'hbs');

app.use(require('./middlewares/locals.mdw'));

app.get('/', (req, res) => {
    res.render('home');
})

app.use('/projects', require('./routes/project.route'))
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
        error
    })
})

app.listen(process.env.port || 3000, () => {
    console.log('server is running at http://localhost:3000');
})