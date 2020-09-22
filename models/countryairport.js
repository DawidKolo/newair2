'use strict';
const {
  Model
} = require('sequelize');
module.exports = (sequelize, DataTypes) => {
  class CountryAirport extends Model {
    /**
     * Helper method for defining associations.
     * This method is not a part of Sequelize lifecycle.
     * The `models/index` file will call this method automatically.
     */
    static associate(models) {
      // define association here
    }
  };
  CountryAirport.init({
    country: DataTypes.STRING,
    airport: DataTypes.STRING
  }, {
    sequelize,
    modelName: 'CountryAirport',
  });
  return CountryAirport;
};