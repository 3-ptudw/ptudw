var express = require("express");
var adminModel = require("../models/admin.model");

var router = express.Router();

router.get("/signin", (req, res) => {
    res.render("admin/signin", {
        layout: false,
    });
});

router.get("/signup", (req, res) => {
    res.render("admin/signup", {
        layout: false,
    });
});

module.exports = router;