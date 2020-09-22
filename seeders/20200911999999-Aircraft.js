'use strict';

const faker = require('faker');

module.exports = {
  up: async (queryInterface, Sequelize) => {
    let data = [];
    let amount = 100;

    while(amount--) {
      data.push({
        regNum: faker.random.alphaNumeric(6),
        createdAt: new Date(),
        updatedAt: new Date()
      });
    }
     
      await queryInterface.bulkInsert('Aircraft', data, {
      }, {});
    
  },

  down: async (queryInterface, Sequelize) => {
    
     await queryInterface.bulkDelete('Aircraft', null, {});
     
  }
};