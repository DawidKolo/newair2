'use strict';
const {
  Model
} = require('sequelize');
module.exports = (sequelize, DataTypes) => {
  const Dispacher = sequelize.define('Dispacher', {
    firstName: DataTypes.STRING,
    lastName: DataTypes.STRING,
    phone: DataTypes.STRING,
    salary: DataTypes.INTEGER
  },{});

    Dispacher.associate = function(models) {
      
      Dispacher.belongsTo(models.Flight, {
        foreignKey: 'id',
        onDelete: 'CASCADE'
      })
    }
    sequelize:sequelize
  return Dispacher;
};