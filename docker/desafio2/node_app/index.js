// ts-check

const app = require('express')();
const mysql = require('mysql');

const conf = {
    host: 'banco',
    user: 'root',
    password: 'root',
    database: 'desafio2',
};

const conn = mysql.createConnection(conf);

// Cria a tabela PEOPLE se n existir
const query = "CREATE TABLE IF NOT EXISTS `desafio2`.`people` (`name` VARCHAR(255) NOT NULL) ENGINE=MEMORY;";
conn.query(query);


app.get('/', function(req, res) {
    const command = `INSERT INTO people (name) values ('Bob');`;
    conn.query(command);

    conn.end();
    res.send('Olá Mundo!');
});

app.listen(3000, () => {
    console.log('Funfando');
})

