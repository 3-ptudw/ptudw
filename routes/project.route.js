var express = require('express');
var categoryModel = require('../models/category.model');

var router = express.Router();

router.get('/:id/categories', (req, res, next) => {
  var id = req.params.id;
  var page = req.query.page || 1;
  if (page < 1) page = 1;

  var limit = 6;
  var offset = (page - 1) * limit;


  Promise.all([
    categoryModel.pageById(id, limit, offset),
    categoryModel.countById(id),
  ]).then(([rows, count_rows]) => {
    for (const c of res.locals.lcProjects) {
      if (c.id === +id) {
        c.isActive = true;
      }
    }

    var total = count_rows[0].total;
    var nPages = Math.floor(total / limit);
    if (total % limit > 0) nPages++;
    var pages = [];
    for (i = 1; i <= nPages; i++) {
      var obj = { value: i, active: i === +page };
      pages.push(obj);
    }

    res.render('categories/id', {
      categories: rows,
      pages
    });
  }).catch(next);
})

module.exports = router;