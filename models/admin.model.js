var db = require('../utils/db');

module.exports = {

    singleByUsername: username => {
        return db.load(`select * from users where username = '${username}'`);
    },

    myposts: username => {
        return db.load(`
        select * 
        from users, posts
        where posts.id_user = (select * from (select id from users where username = '${username}') temp_tab)
        `);
    },

    add: entity => {
        return db.add('users', entity);
    },

    update: entity => {
        return db.update('users', 'id', entity);
    },
};