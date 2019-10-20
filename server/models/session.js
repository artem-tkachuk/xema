const mongoose = require('mongoose');

const sessionSchema = new mongoose.Schema({
    user: {
        type: String,
        unique: true,
        required: true
    },
    token: {
        type: String,
        unique: true,
        required: true
    }
});

const Session = mongoose.model('Session', sessionSchema, 'sessions');

module.exports = Session;

