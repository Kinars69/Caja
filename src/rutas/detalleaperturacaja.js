const { post, get, put, del, getPorId } = require("../controladores/detalleaperturacaja")
const { validator } = require("../config/validator");
const { body, param } = require("express-validator");
const router = require("express").Router()

//c
router.post("/",
  body("idregistro").isInt(),
  body("idapertura").isInt(),
  body("iddenominacion").isInt(),
  body("cantidad").isInt().default(1),
  body("monto").isFloat().default(1),
  body("aperturacaja_idregistro").isFloat().default(1),
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
  body("caja").isInt().default(1).optional({ nullable: true }),
  body("estacion").isInt().default(1).optional({ nullable: true }),
  body("cierre").isInt().default(1).optional({ nullable: true }),
  body("monto").isFloat().default(1).optional({ nullable: true }),
  body("fechahora").isDate().default(Date.now()).optional({ nullable: true }),
  body("fechaapertura").isDate().default(Date.now()).optional({ nullable: true }),
  body("estaciones_NumeroEstacion").isInt().default(1).optional({ nullable: true }),
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
