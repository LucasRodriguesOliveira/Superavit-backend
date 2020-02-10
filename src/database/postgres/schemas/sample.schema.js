const Sequelize = require('sequelize');

const Sample = {
  name: 'sample',
  schema: {
    id: {
      type: Sequelize.INTEGER,
      required: true,
      primaryKey: true,
      autoIncrement: true
    },
    name: {
      type: Sequelize.STRING,
      required: true
    },
    description: {
      type: Sequelize.STRING,
      required: true
    },
    createdAt: {
      type: Sequelize.DATE,
      required: true,
      default: new Date()
    },
    modifiedAt: {
      type: Sequelize.DATE,
      required: true,
      default: new Date() // when created, it also is modified
    },
    active: {
      type: Sequelize.BOOLEAN,
      required: true,
      default: true
    },
    excluded: { // allow logical exclusions
      type: Sequelize.BOOLEAN,
      required: true,
      default: false
    }
  },
  options: {
    tableName: 'users',
    freezeTableName: true,
    timestamps: false
  }
};

module.exports = Sample;