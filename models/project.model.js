var db = require('../utils/db');

module.exports = {
    all: () => {
        return db.load('select * from projects');
    },

    allWithDetails: () => {
        return db.load(`
    select p.id, p.name, count(c.id) as num_of_categories
    from projects p left join categories c on p.id = c.id_project
    group by p.id, p.name
    `);
    },

    single: id => {
        return db.load(`select * from projects where id = ${id}`);
    },

    add: entity => {
        return db.add('projects', entity);
    },

    update: entity => {
        return db.update('projects', 'id', entity);
    },

    delete: id => {
        return db.delete('projects', 'id', id);
    },

    pagination: (limit, offset) => {
        return db.load(`
        select *
        from projects
        limit ${limit} 
        offset ${offset}
        `)
    },

    count: () => {
        return db.load(`
        select count(*) as total
        from projects
        `)
    },
};