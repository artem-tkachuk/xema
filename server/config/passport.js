const Patient = require('../models/patient');
const LocalStrategy = require('passport-local').Strategy;

const passportConfig = (username, password, done) => {
    Patient.findOne({username: username})
        .then(async (patient, err) => {
            if (err) {
                return done(err, {message: 'Database error!'});
            }
            if (!patient) {
                return done(null, false, {message: 'Incorrect username or password. Please try again!'});
            }
            if (!(await patient.validPassword(password))) {
                return done(null, false, {message: 'Incorrect username or password. Please try again!'});
            }

            return done(null, patient);
        });
};

const authenticateOptions = {
    failureRedirect: '/login',
    successRedirect: '/profile',
    failureFlash: true
};

const serializer = (patient, done) => {
    done(null, patient.id);
};

const deserializer = (id, done) => {
    Patient
        .findOne({_id : id})
        .then((patient, err) => {
            done(err, patient);
        });
};

module.exports = {
    passportStrategyConfig: new LocalStrategy(passportConfig),
    authenticateOptions: authenticateOptions,
    serializer: serializer,
    deserializer: deserializer
};
