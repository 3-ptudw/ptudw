var db = require('../utils/db');

module.exports = {
    all: () => {
        return db.load('select *, categories.name as name_category from categories, posts where categories.id = posts.id_category');
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
        return db.load(`select * from posts where posts.url = "${url}"`);
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