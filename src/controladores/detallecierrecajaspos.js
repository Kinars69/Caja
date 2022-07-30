const models = require("../models")
//c
exports.post = async (req, res) => {
  try {
    const data = await models.detallecierrecajapos.create(req.body)
    res.json({ data })
  } catch (err) {
    res.status(500).json({ err: err.message })
  }

}
//r
exports.getPorId = async (req, res) => {
  const idregistro = req.params.id
  try {
    const data = await models.detallecierrecajapos.findByPk(
      idregistro
    )
    res.json({ data })
  } catch (err) {
    res.status(500).json({ err: err.message })
  }
}
exports.get = async (req, res) => {
  const cierrecaja_idregistro = parseInt(req.query.cierrecaja_idregistro)
  try {
    const data = await models.detallecierrecajapos.findAll(
      cierrecaja_idregistro
        ? {
          where: {
            cierrecaja_idregistro
          }
        }
        : {}
    )
    res.json({ data, })
  } catch (err) {
    res.status(500).json({ err: err.message })
  }
}

//u
exports.put = async (req, res) => {
  const idregistro = req.params.id
  try {
    const data = await models.detallecierrecajapos.update(req.body, {
      where: {
        idregistro
      }
    })
    res.json({ data })
  } catch (err) {
    res.status(500).json({ err: err.message })
  }
}

//d
exports.del = async (req, res) => {
  const idregistro = req.params.id
  try {
    const data = await models.detallecierrecajapos.destroy({
      where: {
        idregistro
      }
    })
    res.json({ data })
  } catch (err) {
    res.status(500).json({ err: err.message })
  }
}

