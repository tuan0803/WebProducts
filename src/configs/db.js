const { Sequelize } = require('sequelize');
const dotenv = require('dotenv');
dotenv.config();

const sequelize = new Sequelize(
  process.env.DB_DATABASE, 
  process.env.DB_USER,      
  process.env.DB_PASSWORD, 
  {
    host: process.env.DB_HOST, 
    dialect: 'mysql',
    logging: false,            
  }
);

sequelize.authenticate()
  .then(() => {
    console.log('Connection successfully');
  })
  .catch(err => {
    console.error('Connection Error', err);
  });

module.exports = sequelize;
