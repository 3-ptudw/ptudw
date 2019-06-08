var passport = require('passport');
var LocalStrategy = require('passport-local').Strategy;
var bcrypt = require('bcrypt');
var adminModel = require('../models/admin.model');

module.exports = function(app) {
    app.use(passport.initialize());
    app.use(passport.session());

    var ls = new LocalStrategy({
        usernameField: 'username',
        passwordField: 'password'
    }, (username, password, done) => {
        adminModel.singleByUsername(username).then(rows => {
            if (rows.length === 0) {
                return done(null, false, { message: 'Invalid username.' });
            } else {
                var user = rows[0];
                var ret = bcrypt.compareSync(password, rows[0].password);
                if (ret) {
                    return done(null, user);
                } else {
                    return done(null, false, { message: 'Invalid password.' });
                }
            }
        }).catch(err => {
            return done(err, false);
        })
    });

    passport.use(ls);

    passport.serializeUser((user, done) => {
        return done(null, user);
    });

    passport.deserializeUser((user, done) => {
        return done(null, user);
    });
}