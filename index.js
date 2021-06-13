var express = require("express");
var router = express.Router();
var path = require("path");
var fs = require("fs");

const bodyParser = require("body-parser");
const cors = require("cors");

const mysql = require("mysql");
var app = express();
var router = express.Router();

// momo requirement
// const { sendPaymentMomo } = require("./sendPaymentMomo");

app.use(cors());
app.use(bodyParser.urlencoded({ extended: true }));
app.use(express.urlencoded({ extended: true }));
app.use(express.json());

const db = mysql.createPool({
  host: "localhost",
  user: "root",
  password: "",
  database: "cabinet-rent",
});

// --------------------------------------------------------------------FOR CUSTOMER-------------------------------------------------------------------------------

//get ready cabinet
app.get(`/findCabinet`, (req, res) => {
  const sqlGet = "SELECT * FROM CABINET WHERE STATE='READY'";
  db.query(sqlGet, (err, result) => {
    if (err) console.log(err);
    res.send(result);
  });
});
//get all cabinet of an user
// app.post(`/getCabinetUser`, (req, res) => {
//   const sqlGet = "SELECT * FROM CABINET WHERE id=?";
//   db.query(sqlGet, [+req.body.id], (err, result) => {
//     if (err) console.log(err);
//     res.send(result);
//   });
// });
//check username password
app.post(`/login`, (req, res) => {
  const sqlGet = "SELECT * FROM USER WHERE username=? and password=?";
  db.query(sqlGet, [req.body.username, req.body.password], (err, result) => {
    if (err) console.log(err);
    res.send(result);
  });
});
//get a cabinet with id
app.post(`/getCabinet`, (req, res) => {
  const sqlGet = "SELECT * FROM CABINET WHERE id=?";
  db.query(sqlGet, [+req.body.id], (err, result) => {
    if (err) console.log(err);
    res.send(result);
  });
});
//change state of cabinet
app.post("/ChangeCabinetState", (req, res) => {
  const sqlChange = "UPDATE CABINET SET state = ? WHERE id = ?;";
  db.query(sqlChange, [req.body.state, +req.body.id], (err, result) => {
    if (err) console.log(err);
    console.log(result);
    res.send(result);
  });
});

//register a new account
app.post(`/AddNewAccount`, (req, res) => {
  const sqlInsert =
    "INSERT INTO `user`(`fullname`, `username`, `phonenum`, `password`) VALUES (?,?,?,?)";
  db.query(
    sqlInsert,
    [
      req.body.fullname,
      req.body.username,
      +req.body.phonenum,
      +req.body.password,
    ],
    (err, result) => {
      if (err) console.log(err);
      console.log(result);
      res.send(result);
    }
  );
});
//add new transaction
app.post("/AddTransactionInProgress", (req, res) => {
  const sqlInsert =
    "INSERT INTO `transasction_in_progress` (`Time_Arrive`, `Time_Leave`, `PhoneNum_Sender`, `PhoneNumReceiver`, `Fee`, `State`, `Cabintet_ID`, `UserID`) VALUES (NOW(), NULL, ?, ?, '5000', 'in_progress', '1', '1')";
  db.query(
    sqlInsert,
    [
      req.body.PhoneNum_Sender,
      req.body.PhoneNumReceiver,
      +req.body.Cabintet_ID,
      +req.body.UserID,
    ],
    (err, result) => {
      if (err) console.log(err);
      console.log(result);
      res.send(result);
    }
  );
});
app.listen(3001, () => {
  console.log("running on port ", 3001);
});
