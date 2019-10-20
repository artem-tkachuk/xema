

const express = require('express');
const router = express.Router();
const passport = require('passport');
const config = require('../config/config');

const authControllers = require('../controllers/auth');


router.post('/add-patient', authControllers.postAddPatient);
router.post('/login', authControllers.postLogin);
router.post('/logout', passport.authenticate('jwt', config.jwtSession), authControllers.postLogout);

module.exports = router;