const express = require('express');
const routes = express.Router();
const brandController = require('../controllers/brandController');




routes.get('/brands', brandController.getAllBrand);
routes.get('/brands/:brand_id', brandController.getBrand);
routes.post('/brands', brandController.addBrand);
routes.patch('/brands/:brand_id', brandController.updateBrand);
routes.delete('/brands/:id', brandController.removeBrand)


module.exports = routes
