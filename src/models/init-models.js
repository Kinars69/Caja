const DataTypes = require("sequelize").DataTypes;
const _aperturacaja = require("./aperturacaja");
const _cajas = require("./cajas");
const _cierrecaja = require("./cierrecaja");
const _denominacionmonedas = require("./denominacionmonedas");
const _detalle_aperturacaja = require("./detalle_aperturacaja");
const _detalle_cierrecaja = require("./detalle_cierrecaja");
const _detallecierrecajapos = require("./detallecierrecajapos");
const _estaciones = require("./estaciones");
const _monedas = require("./monedas");

function initModels(sequelize) {
  const aperturacaja = _aperturacaja(sequelize, DataTypes);
  const cajas = _cajas(sequelize, DataTypes);
  const cierrecaja = _cierrecaja(sequelize, DataTypes);
  const denominacionmonedas = _denominacionmonedas(sequelize, DataTypes);
  const detalle_aperturacaja = _detalle_aperturacaja(sequelize, DataTypes);
  const detalle_cierrecaja = _detalle_cierrecaja(sequelize, DataTypes);
  const detallecierrecajapos = _detallecierrecajapos(sequelize, DataTypes);
  const estaciones = _estaciones(sequelize, DataTypes);
  const monedas = _monedas(sequelize, DataTypes);

  cierrecaja.belongsTo(aperturacaja, { as: "aperturacaja_idregistro_aperturacaja", foreignKey: "aperturacaja_idregistro"});
  aperturacaja.hasMany(cierrecaja, { as: "cierrecajas", foreignKey: "aperturacaja_idregistro"});
  detalle_aperturacaja.belongsTo(aperturacaja, { as: "aperturacaja_idregistro_aperturacaja", foreignKey: "aperturacaja_idregistro"});
  aperturacaja.hasMany(detalle_aperturacaja, { as: "detalle_aperturacaja", foreignKey: "aperturacaja_idregistro"});
  cajas.belongsTo(cierrecaja, { as: "cierrecaja_idregistro_cierrecaja", foreignKey: "cierrecaja_idregistro"});
  cierrecaja.hasMany(cajas, { as: "cajas", foreignKey: "cierrecaja_idregistro"});
  detallecierrecajapos.belongsTo(cierrecaja, { as: "cierrecaja_idregistro_cierrecaja", foreignKey: "cierrecaja_idregistro"});
  cierrecaja.hasMany(detallecierrecajapos, { as: "detallecierrecajapos", foreignKey: "cierrecaja_idregistro"});
  detalle_cierrecaja.belongsTo(denominacionmonedas, { as: "denominacionmonedas_idregistro_denominacionmoneda", foreignKey: "denominacionmonedas_idregistro"});
  denominacionmonedas.hasMany(detalle_cierrecaja, { as: "detalle_cierrecajas", foreignKey: "denominacionmonedas_idregistro"});
  detalle_cierrecaja.belongsTo(detalle_aperturacaja, { as: "detalle_aperturacaja_idregistro_detalle_aperturacaja", foreignKey: "detalle_aperturacaja_idregistro"});
  detalle_aperturacaja.hasMany(detalle_cierrecaja, { as: "detalle_cierrecajas", foreignKey: "detalle_aperturacaja_idregistro"});
  aperturacaja.belongsTo(estaciones, { as: "estaciones_NumeroEstacion_estacione", foreignKey: "estaciones_NumeroEstacion"});
  estaciones.hasMany(aperturacaja, { as: "aperturacaja", foreignKey: "estaciones_NumeroEstacion"});
  denominacionmonedas.belongsTo(monedas, { as: "monedas_idregistro_moneda", foreignKey: "monedas_idregistro"});
  monedas.hasMany(denominacionmonedas, { as: "denominacionmonedas", foreignKey: "monedas_idregistro"});

  return {
    aperturacaja,
    cajas,
    cierrecaja,
    denominacionmonedas,
    detalle_aperturacaja,
    detalle_cierrecaja,
    detallecierrecajapos,
    estaciones,
    monedas,
  };
}
module.exports = initModels;
// module.exports.initModels = initModels;
// module.exports.default = initModels;
