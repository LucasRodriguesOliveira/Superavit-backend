const IDatabase = require('../../interface/IDatabase.interface');
const { jsonserver } = require('../base/config.json');
const axios = require('axios');

class JsonServer extends IDatabase {
  constructor(connection) {
    super(jsonserver.name, connection);
    this._schema = {};
  }

  async isConnected() {
    return (await axios.get(this.connection)).ok;
  }

  static connect(showLog) {
    console.log(showLog && jsonserver.logMessage);
    return jsonserver.url;
  }

  defineModel(schema) {
    this._schema = schema;
  }

  async read(query) {
    const _query = query ? `?${query}` : '';
    return (await axios.get(`${this.connection}${this._schema.url}${_query}`)).data;
  }

  async create(data) {
    return (await axios.post(`${this.connection}${this._schema.url}`, data)).data;
  }
}

module.exports = JsonServer;