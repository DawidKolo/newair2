"use strict";
const { Model } = require("sequelize");
module.exports = (sequelize, DataTypes) => {
  const Aircraft = sequelize.define(
    "Aircraft",
    {
      regNum: DataTypes.STRING,
    },
    {}
  );

  Aircraft.associate = function (models) {
    Aircraft.belongsTo(models.Flight, {
      foreignKey: "id",
      onDelete: "CASCADE",
    });
  };
  sequelize: sequelize;
  return Aircraft;
};
