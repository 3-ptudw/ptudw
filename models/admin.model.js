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

    editorAll: username => {
        return db.load(`
        select posts.title, posts.id as id, categories.name as name_category, posts.status as status
        from users, categories, posts
        where categories.id_user = (select * from (select id from users where username = '${username}') temp_tab) and posts.id_category = categories.id
        GROUP BY posts.id DESC
        `);
    },

    editorWait: username => {
        return db.load(`
        select posts.title, posts.id as id, categories.name as name_category, posts.status as status
        from users, categories, posts
        where categories.id_user = (select * from (select id from users where username = '${username}') temp_tab) and posts.id_category = categories.id and posts.status = 0
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