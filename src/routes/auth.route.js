const BaseRoute = require('./base/base.route');
const Joi = require('@hapi/joi');
const auth = require('./base/auth.config.json');
const Controller = require('../controller/auth.controller');

class Auth extends BaseRoute {
  constructor(db) {
    super(auth, new Controller(db));
  }

  login() {
    const {
      controller,
      _default: {
        description,
        notes,
        tags
      },
      routes,
      _method,
      path
    } = this;

    const { login } = routes;

    const config = BaseRoute.getConfig(tags, login.description || description, login.notes || notes);

    return BaseRoute.getTemplate(
      path[0], _method.POST, config,
      async request => await controller.login(request.payload),{
        payload: {
          username: Joi.string().required().min(3),
          password: Joi.string().required().min(5)
        }
      });
  }
}

module.exports = Auth;