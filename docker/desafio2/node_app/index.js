// ts-check

const app = require("express")();
const mysql = require("mysql");

const conf = {
  host: "banco",
  user: "root",
  password: "root",
  database: "desafio2",
};

const conn = mysql.createConnection(conf);

// Cria a tabela PEOPLE se n existir
const query =
  "CREATE TABLE IF NOT EXISTS `desafio2`.`people` (`name` VARCHAR(255) NOT NULL, `id` INT(11) NOT NULL auto_increment, PRIMARY KEY (`id`))";
conn.query(query);

app.get("/", function (req, res) {
  const command = `INSERT INTO people (name) values ('${Math.random()
    .toString(36)
    .substring(7)}');`;
  conn.query(command);

  conn.query("SELECT * FROM people", function (err, results) {
      if (err) {
        console.error(err);
      }
      data = results.map(elm => elm.name).toString();

      res.send(`<h1>Full Cycle Rocks!</h1>
      Nomes aleatórios inseridos no banco a cada requisição: 
      ${data}`);
    });

});

app.listen(3000, () => {
  console.log("Funfando");
});
