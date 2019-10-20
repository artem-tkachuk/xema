const express = require('express');
const router = express.Router();

const authControllers = require('../controllers/auth');

//probably add routes where auth is needed only
// router.post('/token', authControllers.postToken);
router.post('/add-patient', authControllers.postAddPatient);
router.post('/login', authControllers.postLogin);
router.post('/logout', authControllers.postLogout);

module.exports = router;