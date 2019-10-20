const Patient = require('../models/patient');
const Session = require('../models/session');

const jwt = require('jwt-simple');
const config = require('../config/config');
const hash = require('../util/hashPassword');

//sign up
exports.postAddPatient = async (req, res) => {

    console.log(req.body);  //TODO remove, but make sure the iOS app delivers the data first

    const patientData = {
        username: req.body.username,
        password: await hash(req.body.password),
        email: req.body.email,
        firstName: req.body.firstName,
        lastName: req.body.lastName
    };

    await new Patient(patientData)
        .save()
        .then(async (patient) => {
            console.log(`New patient with id ${patient.id} is created!`);
            const payload = { id: patient.id };
            const token = jwt.encode(payload, config.jwtSecret);

            await new Session({ user: payload.id, token: token }).save();

            res.json({ token: token });
        })
        .catch(err => console.log(err));
};

//login
exports.postLogin = async (req, res) => {
    const email = req.body.email;
    const password = req.body.password;

    if (email && password) {
        await Patient
            .findOne({email: email})
            .then(async (patient, err) => {
                if (err) {
                    throw err;
                }
                if (patient && await patient.validPassword(password)) {
                    const payload = {id: patient.id};
                    const token = jwt.encode(payload, config.jwtSecret);

                    await new Session({ user: payload.id, token: token }).save();

                    res.json({ token: token });
                } else {
                    res.sendStatus(401);
                }
            })
            .catch(err => console.log(err));
    } else {
        res.sendStatus(401);
    }
};

//logout
exports.postLogout = async (req, res) => {
    await Session.findOneAndRemove({token: req.body.token});
    res.json({
       'code': 200
    });
};
