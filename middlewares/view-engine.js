var exphbs = require('express-handlebars');
var hbs_sections = require('express-handlebars-sections');
var numeral = require('numeral');
var moment = require('moment');

module.exports = function(app) {
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

            'formatTime': function(date, format) {
                var mmnt = moment(date);
                return mmnt.format(format);
            },
        }
    }));
    app.set('view engine', 'hbs');
}