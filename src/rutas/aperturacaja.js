
const { post, get, put, del, getPorId } = require("../controladores/aperturacaja")
const { validator } = require("../config/validator");
const { body,param } = require("express-validator");

const router = require("express").Router()
//c
router.post("/", 
  body("idregistro").isInt(),
  body("caja").isInt(),
  body("estacion").isInt(),
  body("fechahora").isDate(),
  body("cierre").isInt(),
  body("monto").isFloat(),
  body("fechaapertura").isDate(),
  body("estaciones_NumeroEstacion").isInt(),
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
  param("idregistro").toInt(),
  // nullable en caso de no recbir este campo no se actualiza dicho campo
  body("caja").isInt().optional({nullable:true}),
  body("estacion").isInt().optional({nullable:true}),
  body("fechahora").isDate().optional({nullable:true}),
  body("cierre").isInt().optional({nullable:true}),
  body("monto").isFloat().optional({nullable:true}),
  body("fechaapertura").isDate().optional({nullable:true}),
  body("estacion_NumeroEstacion").isInt().optional({nullable:true}),
  validator,
  put
)

//d
router.delete("/:id",
  param("idregistro").toInt(),
  validator,
  del
)


module.exports = router
