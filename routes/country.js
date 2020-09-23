const express = require("express");
const Handlebars = require("handlebars");
const expressHandlebars = require("express-handlebars");
const {
  allowInsecurePrototypeAccess,
} = require("@handlebars/allow-prototype-access");
const router = express.Router();
const db = require("../models/");
const Country = require("../models/Country");
const Sequelize = require("sequelize");
const Op = Sequelize.Op;

// get SELECT * FROM "Country"
router.get("/", (req, res) =>
  db.Country.findAll({})
    .then((country) => {
      // console.log(fly);
      res.render("country", {
        country,
      });
    })
    .catch((err) => console.log(err))
);

//search for country

router.get("/search", (req, res) => {
  let { term } = req.query;

  db.Country.findAll({
    where: { description: { [Op.like]: "%" + term + "%" } },
  })
    .then((country) => res.render("country", { country }))
    .catch((err) => console.log(err));
});

module.exports = router;
