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

// get SELECT * FROM "AirportsUpdates"
router.get("/", (req, res) =>
  db.AirportUpdates.findAll({
    order: [["id", "ASC"]],
  })
    .then((AirportUpdates) => {
      res.render("AirportUpdates", {
        AirportUpdates,
      });
    })
    .catch((err) => console.log(err))
);


module.exports = router;
