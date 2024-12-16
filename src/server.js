const express = require('express');
const brandroute = require('./routes/brandRoute')


const app = express();

app.use(express.json());

app.use('/api',brandroute);




app.listen(5000, ()=>{
    console.log(`Server running: http://localhost:5000`)
});