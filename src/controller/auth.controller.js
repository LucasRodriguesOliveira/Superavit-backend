const IController = require('../interface/IController.interface');
const Boom = require('@hapi/boom');
const Jwt = require('jsonwebtoken');
const User = require('../model/user.model');
const { ComparePassword,HashPassword } = require('../helper/password.helper');
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
    this.database.defineModel(User.getSchema(this.database.name));
  }

  async login({ email, password }) {
    this.before();

    try {

      if(!email || !password)
        return Boom.unauthorized(this.msgStrings[0]);

      const [user] = await this.database.read({ email });

      if(!user)
        return Boom.unauthorized(this.msgStrings[1]);

      const match = await ComparePassword(
        password, user.password
      );

      if(!match)
        return Boom.unauthorized(this.msgStrings[2]);

      const token = Jwt.sign({ email, id: user.id }, process.env.SECRET);

      return Ok({ token });
    } catch(err) {
      console.log(`${this.msgStrings[0]} ${err}`);
      return Boom.internal(this.msgStrings[4]);
    }
  }

  async register({ name, email, password }) {
    this.before();

    try {
      if(!name || !password || !email) {
        return Boom.unauthorized(this.msgStrings[0]);
      }

      const user = await this.database.create({
        name, email,
        password: await HashPassword(password)
      });

      if(!user) return Boom.unauthorized(this.msgStrings[5]);
      
      return { status: 200, data: user };

    } catch(err) {
      console.log(`${this.msgStrings[0]} ${err}`);
      return Boom.internal(this.msgStrings[5]);
    }
  }
}

module.exports = AuthController;