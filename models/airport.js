'use strict';
const {
  Model
} = require('sequelize');
module.exports = (sequelize, DataTypes) => {
  const Airport = sequelize.define('Airport', {
    dest: DataTypes.STRING
  },{});

    Airport.associate = function(models) {
      
      Airport.belongsTo(models.Flight, {
        foreignKey: 'destId',
        onDelete: 'CASCADE'
      })
    }
    sequelize:sequelize
  return Airport;
};