const mongoose = require('mongoose');

const triggerSchema = new mongoose.Schema({
    _id: {
        type: String,
        required: true,
        unique: true
    },
    severity: {
        type: String,
        required: true
    },
    food: {
        type: String,
        required: true
    },
    material: {
        type: String,
        required: true
    },
    mood: {
        type: String,
        required: true
    },
    date: {
        type: Date,
        required: true
    }
});

const Trigger = mongoose.model('Trigger', triggerSchema, 'triggers');

module.exports = Trigger;