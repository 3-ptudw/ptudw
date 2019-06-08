var db = require('../utils/db');

module.exports = {

    singleByUsername: username => {
        return db.load(`select * from users where username = '${username}'`);
    },

    add: entity => {
        return db.add('users', entity);
    },

};