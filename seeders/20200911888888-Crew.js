'use strict';

const faker = require('faker');

module.exports = {
  up: async (queryInterface, Sequelize) => {
    let data = [];
    let amount = 100;

    while(amount--) {
      data.push({
        firstName: faker.name.firstName(),
        lastName: faker.name.lastName(),
        phone: faker.phone.phoneNumber(),
        salary: faker.random.number({
          min: 1400,
          max: 2000
        }),
        createdAt: new Date(),
        updatedAt: new Date()
      });
    }
     
      await queryInterface.bulkInsert('Crews', data, {
      }, {});    

  },

  down: async (queryInterface, Sequelize) => {
    
     await queryInterface.bulkDelete('Crews', null, {});
     
  }
};