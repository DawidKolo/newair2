'use strict';

const faker = require('faker');

module.exports = {
  up: async (queryInterface, Sequelize) => {
    let data = [];
    let amount = 100;

    while(amount--) {
      data.push({
        dest: faker.address.country(),
        createdAt: new Date(),
        updatedAt: new Date()
      });
    }
     
      await queryInterface.bulkInsert('Airports', data, {
      }, {});    

  },

  down: async (queryInterface, Sequelize) => {
    
     await queryInterface.bulkDelete('Airports', null, {});
     
  }
};