const express = require('express');
const Handlebars = require('handlebars')
const expressHandlebars = require('express-handlebars');
const {allowInsecurePrototypeAccess} = require('@handlebars/allow-prototype-access')
const router = express.Router();
const db = require('../models/')
const Sequelize = require('sequelize');
const Op = Sequelize.Op;



// get SELECT * FROM "Flights"
router.get('/', (req, res) => 
    db.Flight.findAll({
       order: [
            ['date', 'DESC']
        ],
    })
        .then(fly => {
            // console.log(fly);
            res.render('fly', {
                fly
            });
        })
        .catch(err => console.log(err)));

// Display add fly form
router.get('/add', (req, res) => res.render('add'));

// Add a fly
router.post('/add', (req, res) => {
    let { date, aircraftId, destId, cpt, offr, crew, disp, gstaff } = req.body;
    let errors = [];

    if(!date) {
        errors.push({ text: 'Please enter the date'})
        return res.status(400).json({
            status: 'error'});
        }
    if(!aircraftId) {
            errors.push({ text: 'Please enter the Aircraft id'});
            return res.status(400).json({
                status: 'error'}); 
    }
    if(!destId) {
        errors.push({ text: 'Please enter the Destination id'});
        return res.status(400).json({
            status: 'error'}); 
    } 
    if(!cpt) {
        errors.push({ text: 'Please enter the Captain id'});
        return res.status(400).json({
            status: 'error'}); 
    }
    if(!offr) {
        errors.push({ text: 'Please enter the Officer id'});
        return res.status(400).json({
            status: 'error'}); 
    }  
    if(!crew) {
        errors.push({ text: 'Please enter the Crew id'});
        return res.status(400).json({
            status: 'error'}); 
    }
    if(!disp) {
        errors.push({ text: 'Please enter the Dispatcher id'});
        return res.status(400).json({
            status: 'error'}); 
    }
    if(!gstaff) {
        errors.push({ text: 'Please enter the Ground Staff id'}); 
        return res.status(400).json({
            status: 'error'});
    }

    //errors checking

    if(errors.length > 0) {
        res.render('add', {
            errors,
            date,
            aircraftId,
            destId,
            cpt,
            offr,
            crew,
            disp,
            gstaff 
        })
       }else{
        
        db.Flight.create({
            date,
            aircraftId,
            destId,
            cpt,
            offr,
            crew,
            disp,
            gstaff
        
    })
           .then(fly => res.redirect('/fly'))
           .catch(err => res.render('error', {error:err.message}))  
    }

});
module.exports = router;
