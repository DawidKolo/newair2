'use strict';
module.exports = {
  up: async (queryInterface, Sequelize) => {
    await queryInterface.createTable('Flights', {
      id: {
        allowNull: false,
        autoIncrement: true,
        primaryKey: true,
        type: Sequelize.INTEGER
      },
      date: {
        type: Sequelize.DATEONLY
      },
      aircraftId: {
        type: Sequelize.INTEGER
      },
      destId: {
        type: Sequelize.INTEGER
      },
      cpt: {
        type: Sequelize.INTEGER
      },
      offr: {
        type: Sequelize.INTEGER
      },
      crew: {
        type: Sequelize.INTEGER
      },
      disp: {
        type: Sequelize.INTEGER
      },
      gstaff: {
        type: Sequelize.INTEGER
      },
      createdAt: {
        allowNull: true,
        type: Sequelize.DATE
      },
      updatedAt: {
        allowNull: true,
        type: Sequelize.DATE
      }
    });
  },
  down: async (queryInterface, Sequelize) => {
    await queryInterface.dropTable('Flights');
  }
};