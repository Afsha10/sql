const express = require("express");
const bodyParser = require("body-parser");
require("dotenv").config();

const app = express();

const { Pool } = require("pg");

// console.log(process.env.POSTGRES_PASSWORD);

const db = new Pool({
  user: process.env.POSTGRES_USER,
  host: process.env.POSTGRES_HOST,
  database: process.env.POSTGRES_DATABASE,
  password: process.env.POSTGRES_PASSWORD,
  port: process.env.POSTGRES_PORT,
  // ssl: true
});

app.get("/", function (req, res) {
  res.send("<h1>Hotel Database Project Home Page</h1>");
});

// Exercise 1 # 1:

// getting all customers' full data
app.get("/customers", function (req, res) {
  db.query("SELECT * FROM customers")
    .then((result) => {
      res.status(200).json({ customers: result.rows });
    })
    .catch((err) => {
      console.log(err);
    });
});

// getting a single customer's data by id practicing with logging

// app.get("/customers/:id", function (req, res) {
//   const custId = parseInt(req.params.id);
//   db.query("SELECT * FROM customers WHERE id = $1", [custId])
//     .then((result) => {
//       console.log(result.rows);
//     })
//     .catch((error) => {
//       console.log(error);
//     });
// });

// getting a single customer's data by id (CYF way)

// app.get("/customers/:id", function (req, res) {
//   const custId = parseInt(req.params.id);
//   db.query("SELECT * FROM customers WHERE id = $1", [custId])
//     .then((result) => {
//       res.json(result.rows);
//     })
//     .catch((error) => {
//       res.status(400).json(error);
//     });
// });

// Exercise 1 # 2:

// getting a single customer's data by id (Keith's way)

app.get("/customers/:id", function (req, res) {
  const custId = parseInt(req.params.id);
  db.query(
    "SELECT * FROM customers WHERE id = $1",
    [custId],
    (error, result) => {
      if (error == undefined) {
        res.json(result.rows);
      } else {
        console.log(error);
        res.status(400).json(error);
      }
    }
  );
});

// getting customers data by city (CYF way)

app.get("/customers/by_city/:city", (req, res) => {
  const cityName = req.params.city;
  db.query("SELECT * FROM customers WHERE city ILIKE $1 || '%'", [cityName])
    .then((result) => {
      res.json(result.rows);
    })
    .catch((error) => {
      res.status(400).json(error);
    });
});

// getting customers data by city (Keith's way)

app.get("/customers/by_city/:city", function (req, res) {
  const cityName = req.params.id;
  db.query(
    "SELECT * FROM customers WHERE city ILIKE $1 || '%'",
    [cityName],
    (error, result) => {
      if (error == undefined) {
        res.json(result.rows);
      } else {
        console.log(error);
        res.status(400).json(error);
      }
    }
  );
});

// Exercise 1 # 3a:

app.get("/customers/by_name/:name", (req, res) => {
  const custName = req.params.name;
  db.query("SELECT * FROM customers WHERE name ILIKE $1 || '%'", [custName])
    .then((result) => {
      res.json(result.rows);
    })
    .catch((error) => {
      res.status(400).json(error);
    });
});

// Exercise 1 # 3b:

// getting a single customer's data by id (Keith's way)

app.get("/customers/by_name/:name", function (req, res) {
  const custName = req.params.name;
  db.query(
    "SELECT * FROM customers WHERE name ILIKE $1 || '%'",
    [custName],
    (error, result) => {
      if (error == undefined) {
        res.json(result.rows);
      } else {
        console.log(error);
        res.status(400).json(error);
      }
    }
  );
});

app.listen(3000, function () {
  console.log("Server is listening on port 3000. Ready to accept requests!");
});
