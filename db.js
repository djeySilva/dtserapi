const mysql = require('mysql2')

const pool = mysql.createPool({
	host: process.env.host,
	user: process.env.user,
	password: process.env.pass,
	database: process.env.Database,
	waitForConnections: true,
	connectionLimit: 10,
	queueLimit: 0
});

pool.getConnection((err, con)=>{
	if(err) console.log(err)
	else console.log('Has a Success!!!')
})


module.exports = pool.promise();




