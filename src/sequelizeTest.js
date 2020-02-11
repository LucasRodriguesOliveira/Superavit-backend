const
const Sequelize = require('sequelize');
const database = 'sequelize_test';
const username = 'postgres';
const password = 'admin';
const host = 'localhost';
const port = '5432';
const dialect = 'postgres';

const sequelize = new Sequelize(
  database, username, password, {
    host,
    dialect
  });

async function auth() {
  return await sequelize.authenticate();
}

try {
  auth();
  console.log('connected');
} catch(err) {
  console.log(err);
}