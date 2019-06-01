var express = require("express");
var projectModel = require("../../models/project.model");

var router = express.Router();

router.get("/", (req, res) => {
  projectModel
    .all()
    .then(rows => {
      res.render("admin/projects/index", {
        categories: rows
      });
    })
    .catch(err => {
      console.log(err);
      res.end("error occured.");
    });
});

router.get("/add", (req, res) => {
  res.render("admin/projects/add");
});

router.post("/add", (req, res) => {
  projectModel
    .add(req.body)
    .then(id => {
      // console.log(id);
      res.redirect("/admin/projects");
    })
    .catch(err => {
      console.log(err);
      res.end("error occured.");
    });
});

router.get("/edit/:id", (req, res) => {
  var id = req.params.id;
  if (isNaN(id)) {
    res.render("admin/projects/edit", {
      error: true
    });
  }

  projectModel
    .single(id)
    .then(rows => {
      if (rows.length > 0) {
        res.render("admin/projects/edit", {
          error: false,
          project: rows[0]
        });
      } else {
        res.render("admin/projects/edit", {
          error: true
        });
      }
    })
    .catch(err => {
      console.log(err);
      res.end("error occured.");
    });
});

router.post("/update", (req, res) => {
  projectModel
    .update(req.body)
    .then(n => {
      res.redirect("/admin/projects");
    })
    .catch(err => {
      console.log(err);
      res.end("error occured.");
    });
});

router.get("/delete/:id", (req, res) => {
  projectModel
    .delete(req.params.id)
    .then(n => {
      res.redirect("/admin/projects");
    })
    .catch(err => {
      console.log(err);
      res.end("error occured.");
    });
});

module.exports = router;
