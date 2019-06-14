var db = require('../utils/db');

module.exports = {
    all: () => {
        return db.load(`select * from posts`);
    },

    news10: () => {
        return db.load(`select *, categories.name as name_category 
        from categories, posts 
        where categories.id = posts.id_category and posts.status = true 
        ORDER BY posts.posted_at DESC 
        LIMIT 10`)
    },

    news3: () => {
        return db.load(`select *, categories.name as name_category 
        from categories, posts 
        where categories.id = posts.id_category and posts.status = true 
        ORDER BY posts.posted_at DESC 
        LIMIT 3`)
    },

    view10: () => {
        return db.load(`select *, categories.name as name_category 
        from categories, posts 
        where categories.id = posts.id_category 
        and posts.status = true 
        ORDER BY posts.views DESC 
        LIMIT 10`)
    },

};