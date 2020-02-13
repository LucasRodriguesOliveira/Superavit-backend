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

  static connect(config = { log: false, auto: false }) {
    console.log(config.log && jsonserver.logMessage);

    // Ainda é experimental
    // Provavelmente será necessário trabalhar com threads
    // config.auto && JsonServer.initialize();

    return jsonserver;
  }

  static intialize() {
    const jsonServer = require('json-server');
    const server = jsonServer.create();
    const router = jsonServer.router('../../../scripts/db.json');

    server.use(router);
    server.listen(4000, () => {});
  }

  defineModel(schema) {
    this._schema = schema;
  }

  async read(query) {
    const _query = query ? `?${query}` : '';
    return (await axios.get(`${this.connection.url}${this._schema.url}${_query}`)).data;
  }

  async create(data) {
    return (await axios.post(`${this.connection.url}${this._schema.url}`, data)).data;
  }

  async update(id, data) {
    return (await axios.put(`${this.connection.url}${this._schema.url}/${id}`, data)).data;
  }

  async delete(id) {
    return (await axios.delete(`${this.connection.url}${this._schema.url}/${id}`)).data;
  }
}

module.exports = JsonServer;