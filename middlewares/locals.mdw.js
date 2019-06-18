var projectModel = require('../models/project.model');

module.exports = (req, res, next) => {
  projectModel.allWithDetails().then(rows => {
    res.locals.lcProjects = rows;
    next();
  })
}
