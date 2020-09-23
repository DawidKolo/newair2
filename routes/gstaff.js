const express = require("express");
const Handlebars = require("handlebars");
const expressHandlebars = require("express-handlebars");
const {
  allowInsecurePrototypeAccess,
} = require("@handlebars/allow-prototype-access");
const router = express.Router();
const db = require("../models");
const Sequelize = require("sequelize");
const Op = Sequelize.Op;

// get SELECT * FROM "gStaff"
router.get("/", (req, res) =>
  db.Gstaff.findAll({
    order: [["salary", "ASC"]],
  })
    .then((gStaff) => {
      res.render("Gstaff", {
        gStaff,
      });
    })
    .catch((err) => console.log(err))
);
// Display update gStaff form
router.get("/updategStaff", (req, res) => res.render("updategStaff"));

// update a gStaff
router.post("/updategStaff", (req, res) => {
  let { id, firstName, lastName, phone, salary } = req.body;
  let errors = [];
  if (!id) {
    errors.push({ text: "Please choose an Id" });
  }
  if (!firstName) {
    errors.push({ text: "Please enter a First Name" });
  }
  if (!lastName) {
    errors.push({ text: " Please enter a Last Name " });
  }
  if (!phone) {
    errors.push({ text: "Please enter the phone number" });
  }
  if (!salary) {
    errors.push({ text: "Pease enter a salary" });
  }

  //errors checking

  if (errors.length > 0) {
    res.render("updategStaff", {
      errors,
      id,
      firstName,
      lastName,
      phone,
      salary,
    });
  } else {
    db.Gstaff.update(
      {
        id,
        firstName,
        lastName,
        phone,
        salary,
      },
      { where: { id: id } }
    )
      .then((gStaff) => res.redirect("/gStaff"))
      .catch((err) => res.render("error", { error: err.message }));
  }
});

module.exports = router;
