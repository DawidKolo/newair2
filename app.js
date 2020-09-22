const express = require('express');
const exphbs = require('express-handlebars');
const Handlebars = require('handlebars')
const {allowInsecurePrototypeAccess} = require('@handlebars/allow-prototype-access')
const bodyParser = require('body-parser');
const path = require('path');
const db = require('./config/database');   // database in

db.authenticate()                          // test db
.then(() => console.log('Database connected'))
.catch(err => console.log('Error: + err'))



const app = express();

//Handlebars

app.engine('handlebars', exphbs({ 
    defaultLayout: 'main',
    handlebars: allowInsecurePrototypeAccess(Handlebars)
}));
app.set('view engine', 'handlebars');

// Body parser

app.use(bodyParser.urlencoded({extended: false}));


// folder css/html

app.use(express.static(path.join(__dirname, 'public')));

// index route

app.get('/', (req, res) => res.render('index', {layout: 'landing' }));

// flight fly
app.use('/fly', require('./routes/fly'));

// country 
app.use('/country', require('./routes/country'));

// captain

app.use('/captain', require('./routes/captain'));

//airport

app.use('/airport', require('./routes/airport'));

// officer
app.use('/officer', require('./routes/officer'));

//gStaff
app.use('/gstaff', require('./routes/gstaff'));

//crew
app.use('/crew', require('./routes/crew'));

//Dispatcher
app.use('/dispatcher', require('./routes/dispatcher'));

// Aircraft
app.use('/aircraft', require('./routes/aircraft'));


const PORT = process.env.PORT || 5000;

app.listen(PORT, console.log(`Server started at ${PORT}`));
module.exports = app;