'use strict';
const {
  Model
} = require('sequelize');
module.exports = (sequelize, DataTypes) => {
  const Officers = sequelize.define('Officers', {
    firstName: DataTypes.STRING,
    lastName: DataTypes.STRING,
    phone: DataTypes.STRING,
    salary: DataTypes.INTEGER
  },{});

    Officers.associate = function(models) {
      
      Officers.belongsTo(models.Flight, {
        foreignKey: 'id',
        onDelete: 'CASCADE'
      })
    }
  sequelize:sequelize
  return Officers;
};