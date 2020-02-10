const Sequelize = require('sequelize');

const User = {
  name: 'usuario',
  schema: {
    id: {
      type: Sequelize.INTEGER,
      allowNull: false,
      primaryKey: true,
      autoIncrement: true
    },
    nome: {
      type: Sequelize.STRING(80),
      allowNull: false
    },
    documento: {
      type: Sequelize.STRING(14),
      allowNull: false
    },
    telefone: {
      type: Sequelize.STRING(50),
      allowNull: false
    },
    email: {
      type: Sequelize.STRING(100),
      allowNull: false
    },
    senha: {
      type: Sequelize.STRING(50),
      allowNull: false
    },
    idTipoPessoa: {
      type: Sequelize.INTEGER,
      allowNull: false
    },
    idNivelAcesso: {
      type: Sequelize.INTEGER,
      allowNull: false
    },
    createdAt: {
      type: Sequelize.DATE,
      allowNull: false,
      default: new Date()
    },
    modifiedAt: {
      type: Sequelize.DATE,
      allowNull: false,
      default: new Date() // when created, it also is modified
    },
    active: {
      type: Sequelize.BOOLEAN,
      allowNull: false,
      default: true
    },
    excluded: { // allow logical exclusions
      type: Sequelize.BOOLEAN,
      allowNull: false,
      default: false
    }
  },
  options: {
    tableName: 'usuario',
    freezeTableName: true,
    timestamps: false
  }
};

module.exports = User;