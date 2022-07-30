const { post, get, put, del, getPorId } = require("../controladores/cierrecaja")
const { validator } = require("../config/validator");
const { body, param } = require("express-validator");
const router = require("express").Router()

//c
router.post("/",
  body("idregistro").isInt(),
  body("caja").isInt().default(1),
  body("usuario").isInt().default(1),
  body("estacion").isInt().default(1),
  body("apertura").isInt().default(1),
  body("fechahora").isDate().default(Date.now()),
  body("efectivoreal").isFloat().default(1),
  body("efectivosistema").isFloat().default(1),
  body("tarjetadevolucionreal").isFloat().default(1),
  body("tarjetamontoreal").isFloat().default(1),
  body("tarjetamontosistema").isFloat().default(1),
  body("ventasefectivo").isFloat().default(1),
  body("ventastarjeta").isFloat().default(1),
  body("egresos").isFloat().default(1),
  body("propina").isFloat().default(1),
  body("descuento").isFloat().default(1),
  body("impuesto15").isFloat().default(1),
  body("impuesto18").isFloat().default(1),
  body("exento").isFloat().default(1),
  body("fechacierre").isDate().default(Date.now()),
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
  body("usuario").isInt().default(1),
  body("estacion").isInt().default(1).optional({ nullable: true }),
  body("apertura").isInt().default(1).optional({ nullable: true }),
  body("fechahora").isDate().default(Date.now()).optional({ nullable: true }),
  body("efectivoreal").isFloat().default(1).optional({ nullable: true }),
  body("efectivosistema").isFloat().default(1).optional({ nullable: true }),
  body("tarjetadevolucionreal").isFloat().default(1).optional({ nullable: true }),
  body("tarjetamontoreal").isFloat().default(1).optional({ nullable: true }),
  body("tarjetamontosistema").isFloat().default(1).optional({ nullable: true }),
  body("ventasefectivo").isFloat().default(1).optional({ nullable: true }),
  body("ventastarjeta").isFloat().default(1).optional({ nullable: true }),
  body("egresos").isFloat().default(1).optional({ nullable: true }),
  body("propina").isFloat().default(1).optional({ nullable: true }),
  body("descuento").isFloat().default(1).optional({ nullable: true }),
  body("impuesto15").isFloat().default(1).optional({ nullable: true }),
  body("impuesto18").isFloat().default(1).optional({ nullable: true }),
  body("exento").isFloat().default(1).optional({ nullable: true }),
  body("fechacierre").isDate().default(Date.now()),
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