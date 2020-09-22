const express = require('express');
const Handlebars = require('handlebars')
const expressHandlebars = require('express-handlebars');
const {allowInsecurePrototypeAccess} = require('@handlebars/allow-prototype-access')
const router = express.Router();
const db = require('../models');
const Sequelize = require('sequelize');
const Op = Sequelize.Op;

// get SELECT * FROM "Airports"
router.get('/', (req, res) => 
    db.Airport.findAll({
        
         order: [
             ['id', 'ASC']
         ],
    })
        .then(Airport => {
            
            res.render('Airport', {
                Airport
            });
        })
        .catch(err => console.log(err)));

        // Display an update Airport  form
router.get('/updateAirport', (req, res) => res.render('updateAirport'));

// update the airport
router.post('/updateAirport', (req, res) => {
    let { id, dest } = req.body;
    let errors = [];
    if (!id) {
        errors.push({text: 'Please choose an Id'})
    }
    if(!dest) {
        errors.push({ text: 'Please enter the Destination'});
       
        }
    
    
    //errors checking

    if(errors.length > 0) {
        res.render('updateAirport', {
            errors,
            id,
            dets
        })}
        else{
        
        db.Airport.update({
            id,
            dets},
            {where: {id: id}        
    })
           .then(airport => res.redirect('/airport'))
           .catch(err => res.render('error', {error:err.message}))  
    }
 
});

module.exports = router;