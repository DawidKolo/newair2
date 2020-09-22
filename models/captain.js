'use strict';
const {
  Model
} = require('sequelize');
module.exports = (sequelize, DataTypes) => {
  const Captain = sequelize.define('Captain', {
    firstName: DataTypes.STRING,
    lastName: DataTypes.STRING,
    phone: DataTypes.STRING,
    salary: DataTypes.INTEGER
  },{});

    // Captain.associate = function(models) {
      
    //   Captain.belongsTo(models.Flight, {
    //     foreignKey: 'cpt',
    //     onDelete: 'CASCADE'
    //   })
    // }
    sequelize:sequelize
  return Captain;
};