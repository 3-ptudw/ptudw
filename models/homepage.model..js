var db = require('../utils/db');

module.exports = {
    all: () => {
        return db.load(`select * from posts`);
    },

    news10: () => {
        return db.load(`
        select *, categories.name as name_category, categories.url as url_category
        from categories, posts 
        where categories.id = posts.id_category and posts.status = true 
        ORDER BY posts.posted_at DESC 
        LIMIT 10
        `)
    },

    news3: () => {
        return db.load(`
        select *, categories.name as name_category, categories.url as url_category 
        from categories, posts 
        where categories.id = posts.id_category and posts.status = true 
        ORDER BY posts.posted_at DESC 
        LIMIT 3
        `)
    },

    view10: () => {
        return db.load(`
        select *, categories.name as name_category, categories.url as url_category 
        from categories, posts 
        where categories.id = posts.id_category 
        and posts.status = true 
        ORDER BY posts.views DESC 
        LIMIT 10
        `)
    },

    top10Cat: () => {
        return db.load(`
        (select p1.posted_at as posted_at, p1.url_thumbnail as url_thumbnail, p1.title as title, p1.url as url, (select name from categories where p1.id_category = categories.id) as name_category, (select url from categories where p1.id_category = categories.id) as url_category
        from posts p1,posts p2
        where p1.id_category = p2.id_category and p1.posted_at >= ALL(select p3.posted_at from posts p3 where p1.id_category=p3.id_category) 
        GROUP BY p1.id_category 
        LIMIT 10)
        `);
    },

};