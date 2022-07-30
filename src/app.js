const express = require('express');
const app = express();
const cors = require('cors')
const port = process.env.PORT || 3000

// middlewares
// esta condicion es para ejecutar estos middlewares solo en desarrollo en produccion no son necesarios
if (process.env.NODE_ENV != "production") {
    require("dotenv").config()
    const morgan = require('morgan');
    app.use(morgan('dev'));
}
app.use(cors())
app.use(express.urlencoded({ extended: false }));
app.use(express.json());

// rutas
app.use('/api/detallecierrecajapos', require('./rutas/detallecierrecajaspos'));
app.use('/api/detallecierrecaja', require('./rutas/detallecierrecajas'));
app.use('/api/monedas', require('./rutas/monedas'));
app.use('/api/detalleaperturacaja', require('./rutas/detalleaperturacaja'));
app.use('/api/denominacionesmonedas', require('./rutas/denominacionesmonedas'));
app.use('/api/cajas', require('./rutas/caja'));
app.use('/api/aperturacaja', require('./rutas/aperturacaja'));
app.use('/api/cierrecaja', require('./rutas/cierrecaja'));
app.use('/api/estaciones', require('./rutas/estaciones'));
app.listen(port, () => {
    console.log("Servidor iniciado en el puerto " + port);
});
