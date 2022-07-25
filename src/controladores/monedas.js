const { Op } = require("sequelize");
const models = require("../models");
//c
exports.post = async (req, res) => {
  try {
    const data = await models.monedas.create(req.body);
    res.json({ data });
  } catch (err) {
    res.status(500).json({ err: err.message });
  }
};
//r
exports.getPorId = async (req, res) => {
  const idregistro = req.params.id;
  try {
    const data = await models.monedas.findByPk(
      idregistro,
    );
    res.json({ data });
  } catch (err) {
    res.status(500).json({ err: err.message });
  }
};
exports.get = async (req, res) => {
  try {
    const { nombre } = req.query
    const data = await models.monedas.findAll(nombre ? {
      where: {
        nombre: {
          [Op.like]: nombre
        }
      }
    } : {});
    res.json({
      data,
    });
  } catch (err) {
    res.status(500).json({ err: err.message });
  }
};

//u
exports.put = async (req, res) => {
  const idregistro = req.params.id;
  try {
    const data = await models.monedas.update(
      { ...req.body },
      {
        where: {
          idregistro,
        },
      },
    );
    res.json({ data });
  } catch (err) {
    res.status(500).json({ err: err.message });
  }
};

//d
exports.del = async (req, res) => {
  const idregistro = req.params.id;
  try {
    const data = await models.monedas.destroy({
      where: {
        idregistro,
      },
    });
    res.json({ data });
  } catch (err) {
    res.status(500).json({ err: err.message });
  }
};
