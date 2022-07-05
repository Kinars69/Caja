const express = require('express');
const app = express();

app.set('port', 3000 || process.env.PORT);

// middlewares
// esta condicion es para ejecutar estos middlewares solo en desarrollo en produccion no son necesarios
if (process.env.NODE_ENV != "production") {
    require("dotenv").config()
    const morgan = require('morgan');
    app.use(morgan('dev'));
}
app.use(express.urlencoded({ extended: false }));
app.use(express.json());

// rutas
app.use('/api/detallecierrecajapos', require('./rutas/detallecierrecajaspos'));
app.use('/api/detallecierrecaja', require('./rutas/detallecierrecajas'));
app.use('/api/monedas', require('./rutas/monedas'));
app.use('/api/detalleaperturacaja', require('./rutas/detalleaperturacaja'));
 
app.listen(app.get('port'), () => {
    console.log("Servidor iniciado en el puerto " + app.get('port'));
});
