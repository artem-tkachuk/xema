const mongoose = require('mongoose');
const validator = require('validator');
const bcrypt = require('bcrypt');

const patientSchema = new mongoose.Schema({
   username: {
       type: String,
       required: true,
       unique: true,
       lowercase: true
   },

    password: {
       type: String,
       required: true
    },

    email: {
       type: String,
        required: true,
        unique: true,
        lowercase: true
    },

    firstName: {
       type: String,
       required: true
    },

    lastName: {
       type: String,
       required: true
    }
});

patientSchema.methods.validPassword = async function(password) {
    return bcrypt.compare(password, this.password);
}

const Patient = mongoose.model('Patient', userSchema, 'patients');