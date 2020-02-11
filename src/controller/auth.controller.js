const IController = require('../interface/IController.interface');
const Boom = require('@hapi/boom');
const Jwt = require('jsonwebtoken');
const User = require('../model/user.model');
const { ComparePassword } = require('../helper/password.helper');
const { Ok } = require('../helper/util');


/**
 * @public
 * @class
 * @extends {IController}
 * @description Defines the business logic
 */
class AuthController extends IController {
  /**
   * @constructs
   * @param {object} db Database
   */
  constructor(db) {
    super(db);
  }

  /**
   * @method
   * @private
   * @description Runs Before each function to define the model wich will be used
   */
  before() {
    if(this.database.isConnected()) {
      console.log('connected');
    } else {
      console.log('disconnected');
    }
    this.database.defineModel(User.getSchema(this.database.name));
  }

  async login({ username, password }) {
    this.before();

    try {

      if(!username || !password)
        return Boom.unauthorized(this.msgStrings[0]);

      const [user] = await this.database.read({
        username: username.toLowerCase()
      });

      if(!user)
        return Boom.unauthorized(this.msgStrings[1]);

      const match = await ComparePassword(
        password, user.password
      );

      if(!match)
        return Boom.unauthorized(this.msgStrings[2]);

      const token = Jwt.sign({ username, id: user.id }, process.env.SECRET);

      return Ok({ token });
    } catch(err) {
      console.log(`${this.msgStrings[0]} ${err}`);
      return Boom.internal(this.msgStrings[7]);

    }
  }
}

module.exports = AuthController;