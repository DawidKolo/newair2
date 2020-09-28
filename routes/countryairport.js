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

// get SELECT * FROM "CountryAirports"
router.get("/", (req, res) =>
  db.CountryAirport.findAll({
    order: [["id", "ASC"]],
  })
    .then((CountryAirport) => {
      res.render("CountryAirport", {
        CountryAirport,
      });
    })
    .catch((err) => console.log(err))
);

// Display an update CountryAirport  form
router.get("/updateCountryAirport", (req, res) =>
  res.render("updateCountryAirport")
);

// update the Countryairport
router.post("/updateCountryAirport", (req, res) => {
  let { id, airport } = req.body;
  let errors = [];
   if (!id) {
    errors.push({ text: "Please choose an Id" });
  }
  if (!airport) {
    errors.push({ text: "Please enter the airport code " });
  }

  //errors checking

  if (errors.length > 0) {
    res.render("updateCountryAirport", {
      errors,
      id,
      airport,
    });
  } else {
    db.CountryAirport.update(
      {
        id,
        airport,
      },
      { where: { id: id } }
    )
      .then((countryairport) => res.redirect("/countryAirport"))
      .catch((err) => res.render("error", { error: err.message }));
  }
});

module.exports = router;
