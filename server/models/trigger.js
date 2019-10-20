const mongoose = require('mongoose');
const bcrypt = require('bcrypt');

const triggerSchema = new mongoose.Schema({
    _id, 
});

patientSchema.methods.validPassword = async function(password) {
    return bcrypt.compare(password, this.password);
};

const Patient = mongoose.model('Patient', patientSchema, 'patients');

module.exports = Patient;