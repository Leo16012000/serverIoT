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
//get all history trade
app.get(`/historyTrades`, (req, res) => {
  const sqlGet = "SELECT * FROM history_trade";
  db.query(sqlGet, (err, result) => {
    if (err) console.log(err);
    res.send(result);
  });
});
//get cabinet of an user
app.post(`/getCabinetByUser`, (req, res) => {
  const sqlGet = "SELECT * FROM TRANSACTION_IN_PROGRESS WHERE UserID=?";
  db.query(sqlGet, [+req.body.userID], (err, result) => {
    if (err) console.log(err);
    res.send(result);
  });
});
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
    "INSERT INTO `transaction_in_progress` (`Time_Arrive`, `Time_Leave`, `PhoneNum_Sender`, `PhoneNumReceiver`, `Fee`, `Cabinet_ID`, `UserID`) VALUES (NOW(), NULL, ?, ?, '5000', ?, ?)";
  db.query(
    sqlInsert,
    [
      req.body.PhoneNumSender,
      req.body.PhoneNumReceiver,
      +req.body.CabinetID,
      +req.body.UserID,
    ],
    (err, result) => {
      if (err) console.log(err);
      console.log(result);
      res.send(result);
    }
  );
});
//delete transaction in progress with Cabinet_ID
app.post("/deleteTransaction", (req, res) => {
  const sqlDelete = "DELETE FROM `transaction_in_progress` WHERE Cabinet_ID=? ";
  db.query(sqlDelete, [+req.body.Cabinet_ID], (err, result) => {
    if (err) console.log(err);
    console.log(result);
    res.send(result);
  });
});
//add new history trade
app.post("/AddHistoryTrade", (req, res) => {
  const sqlInsert =
    "INSERT INTO `history_trade`(`Time_Arrive`, `PhoneNumSender`, `PhoneNumReceiver`, `Fee`, `User_ID`, `Cabinet_ID`) VALUES (?,?,?,5000,?,?)";
  db.query(
    sqlInsert,
    [
      req.body.Time_Arrive,
      req.body.PhoneNumSender,
      req.body.PhoneNumReceiver,
      +req.body.User_ID,
      +req.body.Cabinet_ID,
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
