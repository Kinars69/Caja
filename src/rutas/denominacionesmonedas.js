const { post, get, put, del, getPorId } = require("../controladores/denominacionesmonedas")
const { validator } = require("../config/validator");
const { body,param } = require("express-validator");

const router = require("express").Router()
//c
router.post("/", 
  body("idregistro").isInt(),
  body("moneda").isInt(),
  body("denominacion").isString(),
  body("valor").isFloat(),
  body("tipo").isString(),
  body("monedas_idregistro").isInt(),
  validator,
  post
)
//r
router.get("/", get)

router.get("/:id",
  param("id").toInt(),
  validator,
  getPorId
)

//u
router.put("/:id", 
  param("id").toInt(),
  // nullable en caso de no recbir este campo no se actualiza dicho campo
  body("moneda").isInt().optional({nullable:true}),
  body("denominacion").isString().optional({nullable:true}),
  body("valor").isFloat().optional({nullable:true}),
  body("tipo").isString().optional({nullable:true}),
  body("monedas_idregistro").isInt().optional({nullable:true}),
  validator,
  put
)

//d
router.delete("/:id",
  param("id").toInt(),
  validator,
  del
)


module.exports = router