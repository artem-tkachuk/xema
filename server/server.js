const express = require('express');
const bodyParser = require('body-parser');
const passport = require('passport');
const passportStrategyConfig = require('./config/passport');

const app = express();
const PORT = process.env.PORT || 8080;      // Listen to the App Engine-specified port, or 8080 otherwise

//data
const mongo = require('./database/mongo');

//import routes & controllers
const authRoutes = require('./routes/auth');
const errorController = require('./controllers/404');

//authentication
app.use(passport.initialize());
passport.use('jwt', passportStrategyConfig);

//middleware
app.use(bodyParser.json());
app.use(bodyParser.urlencoded({extended: false}));

//Use routes
app.use(authRoutes);
app.use(errorController.get404);

mongo(app, PORT);
