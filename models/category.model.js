var db = require('../utils/db');

module.exports = {
    all: () => {
        return db.load('select *, projects.name as name_project from projects, categories where projects.id = categories.id_project ');
    },

    allById: id => {
        return db.load(`select * from categories where id_project = ${id}`);
    },

    pageById: (id, limit, offset) => {
        return db.load(`select * from categories where id_project = ${id} limit ${limit} offset ${offset}`);
    },

    countById: id => {
        return db.load(`select count(*) as total from categories where id_project = ${id}`);
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
        return db.load(`select *, posts.url as url_post
        from posts, categories
        where posts.id_category in (select * from (select id from categories where url = "${url}" LIMIT 1) temp_tab) and posts.status = true 
        ORDER BY posts.posted_at DESC`)
    }
};