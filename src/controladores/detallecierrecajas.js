const models = require("../models");
//c
exports.post = async (req, res) => {
  try {
    const data = await models.detalle_cierrecaja.create(req.body);
    res.json({ data });
  } catch (err) {
    res.status(500).json({ err: err.message });
  }
};
//r
exports.getPorId = async (req, res) => {
  const idregistro = req.params.id;
  try {
    const data = await models.detalle_cierrecaja.findByPk(idregistro);
    res.json({ data });
  } catch (err) {
    res.status(500).json({ err: err.message });
  }
};
exports.get = async (req, res) => {
  const detalle_aperturacaja_idregistro = parseInt(req.query.detalle_aperturacaja_idregistro)
  try {
    const data = await models.detalle_cierrecaja.findAll(
      detalle_aperturacaja_idregistro
      ? {
        where: {
          detalle_aperturacaja_idregistro
        }
      }
      : {});
    res.json({ data });
  } catch (err) {
    console.error(err)
    res.status(500).json({ err: err.message });
  }
};

//u
exports.put = async (req, res) => {
  const idregistro = req.params.id;
  try {
    const data = await models.detalle_cierrecaja.update(req.body, {
      where: {
        idregistro,
      },
    });
    res.json({ data });
  } catch (err) {
    res.status(500).json({ err: err.message });
  }
};

//d
exports.del = async (req, res) => {
  const idregistro = req.params.id;
  try {
    const data = await models.detalle_cierrecaja.destroy({
      where: {
        idregistro,
      },
    });
    res.json({ data });
  } catch (err) {
    res.status(500).json({ err: err.message });
  }
};
