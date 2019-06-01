var db = require('../utils/db');

module.exports = {
  all: () => {
    return db.load('select * from categories');
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

  single: id => {
    return db.load(`select * from categories where id = ${id}`);
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
};
