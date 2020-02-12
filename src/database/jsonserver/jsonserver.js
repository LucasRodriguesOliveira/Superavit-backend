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
    //return (await fetch(this.connection)).ok;
  }

  static _connect(showLog) {
    showLog && jsonserver.logMessage;
    return jsonserver.url;
  }
}

module.exports = JsonServer;