var db = require('../utils/db');

module.exports = {
    all: () => {
        return db.load(`
        select *, categories.name as name_category 
        from categories, posts 
        where categories.id = posts.id_category
        ORDER BY posts.id DESC
        `);
    },

    trueStatus: () => {
        return db.load('select *, categories.name as name_category, categories.url as url_category from categories, posts where categories.id = posts.id_category and posts.status = true');
    },

    falseStatus: () => {
        return db.load('select *, categories.name as name_category from categories, posts where categories.id = posts.id_category and posts.status = true');
    },

    single: id => {
        return db.load(`select * from posts where id = ${id}`);
    },

    getURL: url => {
        return db.load(`
        select *, categories.name as name_category, categories.url as url_category, users.name as name_user, (select title from posts where url = "${url}") as title_post, (select content from posts where url = "${url}") as content_post
        from posts, categories, users
        where categories.id in (select * from (select id_category from posts where url = "${url}") temp_tab) and posts.status = true
        `);
    },

    random5: url => {
        return db.load(`
        select *, posts.url as url_post, posts.title as title_post
        from posts, categories
        where posts.id_category = (select * from (select id_category from posts p1 where url = "${url}") temp_tab) and posts.status = true
        GROUP BY posts.title
        LIMIT 5
        `);
    },

    add: entity => {
        return db.add('posts', entity);
    },

    update: entity => {
        return db.update('posts', 'id', entity);
    },

    delete: id => {
        return db.delete('posts', 'id', id);
    },
};