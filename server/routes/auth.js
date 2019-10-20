const express = require('express');
const router = express.Router();

const authControllers = require('../controllers/auth');

//probably add routes where auth is needed only
router.post('/token', authControllers.postToken);
router.get('/user', authControllers.getPatient);

module.exports = router;