const models = require("../models")
//c
exports.post = async (req, res) => {
  try {
    const data = await models.estaciones.create(req.body)
    res.json({ data })
  } catch (err) {
    res.status(500).json({ err: err.message })
  }

}
//r
exports.getPorId = async (req, res) => {
  const NumeroEstacion = req.params.id
  try {
    const data = await models.estaciones.findByPk(
      NumeroEstacion
    )
    res.json({ data })
  } catch (err) {
    res.status(500).json({ err: err.message })
  }
}
exports.get = async (_req, res) => {
  try {
    const data = await models.estaciones.findAll()
    res.json({ data,})
  } catch (err) {
    res.status(500).json({ err: err.message })
  }
}

//u
exports.put = async (req, res) => {
  const NumeroEstacion = req.params.id
  try {
    const data = await models.estaciones.update(req.body,{
      where: {
        NumeroEstacion
      }
    })
    res.json({ data })
  } catch (err) {
    res.status(500).json({ err: err.message })
  }
}

//d
exports.del = async (req, res) => {
  const NumeroEstacion = req.params.id
  try {
    const data = await models.estaciones.destroy({
      where:{
        NumeroEstacion
      }
    })
    res.json({ data })
  } catch (err) {
    res.status(500).json({ err: err.message })
  }
}