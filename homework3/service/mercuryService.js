/**
 * This module implements a REST-inspired webservice for the Monopoly DB.
 * The database is hosted on ElephantSQL.
 *
 * Currently, the service supports the player table only.
 *
 * @author: kvlinden
 * @date: Summer, 2020
 */

// Set up the database connection.

const pgp = require('pg-promise')();
const db = pgp({
    host: process.env.SERVER,
    port: 5432,
    database: process.env.USER,
    user: process.env.USER,
    password: process.env.PASSWORD
});

// Configure the server and its routes.

const express = require('express');
const app = express();
const port = process.env.PORT || 3000;
const router = express.Router();
router.use(express.json());

router.get("/", readHelloMessage);
router.get("/people", readPeople);
router.get("/people/:id", readPerson);
router.put("/people/:id", updatePerson);
//router.post('/people', createPerson);
//router.delete('/people/:id', deletePerson);
router.get("/packages", readPackages);
router.get("/packages/:id", readPackage);
router.put("/packages/:id", updatePackage);
//router.post('/packages', createPackage);
//router.delete('/packages/:id', deletePackage);

app.use(router);
app.use(errorHandler);
app.listen(port, () => console.log(`Listening on port ${port}`));

// Implement the CRUD operations.

function errorHandler(err, req, res) {
    if (app.get('env') === "development") {
        console.log(err);
    }
    res.sendStatus(err.status || 500);
}

function returnDataOr404(res, data) {
    if (data == null) {
        res.sendStatus(404);
    } else {
        res.send(data);
    }
}

function readHelloMessage(req, res) {
    res.send('Hello, Mercury Package service!');
}

function readPeople(req, res, next) {
    db.many("SELECT * FROM Person, Package WHER Package.Recipient = Person.emailPrefix;")
        .then(data => {
            res.send(data);
        })
        .catch(err => {
            next(err);
        })
}

