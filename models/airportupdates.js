"use strict";
const { Model } = require("sequelize");
module.exports = (sequelize, DataTypes) => {
  class AirportUpdates extends Model {
    /**
     * Helper method for defining associations.
     * This method is not a part of Sequelize lifecycle.
     * The `models/index` file will call this method automatically.
     */
    static associate(models) {
      // define association here
    }
  }
  AirportUpdates.init(
    {
      country: DataTypes.STRING,
      oldAirport: DataTypes.STRING,
      newAirport: DataTypes.STRING,
    },
    {
      sequelize,
      modelName: "AirportUpdates",
    }
  );
  return AirportUpdates;
};
