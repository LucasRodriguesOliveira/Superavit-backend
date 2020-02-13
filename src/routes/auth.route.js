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

    const config = BaseRoute.getConfig(tags, login.description || description,
      login.notes || notes, {
        payload: {
          email: Joi.string().required().min(3),
          password: Joi.string().required().min(5)
        }
      });

    return BaseRoute.getTemplate(
      path[0], _method.POST, config,
      async request => await controller.login(request.payload)
    );
  }

  register() {
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
    const { signup } = routes;
    const config = BaseRoute.getConfig(tags, signup.description || description,
      signup.notes || notes, {
        payload: {
          name: Joi.string().required().min(3).max(80),
          email: Joi.string().required().min(6).max(100),
          password: Joi.string().required().min(8).max(50)
        }
      });
    return BaseRoute.getTemplate(
      path[1], _method.POST, config,
      async request => await controller.register(request.payload)
    );
  }
}

module.exports = Auth;