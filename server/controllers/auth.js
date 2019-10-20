const jwt = require('jwt-simple');
const config = require('../config/config');
const hash = require('../util/hashPassword');

const Patient = require('../models/patient');

exports.postToken = async (req, res) => {
    const email = req.body.email;
    const password = req.body.password;

    if (email && password) {
        await Patient
            .findOne({email: email})
            .then((patient, err) => {
                if (err) {
                    throw err;
                }
                if (patient) {
                    const payload = { id: patient.id };
                    res.json({
                        token: jwt.encode(payload, config.jwtSecret)
                    });
                } else {
                    res.sendStatus(401);
                }
            })
            .catch(err => console.log(err));
    } else {
        res.sendStatus(401);
    }
};

exports.postAddPatient = async (req, res) => {

    console.log(req.body);  //TODO remove

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
            console.log(`New patient with id ${patient._id} is created!`);
        })
        .catch(err => console.log(err));
};

//TODO change
exports.getPatient = async (req, res) => {
    const patient = await Patient.findById(req.user.id);
    res.json(patient);
};

