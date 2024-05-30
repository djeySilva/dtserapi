const Express = require('express');
const cors = require('cors')
const app = Express();
const bodyParser = require('body-parser')
const con = require('./db')



app.use(cors())
app.use(bodyParser.json());
const PORT = process.env.Port ?? 3000

function GerarID(){
    return Math.floor(Math.random() * (9999 - 1000 + 1)) + 1000
}






app.get('/authenticate/:bi/:matricula', (req, res) => {
    const bi = req.params.bi
    const matricula = req.params.matricula
    console.log('funcao')
    
    con.query(`call authentication(${bi}, ${matricula});`, (error, rows, fields)=>{            
        if (error) {
            res.status(400).json({ msg: 'Erro ao verificar acesso!'})
            console.log(error)
        } else {
            res.status(200).json(rows[0])
        }
    }) 
})


app.get('/filterFinesText/:id/:text', (req, res) => {
    const text = req.params.text
    const iduser = req.params.id

    con.query(`	SELECT * FROM fines 
	            INNER JOIN listFines ON fines.FK_listFines = listFines.ID_listFine
	            INNER JOIN finesTypes ON listFines.FK_fineType = finesTypes.ID_fineType
	            INNER JOIN infractiontype ON listFines.FK_infractionType = infractiontype.ID_infractionType
	            INNER JOIN vehicle ON fines.FK_Vehicle = vehicle.ID_vehicle
	            INNER JOIN users ON vehicle.FK_user = users.ID_user
	            INNER JOIN typeVehicle ON vehicle.FK_type_vehicle = typeVehicle.ID_typeVehicle
	            INNER JOIN markVehicle ON vehicle.FK_mark_vehicle = markVehicle.ID_markVehicle
	            inner join modelVehicle on markVehicle.ID_markVehicle = modelVehicle.FK_markVehicle
                where users.ID_user = ${iduser} and finesTypes.fineType like '${text}%';`, 
        (error, rows, fields)=>{            
        if (error) {
            res.status(400).json({ msg: 'Erro ao acessar o RUPE!'})
        } else {
            res.status(200).json(rows[0])
        }
    }) 
})
app.get('/findFines/:text', (req, res) => {
    const id = req.params.id

    con.query(`call findFines(${id} );`, (error, rows, fields)=>{            
        if (error) {
            res.status(400).json({ msg: 'Erro ao acessar o RUPE!'})
        } else {
            res.status(200).json(rows[0])
        }
    }) 
})


app.get('/filterFines/:iduser/:idfine', (req, res) => {
    const idfine = req.params.idfine
    const iduser = req.params.iduser

    con.query(`call filterFines(${iduser},${idfine});`, (error, rows, fields)=>{            
        if (error) {
            res.status(400).json({ msg: 'Erro ao acessar o RUPE!'})
        } else {
            res.status(200).json(rows[0])
        }
    }) 
})




app.patch('/generateIDapp/:ID_user', (req, res)=>{
    const ID_app = GerarID()
    const ID_user = req.params.ID_user
    
    con.query(`CALL generateIDAPP( ${ID_app}, ${ID_user} );`, (error, rows, fields) => {
        error ? res.status(400).json({Error: 'Erro ao atribuir o ID!'})
        : res.status(200).json({ID_app})

    })
})

app.patch('/generateIDapp/:ID_user', (req, res)=>{
    const ID_app = GerarID()
    const ID_user = req.params.ID_user
    
    con.query(`CALL generateIDAPP( ${ID_app}, ${ID_user} );`, (error, rows, fields) => {
        error ? res.status(400).json({Error: 'Erro ao atribuir o ID!'})
        : res.status(200).json({ID_app})

    })
})


app.get('/showFilters', (req, res)=>{
    con.query(`select * from finestypes`, (error, rows, fields) => {
        error ? res.status(400).json({Error: 'Erro ao atribuir o ID!'})
        : res.status(200).json(rows)

    })
})


app.get('/findUser/:id', (req, res) => {
    const  id = req.params.id
    con.query(`
            SELECT * FROM vehicle 
            INNER JOIN users ON vehicle.FK_user = users.ID_user
            INNER JOIN typeVehicle ON vehicle.FK_type_vehicle = typeVehicle.ID_typeVehicle
            INNER JOIN markVehicle ON vehicle.FK_mark_vehicle = markVehicle.ID_markVehicle
            inner join modelVehicle on markVehicle.ID_markVehicle = modelVehicle.FK_markVehicle
            WHERE ID_user = ${id} `, (error, rows, fields)=>{            
        res.status(200).send(rows)
    }) 
})

app.get('/verifyfines/:id', (req, res) => {
    const id = req.params.id 

    con.query(`CALL allFines(${id})`, (error, rows, fields) => { 
        if (error) {
            res.status(400).send('Nenhuma multa encontrado!')
        } else {
            rows.length < 1
                ? res.status(204).send('Sem multas!')
                : res.status(200).send(rows[0])
        }
    })
})

app.post('/setToNotificate/', (req, res) => {
    const ID = req.body.ID_fine
    con.query(
        `UPDATE fines SET stateNotify = 'sent' WHERE ( ID_fine  = ${ID})`, (error, rows, fields) => {
    })
    
})

app.get('/fineSelected/:Rupe', (req, res) => {
    const ID = req.params.Rupe

    con.query(`call fineSelected(${ID})`, (error, rows, filds) => {
        rows.length < 1
            ? res.status(204).send('Sem multas!')
            : res.status(200).send(rows[0])
    })
})


app.post('/ShowAllFines/', (req, res) => {
    const ID = req.body.ID
    con.query(`call allFines(${ID})`, (error, rows, filds) => {
        rows.length < 1
            ? res.status(204).send('Sem multas!')
            : res.status(200).send(rows[0])
    })
})

app.get('/ShowQuicklyFInes/:id', (req, res) => {
    const ID = req.params.id
    // console.log(ID)
    con.query(`call UserAndFinesFilterID_user(${ID})`, (error, rows, filds) => {
        rows.length > 0
            ? res.status(200).json(rows[0])
            : res.status(204).send('Sem multas recentes')
    })
})

app.post('/getFineRupe/', (req, res) => {
    const ID = req.body.e
    con.query(`
        SELECT * FROM fines 
	    INNER JOIN listFines ON fines.FK_listFines = listFines.ID_listFine
	    INNER JOIN finesTypes ON listFines.FK_fineType = finesTypes.ID_fineType
	    INNER JOIN infractiontype ON listFines.FK_infractionType = infractiontype.ID_infractionType
        where ID_fine = ${ID}
    ;`, (error, rows, filds) => {
        rows.length > 0
        ? res.status(200).send(rows)
        : ''
    })
})



app.listen(PORT, (error)=> console.log('Server is runing in PORT ', PORT) )

