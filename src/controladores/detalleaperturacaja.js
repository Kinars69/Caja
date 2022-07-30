const models = require("../models");
//c
exports.post = async (req, res) => {
  try {
    const data = await models.detalle_aperturacaja.create(req.body);
    res.json({ data });
  } catch (err) {
    console.log(err)
    res.status(500).json({ err: err.message });
  }
};
//r
exports.getPorId = async (req, res) => {
  const idregistro = req.params.id;
  try {
    const data = await models.detalle_aperturacaja.findByPk(idregistro);
    res.json({ data });
  } catch (err) {
    res.status(500).json({ err: err.message });
  }
};
exports.get = async (req, res) => {
  const aperturacaja_idregistro = parseInt(req.query.aperturacaja_idregistro)

  try {
    const data = await models.detalle_aperturacaja.findAll(
      aperturacaja_idregistro
        ? {
          where: {
            aperturacaja_idregistro
          }
        }
        : {});
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
    const data = await models.detalle_aperturacaja.update(req.body, {
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
    const data = await models.detalle_aperturacaja.destroy({
      where: {
        idregistro,
      },
    });
    res.json({ data });
  } catch (err) {
    res.status(500).json({ err: err.message });
  }
};
