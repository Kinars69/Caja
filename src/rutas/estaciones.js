const { post, get, put, del, getPorId } = require("../controladores/estaciones")
const { validator } = require("../config/validator");
const { body, param } = require("express-validator");
const router = require("express").Router()

//c
router.post("/",
  body("NumeroEstacion").isInt(),
  body("nombre").isString(),
  body("activo").isInt(),
  body("vistaprevia").isInt(),
  body("tecladovirtual").isInt(),
  body("nombretipo").isInt(),
  body("nombreproducto").isInt(),
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
 body("NumeroEstacion").isInt(),
 body("nombre").isString(),
 body("activo").isInt(),
 body("vistaprevia").isInt().optional({ nullable: true }),
 body("tecladovirtual").isInt().optional({ nullable: true }),
 body("nombretipo").isInt().optional({ nullable: true }),
 body("nombreproducto").isInt(),
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