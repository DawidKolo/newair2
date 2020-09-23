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

// get SELECT * FROM "Aircrafts"
router.get("/", (req, res) =>
  db.Aircraft.findAll({
    order: [["id", "ASC"]],
  })
    .then((Aircraft) => {
      res.render("Aircraft", {
        Aircraft,
      });
    })
    .catch((err) => console.log(err))
);

// Display an update Aircraft  form
router.get("/updateAircraft", (req, res) => res.render("updateAircraft"));

// update the aircraft
router.post("/updateAircraft", (req, res) => {
  let { id, regNum } = req.body;
  let errors = [];
  if (!id) {
    errors.push({ text: "Please choose an Id" });
  }
  if (!regNum) {
    errors.push({ text: "Please enter the Registration Number" });
  }

  //errors checking

  if (errors.length > 0) {
    res.render("updateAircraft", {
      errors,
      id,
      regNum,
    });
  } else {
    db.Aircraft.update(
      {
        id,
        regNum,
      },
      { where: { id: id } }
    )
      .then((aircraft) => res.redirect("/aircraft"))
      .catch((err) => res.render("error", { error: err.message }));
  }
});

module.exports = router;
