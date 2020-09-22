const express = require('express');
const Handlebars = require('handlebars')
const expressHandlebars = require('express-handlebars');
const {allowInsecurePrototypeAccess} = require('@handlebars/allow-prototype-access')
const router = express.Router();
const db = require('../models');
const Sequelize = require('sequelize');
const Op = Sequelize.Op;

// get SELECT * FROM "Dispatchers"
router.get('/', (req, res) => 
    db.Dispacher.findAll({
        
         order: [
             ['salary', 'ASC']
         ],
    })
        .then(Dispacher => {
            
            res.render('Dispatcher', {
                Dispacher
            });
        })
        .catch(err => console.log(err)));
        // Display update Dispatcher form
router.get('/updateDispatcher', (req, res) => res.render('updateDispatcher'));

// update a Dispatcher
router.post('/updateDispatcher', (req, res) => {
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
        res.render('updateDispatcher', {
            errors,
            id,
            firstName,
            lastName,
            phone,
            salary 
        })}
        else{
        
        db.Dispacher.update({
            id,
            firstName,
            lastName,
            phone,
            salary},
            {where: {id: id}        
    })
           .then(Dispacher => res.redirect('/Dispatcher'))
           .catch(err => res.render('error', {error:err.message}))  
    }

});

module.exports = router;