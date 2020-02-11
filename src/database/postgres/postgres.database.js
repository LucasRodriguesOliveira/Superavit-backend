const IDatabase = require('../../interface/IDatabase.interface');
const Sequelize = require('sequelize');
const { postgres, global } = require('../base/config.json');

/**
 * @public
 * @class
 * @extends IDatabase
 * @description Manipulates connection and operations to postgres database <br/>
 * Set your connection string in .env.development in CONNECTION variable
 */
class Postgres extends IDatabase {
  constructor(connection) {
    super(postgres.name, connection);
    this._schema = {};
  }

  static async _connect(showLog) {
    const _connection = new Sequelize(
      process.env.DATABASE,
      process.env.USERNAME,
      process.env.PASSWORD, {
        host: 'localhost',
        port: '5432',
        dialect: 'postgres',
        quoteIdentifiers: false,
        operatorAliases: false,
        logging: false
      }
    );

    showLog && console.log(postgres.logMessage);
    return _connection;
  }

  async isConnected() {
    try {
      await this.connection.authenticate();
      return true;
    } catch(err) {
      console.error(`${global.ErrConnectionLog} [${err}]`);
      return false;
    }
  }

  async defineModel(schema) {
    const Schema = this.connection.define(
      schema.name, schema.schema, schema.options
    );

    this._schema = Schema;

    await this._schema.sync();
  }

  async create(item) {
    const { dataValues } = await this._schema.create(item);
    return dataValues;
  }

  async read(query = {}) {
    console.log(this._schema);
    return await this._schema.findAll({where: query, raw: true});
  }

  async update(id, item) {
    return await this._schema.update(item, {where: {id: id}});
  }

  async delete(id) {
    return await this._schema.destroy({where: id ? { id } : {}});
  }
}

module.exports = Postgres;