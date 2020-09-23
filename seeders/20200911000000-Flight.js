"use strict";
const faker = require("faker");
module.exports = {
  up: async (queryInterface, Sequelize) => {
    let data = [];
    let amount = 100;

    while (amount--) {
      data.push({
        date: faker.date.between("2010-01-01", "2020-09-30"),
        aircraftId: faker.random.number({ min: 1, max: 100 }),
        destId: faker.random.number({ min: 1, max: 100 }),
        cpt: faker.random.number({ min: 1, max: 100 }),
        offr: faker.random.number({ min: 1, max: 100 }),
        crew: faker.random.number({ min: 1, max: 100 }),
        disp: faker.random.number({ min: 1, max: 100 }),
        gstaff: faker.random.number({ min: 1, max: 100 }),
        createdAt: new Date(),
        updatedAt: new Date(),
      });
    }
    await queryInterface.bulkInsert("Flights", data, [{}], {});
  },

  down: async (queryInterface, Sequelize) => {
    await queryInterface.bulkDelete("Flights", null, {});
  },
};
