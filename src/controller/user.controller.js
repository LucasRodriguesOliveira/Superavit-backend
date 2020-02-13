const IController = require('../interface/IController.interface');
const Boom = require('@hapi/boom');
const Jwt = require('jsonwebtoken');
const User = require('../model/user.model');
const { Ok } = require('../helper/util');

/**
 * @public
 * @class
 * @extends {IController}
 * @description Defines the business logic
 */
class UserController extends IController {
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

  async read(query) {
    return this.database.read(query);
  }
}