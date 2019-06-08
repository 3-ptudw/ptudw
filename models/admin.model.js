var db = require('../utils/db');

module.exports = {

    singleByEmail: email => {
        return db.load(`select * from users where email = '${email}'`);
    },

    add: entity => {
        return db.add('users', entity);
    },

};