var db = require('../utils/db');

module.exports = {

    all: () => {
        return db.load(`select * from users`);
    },

    single: id => {
        return db.load(`select * from users where id = ${id}`);
    },

    singleByFackbook: facebook_id => {
        return db.load(`select * from users where facebook_id = ${facebook_id}`);
    },

    add: entity => {
        return db.add('users', entity);
    },

    update: entity => {
        return db.update('users', 'id', entity);
    },
};