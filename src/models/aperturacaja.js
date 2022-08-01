const Sequelize = require('sequelize');
module.exports = function(sequelize, DataTypes) {
  return sequelize.define('aperturacaja', {
    idregistro: {
      type: DataTypes.INTEGER,
      allowNull: false,
      primaryKey: true
    },
    caja: {
      type: DataTypes.INTEGER,
      allowNull: true
    },
    estacion: {
      type: DataTypes.INTEGER,
      allowNull: true
    },
    fechahora: {
      type: DataTypes.DATEONLY,
      allowNull: true
    },
    cierre: {
      type: DataTypes.INTEGER,
      allowNull: true
    },
    monto: {
      type: DataTypes.DOUBLE,
      allowNull: true
    },
    fechaapertura: {
      type: DataTypes.DATEONLY,
      allowNull: true
    }
  }, /*{
    sequelize,
    tableName: 'aperturacaja',
    timestamps: false,
    indexes: [
      {
        name: "PRIMARY",
        unique: true,
        using: "BTREE",
        fields: [
          { name: "idregistro" },
        ]
      },
      {
        name: "fk_aperturacaja_estaciones1_idx",
        using: "BTREE",
        fields: [
          { name: "estaciones_NumeroEstacion" },
        ]
      },
    ]
  }*/);
};
