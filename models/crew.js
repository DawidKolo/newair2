"use strict";
const { Model } = require("sequelize");
module.exports = (sequelize, DataTypes) => {
  const Crew = sequelize.define(
    "Crew",
    {
      firstName: DataTypes.STRING,
      lastName: DataTypes.STRING,
      phone: DataTypes.STRING,
      salary: DataTypes.INTEGER,
    },
    {}
  );

  Crew.associate = function (models) {
    Crew.belongsTo(models.Flight, {
      foreignKey: "id",
      onDelete: "CASCADE",
    });
  };
  sequelize: sequelize;
  return Crew;
};
