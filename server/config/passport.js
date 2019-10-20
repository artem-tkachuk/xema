const Session = require('../models/session');

const passport = require('passport');
const JwtStrategy = require('passport-jwt').Strategy;
const ExtractJwt = require('passport-jwt').ExtractJwt;
const config = require('./config');

const options = {
    jwtFromRequest: ExtractJwt.fromBodyField('token'),
    secretOrKey: config.jwtSecret,
};

const passportConfig = (payload, done) => {
    Session.findOne({user: payload.id}, (err, patient) => {
        if (err) {
            return done(err, false);
        }
        if (patient) {
            return done(null, patient);
        } else {
            return done(null, false);
        }
    });
};

module.exports = {
    passportStrategyConfig: new JwtStrategy(options, passportConfig)
};

