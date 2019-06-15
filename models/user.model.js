var db = require('../utils/db');

module.exports = {

    all: () => {
        return db.load(`select *, roles.name as name_role, users.name as name, users.id as id, roles.id as id_role
        from users, roles
        where users.id_role = roles.id
        `);
    },

    single: id => {
        return db.load(`
        select *
        from users
        where id = ${id}
        `);
    },

    writer: () => {
        return db.load(`
        select *
        from users
        where users.id_role = 3
        `)
    },

    singleByFackbook: facebook_id => {
        return db.load(`select * from users where facebook_id = ${facebook_id}`);
    },

    add: entity => {
        return db.add('users', entity);
    },

    update: entity => {
        return db.update('users', 'id', entity);
    },
};