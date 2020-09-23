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

// get SELECT * FROM "Captains"
router.get("/", (req, res) =>
  db.Captain.findAll({
    order: [["salary", "ASC"]],
  })
    .then((Captain) => {
      res.render("Captain", {
        Captain,
      });
    })
    .catch((err) => console.log(err))
);
// Display add Captain form
router.get("/addCaptain", (req, res) => res.render("addCaptain"));

// update a captain
router.post("/addCaptain", (req, res) => {
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
    res.render("addCaptain", {
      errors,
      id,
      firstName,
      lastName,
      phone,
      salary,
    });
  } else {
    db.Captain.update(
      {
        id,
        firstName,
        lastName,
        phone,
        salary,
      },
      { where: { id: id } }
    )
      .then((captain) => res.redirect("/captain"))
      .catch((err) => res.render("error", { error: err.message }));
  }
});

module.exports = router;
