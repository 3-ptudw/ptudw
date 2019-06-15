var express = require("express");
var auth = require("../../middlewares/auth");
var adminModel = require("../../models/admin.model");

var router = express.Router();

router.get("/", auth, async(req, res) => {

    let [myposts] = await Promise.all([
        adminModel.myposts(req.user.username),
    ])

    res.render("admin/myposts/index", {
        myposts: myposts,
        layout: 'admin.hbs',
    });

});


module.exports = router;