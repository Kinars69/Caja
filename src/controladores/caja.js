
const models = require("../models");
//c
exports.post = async (req, res) => {
  try {
    const data = await models.cajas.create(req.body);
    res.json({ data });
  } catch (err) {
    res.status(500).json({ err: err.message });
  }
};
//r
exports.getPorId = async (req, res) => {
  const estacion = req.params.id;
  try {
    const data = await models.cajas.findByPk(
      estacion,
    );
    res.json({ data });
  } catch (err) {
    res.status(500).json({ err: err.message });
  }
};
exports.get = async (_req, res) => {
  try {
    const data = await models.cajas.findAll();
    res.json({
      data,
    });
  } catch (err) {
    res.status(500).json({ err: err.message });
  }
};

//u
exports.put = async (req, res) => {
  const estacion = req.params.id;
  try {
    const data = await models.cajas.update(
      { ...req.body },
      {
        where: {
          estacion,
        },
      },
    );
    res.json({ data, msg:"Registro actualizado!" });
  } catch (err) {
    res.status(500).json({ err: err.message });
  }
};

//d
exports.del = async (req, res) => {
  const estacion = req.params.id;
  try {
    const data = await models.cajas.destroy({
      where: {
        estacion,
      },
    });
    res.json({ data });
  } catch (err) {
    res.status(500).json({ err: err.message });
  }
};

