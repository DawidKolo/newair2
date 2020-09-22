'use strict';
const {
  Model
} = require('sequelize');
module.exports = (sequelize, DataTypes) => {
  const Aircraft = sequelize.define('Aircraft', {
    regNum: DataTypes.STRING
  },{});

    Aircraft.associate = function(models) {
      
      Aircraft.belongsTo(models.Flight, {
        foreignKey: 'aircraftId',
        onDelete: 'CASCADE'
      })
    }
    sequelize:sequelize
  return Aircraft;
};