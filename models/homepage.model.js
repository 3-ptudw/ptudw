var db = require('../utils/db');

module.exports = {
    all: () => {
        return db.load(`select * from posts`);
    },

    news10: () => {
        return db.load(`
            select *, categories.name as name_category, categories.url as url_category
            from categories, posts 
            where categories.id = posts.id_category and posts.status = 2 
            ORDER BY posts.posted_at DESC 
            LIMIT 10
        `)
    },

    news3: () => {
        return db.load(`
            select *, categories.name as name_category, categories.url as url_category 
            from categories, posts 
            where categories.id = posts.id_category and posts.status = 2 
            ORDER BY posts.posted_at DESC 
            LIMIT 3
        `)
    },

    view10: () => {
        return db.load(`
            select *, categories.name as name_category, categories.url as url_category 
            from categories, posts 
            where categories.id = posts.id_category and posts.status = 2 
            ORDER BY posts.views DESC 
            LIMIT 10
        `)
    },

    top10Cat: () => {
        return db.load(`
            select p1.posted_at as posted_at, p1.url_thumbnail as url_thumbnail, p1.title as title, p1.url as url, (select name from categories where p1.id_category = categories.id) as name_category, (select url from categories where p1.id_category = categories.id) as url_category
            from posts p1, posts p2
            where p1.id_category = p2.id_category and p1.posted_at >= ALL(select p3.posted_at from posts p3 where p1.id_category=p3.id_category) 
            GROUP BY p1.id_category, p1.posted_at, p1.url_thumbnail, p1.title, p1.url
            LIMIT 10
        `);
    },

    addComment: entity => {
        return db.add('comments', entity);
    },

    loadCommentGetByURL: url => {
        return db.load(`
            select DISTINCT comments.content as content_comment, comments.created_at as time_comment, (select name from users where comments.id_user = users.id ) as name_user, (select avatar from users where comments.id_user = users.id ) as avatar_url 
            from comments, posts
            where comments.id_post in (select * from (select id from posts where url = "${url}") temp_tab)
            GROUP BY posts.id, comments.id
        `);
    },

    search: (data) => {
        return db.load(`
            select *, p.url as url_post, c.name as name_category, c.url as url_category 
            from posts p left join categories c on c.id = p.id_category
            where (p.url like "%${data}%" or p.abstract like "%${data}%" or p.content like "%${data}%") and status = 2
            GROUP BY p.id
        `);
    },

}