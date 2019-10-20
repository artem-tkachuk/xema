const Session = require('../models/session');
const Trigger = require('../models/trigger');

exports.postAddData = async (req, res) => {
    const triggerData = {
        _id: await Session.findOne({token: req.body.token})._id,
        severity: req.body.severity,
        food: req.body.food,
        material: req.body.material,
        mood: req.body.mood,
        date: new Date()
    };

    await new Trigger(triggerData)
        .save()
        .then((trigger) => {
            console.log(`Logged the new trigger`);
            res.sendStatus(200);
        })
        .catch(err => {
            console.log(err);
            res.sendStatus(401);
        });
};