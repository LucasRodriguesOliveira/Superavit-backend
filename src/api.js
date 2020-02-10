// * Environment preparation
const configEnv = require('./helper/config').configEnvironment;
configEnv(process.env.NODE_ENV);

// * System imports
const Hapi = require('@hapi/hapi');
const Router = require('./routes/router');
const PostgreSQL = require('./database/postgres/postgres.database');
const Context = require('./database/base/Context');
const { configRegister, configAuthStrategy } = require('./helper/config');

// True -> Show Log ('Database Postgres running')
// False -> Do not show log, just run
const SHOW_LOG = !!process.env.SHOW_LOG;

// * Setting up database connection

let database;
try {
  database = new Context(new PostgreSQL(PostgreSQL._connect(SHOW_LOG)));
} catch(err) {
  database = {}; // please, set up your database connection in .env.development
}

// * Setting up the server
const app = new Hapi.server({ port: process.env.PORT });
// * Main function
/**
 * @public
 * @function
 * @returns {Server}
 * @description Server Start
 */
async function main() {
  // Swagger needs some config informations
  // Register plugins
  await app.register(configRegister());

  // Defines Auth Strategy
  app.auth.strategy(...configAuthStrategy(process.env.SECRET));
  //app.auth.default('jwt'); // uncomment this line to use auth

  //* Routes registration
  app.route(Router.getRoutes(Router.getDirectories(), database));

  // Initiates the server
  try {
    await app.start();
    
    console.log('Server running on port:', app.info.port);
    return app;
  } catch(err) {
    console.log(`An unexpected error has occurred! ${err}`);
    return;
  }
}

module.exports = main();