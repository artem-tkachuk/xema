const Session = require('../models/session');
const Trigger = require('../models/trigger');

exports.postAddData = async (req, res) => {
    const session = await Session.findOne({token: req.body.token});
    const triggerData = {
        id: session.id,
        severity: req.body.severity,
        food: req.body.food,
        material: req.body.material,
        mood: req.body.mood,
        date: new Date()
    };

    await new Trigger(triggerData)
        .save()
        .then(async (trigger) => {
            console.log(`Logged the new trigger`);
            res.json({
                "message": "Success!"
            })
        })
        .catch(err => {
            console.log(err);
            res.sendStatus(401);
        });
};