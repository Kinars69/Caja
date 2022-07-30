const { post, get, put, del, getPorId } = require("../controladores/caja")
const { validator } = require("../config/validator");
const { body,param } = require("express-validator");

const router = require("express").Router()
//c
router.post("/", 
  body("estacion").isInt(),
  body("activo").isInt(),
  body("fechahora").isDate(),
  body("estado").isString(),
  body("cierrecaja_idregistro").isInt(),
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
  body("activo").isInt().optional({nullable:true}),
  body("fechahora").isDate().optional({nullable:true}),
  body("estado").isString().optional({nullable:true}),
  body("cierrecaja_idregistro").isInt().optional({nullable:true}),
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
