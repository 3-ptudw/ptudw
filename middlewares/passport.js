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
            callbackURL: "/auth/facebook/callback"
        },
        function(accessToken, refreshToken, profile, cb) {
            userModel.singleByFackbook({ facebook_id: profile.id }, function(err, user) {
                // return cb(err, user);
                if (err) {
                    return done(err);
                }
                if (user) {
                    return done(null, user); // user found, return that user
                } else {
                    // nếu chưa có, tạo mới user
                    var newUser = new userModel();
                    // lưu các thông tin cho user
                    newUser.facebook_id = profile.id;
                    newUser.token = token;
                    newUser.name = profile.name.givenName + ' ' + profile.name.familyName; // bạn có thể log đối tượng profile để xem cấu trúc
                    newUser.username = profile.emails[0].value; // fb có thể trả lại nhiều email, chúng ta lấy cái đầu tiền
                    // lưu vào db
                    newUser.save(function(err) {
                        if (err)
                            throw err;
                        // nếu thành công, trả lại user
                        return done(null, newUser);
                    });
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