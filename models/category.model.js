var db = require('../utils/db');

module.exports = {
    all: () => {
        return db.load(`
        select *, projects.name as name_project 
        from projects, categories 
        where projects.id = categories.id_project
        `);
    },

    pagination: (limit, offset) => {
        return db.load(`
        select *, projects.name as name_project 
        from projects, categories 
        where projects.id = categories.id_project
        limit ${limit} 
        offset ${offset}
        `);
    },

    count: () => {
        return db.load(`
        select count(*) as total
        from categories
        `)
    },

    allById: id => {
        return db.load(`select * from categories where id_project = ${id}`);
    },

    getByProject: id => {
        return db.load(`select * from categories where id_project = ${id}`);
    },

    single: id => {
        return db.load(`select * from categories where id = ${id}`);
    },

    getURL: url => {
        return db.load(`select * from categories where url = "${url}"`);
    },

    add: entity => {
        return db.add('categories', entity);
    },

    update: entity => {
        return db.update('categories', 'id', entity);
    },

    delete: id => {
        return db.delete('categories', 'id', id);
    },

    topPost: url => {
        return db.load(`
        select *, posts.url as url_post
        from posts, categories
        where posts.id_category in (select * from (select id from categories where url = "${url}" LIMIT 1) temp_tab) and posts.status = 2 
        ORDER BY posts.posted_at DESC
        `)
    },

    skipTopPost: (url, limit, offset) => {
        return db.load(`
        select DISTINCT posts.url as url_post, posts.posted_at as posted_at, posts.url_thumbnail as url_thumbnail, posts.title as title, posts.abstract as abstract
        from categories, posts
        where posts.id_category in (select * from (select id from categories where url = "${url}") temp_tab) and posts.status = 2 
        GROUP BY posts.url, categories.id, posts.id, posts.posted_at
        ORDER BY posts.posted_at DESC
        LIMIT ${limit} 
        OFFSET ${offset}
        `)
    },

    countByURL: url => {
        return db.load(`
        select count(posts.id_category) as total 
        from categories, posts 
        where posts.id_category in (select * from (select id from categories where url = "${url}") temp_tab) and posts.status = 2 
        GROUP BY categories.id
        `);
    },
};