var express = require('express');
var categoryModel = require('../models/category.model');

var router = express.Router();

router.get("/category/:url", async(req, res, next) => {
    var url = req.params.url;
    var page = req.query.page || 1;
    if (page < 1) page = 1;

    var limit = 9;
    var offset = (page - 1) * limit;


    let [projects, categories, category, topPost, skipTopPost, news3, categories2] = await Promise.all([
        projectModel.all(),
        categoryModel.all(),
        categoryModel.getURL(url),
        categoryModel.topPost(url),
        categoryModel.skipTopPost(url),
        homepageModel.news3(),
        categoryModel.pageByURL(url, limit, offset),
        categoryModel.countByURL(url),
    ])

    var total = count_rows[0].total;
    var nPages = Math.floor(total / limit);
    if (total % limit > 0) nPages++;
    var pages = [];
    for (i = 1; i <= nPages; i++) {
        var obj = { value: i, active: i === +page };
        pages.push(obj);
    }

    res.render('categories/id', {
        categories: categories2,
        pages
    });

})

module.exports = router;