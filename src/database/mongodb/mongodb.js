const IDatabase = require('../../interface/IDatabase.interface');
const Mongoose = require('mongoose');
const { mongodb, global } = require('../base/config.json');

class MongoDB extends IDatabase {
  constructor(connection) {
    super(mongodb.name, connection);
    this._status = mongodb.status;
    this._schema = {};
  }

  async isConnected() {
    const state = this._status[this.connection.readyState];

    if(state === mongodb.connected_status) return state;
    if(state !== mongodb.conecting_status) return state;

    await new Promise(res => setTimeout(res, mongodb.time_waiting));
    return this._status[this.connection.readyState];
  }

  static _connect(showLog) {
    const { CONNECTION_STRING } = process.env;
    const options = {
      useNewUrlParser: true,
      useCreateIndex: true
    };

    Mongoose.connect(CONNECTION_STRING, options, err => {
      if(!err) return;

      console.log(`${global.ErrConnectionLog} ${err}`);
    });

    Mongoose.connection.once(mongodb.watch_event, () => {
      showLog && console.log(mongodb.logMessage);
    });

    return Mongoose.connection;
  }

  async defineModel(schema) {
    this._schema = schema;
  }

  create(item) {
    return this._schema.create(item);
  }

  update(id, item) {
    return this._schema.updateOne({_id: id}, { $set: item });
  }

  read(query, skip = 0, limit = 10) {
    return this._schema.find(query || {}).skip(skip).limit(limit);
  }

  delete(id) {
    return this._schema.deleteOne({_id: id});
  }
}

module.exports = MongoDB;