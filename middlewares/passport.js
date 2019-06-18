var passport = require('passport');
var LocalStrategy = require('passport-local').Strategy;
var FacebookStrategy = require('passport-facebook').Strategy;
var bcrypt = require('bcrypt');
var adminModel = require('../models/admin.model');
var userModel = require('../models/user.model');

module.exports = function(app) {
    app.use(passport.initialize());
    app.use(passport.session());

    passport.use(new FacebookStrategy({
            clientID: "2287560411572098",
            clientSecret: "ac594a05b480452c6f6936968f7ffa13",
            callbackURL: "https://viralstory.herokuapp.com/auth/facebook/callback"
        },
        function(accessToken, refreshToken, profile, cb) {
            userModel.singleByFackbook({ facebook_id: profile.id }, async function(err, user) {
                // return cb(err, user);
                if (err) {
                    return done(err);
                }
                if (user) {
                    return done(null, user); // user found, return that user
                } else {
                    var entity = {
                        username: profile.emails[0].value,
                        password: '123456789',
                        name: profile.name.givenName + ' ' + profile.name.familyName,
                        other_name: profile.name.givenName + ' ' + profile.name.familyName,
                        date_of_birth: '1970-1-1',
                        facebook_id: profile.id,
                        id_role: 4,
                        avatar: 'http://www.medya32.com/themes/gold/assets/images/no-author-photo.png',
                        created_at: new Date(),
                        updated_at: new Date(),
                    }
                    let [] = await Promise.all([
                        adminModel.add(entity),
                    ])
                    return done(null, user);
                }
            });
        }
    ));

    passport.use(new LocalStrategy({
        usernameField: 'username',
        passwordField: 'password'
    }, (username, password, done) => {
        adminModel.singleByUsername(username).then(rows => {
            if (rows.length === 0) {
                return done(null, false, { message: 'Invalid email.' });
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
    }));

    passport.serializeUser((user, done) => {
        return done(null, user);
    });

    passport.deserializeUser((user, done) => {
        return done(null, user);
    });
}