"use strict";

const { Model } = require("sequelize");

module.exports = (sequelize, DataTypes) => {
  const Flight = sequelize.define(
    "Flight",
    {
      date: DataTypes.DATEONLY,
      aircraftId: DataTypes.INTEGER,
      destId: DataTypes.INTEGER,
      cpt: DataTypes.INTEGER,
      offr: DataTypes.INTEGER,
      crew: DataTypes.INTEGER,
      disp: DataTypes.INTEGER,
      gstaff: DataTypes.INTEGER,
    },
    {}
  );

  Flight.associate = function (models) {
    Flight.hasOne(models.Aircraft, {
      foreignKey: "id",
    });
    Flight.hasOne(models.Airport, {
      foreignKey: "id",
    });
    Flight.hasOne(models.Captain, {
      foreignKey: "id",
    });
    Flight.hasOne(models.Officers, {
      foreignKey: "id",
    });
    Flight.hasOne(models.Crew, {
      foreignKey: "id",
    });
    Flight.hasOne(models.Dispacher, {
      foreignKey: "id",
    });
    Flight.hasOne(models.Gstaff, {
      foreignKey: "id",
    });
  };
  module.exports = Flight;

  return Flight;
};
