var db = require('../utils/db');

module.exports = {

    singleByUsername: username => {
        return db.load(`select * from users where username = '${username}'`);
    },

    writer: username => {
        return db.load(`
        select *, posts.status as status, (select name from categories where posts.id_category = categories.id) as name_category
        from users, posts
        where posts.id_user = (select * from (select id from users where username = '${username}') temp_tab)
        GROUP BY posts.id DESC
        `);
    },

    add: entity => {
        return db.add('users', entity);
    },

    update: entity => {
        return db.update('users', 'id', entity);
    },

    allrole: () => {
        return db.load(`
            select * from roles
        `);
    },
};