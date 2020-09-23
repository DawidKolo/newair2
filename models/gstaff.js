"use strict";
const { Model } = require("sequelize");
module.exports = (sequelize, DataTypes) => {
  const Gstaff = sequelize.define(
    "Gstaff",
    {
      firstName: DataTypes.STRING,
      lastName: DataTypes.STRING,
      phone: DataTypes.STRING,
      salary: DataTypes.INTEGER,
    },
    {}
  );

  Gstaff.associate = function (models) {
    Gstaff.belongsTo(models.Flight, {
      foreignKey: "id",
      onDelete: "CASCADE",
    });
  };
  sequelize: sequelize;
  return Gstaff;
};
