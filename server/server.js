const path = require('path');
const express = require('express');
const bodyParser = require('body-parser');
// const passport = require('passport');
// const { passportStrategyConfig, serializer, deserializer } = require('./config/passport');
// const flash = require('connect-flash');
// const session = require('./config/session');

const mongo = require('./database/mongo');      //db

const app = express();
const PORT = process.env.PORT || 8080;      // Listen to the App Engine-specified port, or 8080 otherwise

//routes
const errorController = require('./controllers/404');

//middleware
app.use(bodyParser.urlencoded({extended: false}));
app.use(bodyParser.json());

//authentication middleware
// app.use(session);
// app.use(passport.initialize());
// passport.use(passportStrategyConfig);
// app.use(passport.session());
// app.use(flash());
// passport.serializeUser(serializer);
// passport.deserializeUser(deserializer);

//Controllers
app.use(errorController.get404);

mongo(app, PORT);
