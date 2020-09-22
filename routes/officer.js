const express = require('express');
const Handlebars = require('handlebars')
const expressHandlebars = require('express-handlebars');
const {allowInsecurePrototypeAccess} = require('@handlebars/allow-prototype-access')
const router = express.Router();
const db = require('../models');
const Sequelize = require('sequelize');
const Op = Sequelize.Op;

// get SELECT * FROM "Officers"
router.get('/', (req, res) => 
    db.Officers.findAll({
        
         order: [
             ['salary', 'ASC']
         ],
    })
        .then(Officer => {
            
            res.render('Officer', {
                Officer
            });
        })
        .catch(err => console.log(err)));
        // Display update Officer form
router.get('/updateOfficer', (req, res) => res.render('updateOfficer'));

// update a Officer
router.post('/updateOfficer', (req, res) => {
    let { id, firstName, lastName, phone, salary } = req.body;
    let errors = [];
    if (!id) {
        errors.push({text: 'Please choose an Id'})
    }
    if(!firstName) {
        errors.push({ text: 'Please enter a First Name'});
       
        }
    if(!lastName) { 
        errors.push({text: ' Please enter a Last Name '});           
    }
    if(!phone) {
        errors.push({ text: 'Please enter the phone number'});
        
    } 
    if(!salary) {
        errors.push({ text: 'Pease enter a salary'});
        
    }
    
    //errors checking

    if(errors.length > 0) {
        res.render('updateOfficer', {
            errors,
            id,
            firstName,
            lastName,
            phone,
            salary 
        })}
        else{
        
        db.Officer.update({
            id,
            firstName,
            lastName,
            phone,
            salary},
            {where: {id: id}        
    })
           .then(Officer => res.redirect('/Officer'))
           .catch(err => res.render('error', {error:err.message}))  
    }

});

module.exports = router;