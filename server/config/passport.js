const Patient = require('../models/patient');

const passport = require('passport');
const JwtStrategy = require('passport-jwt').Strategy;
const ExtractJwt = require('passport-jwt').ExtractJwt;
const config = require('./config');

const options = {
    jwtFromRequest: ExtractJwt.fromAuthHeaderAsBearerToken(),
    secretOrKey: config.jwtSecret,
};

const passportConfig = (payload, done) => {
    Patient.findOne({_id: payload.id}, (err, patient) => {
        if (err) {
            return done(err, false);
        }
        if (patient) {
            return done(null, {
                id: patient.id
            });
        } else {
            return done(null, false);
        }
    });
};

module.exports = {
    passportStrategyConfig: new JwtStrategy(options, passportConfig)
};

