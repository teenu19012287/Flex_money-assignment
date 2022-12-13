//import the modules
const path = require('path');
const express = require('express');
const ejs = require('ejs');
const bodyParser = require('body-parser');
const mysql = require('mysql');

//creating an express app
const app = express();

//creating mysql database connection
const connection = mysql.createConnection({
    host: 'localhost',
    user: 'root',
    password: '',
    database: 'user'
});

//connecting to the database
connection.connect((err) => {
    if (err) console.log(err);
    else console.log('Database Connected!');
});

//set views file
app.set('views', path.join(__dirname, 'public/views'));

//set view engine
app.set('view engine', 'ejs');
app.use(bodyParser.json());
app.use(bodyParser.urlencoded({ extended: false }));


//using the css files and the images
app.use(express.static(__dirname + '/public'));
app.use( express.static( "public" ) );

//home page
app.get('/', (req,res) => {
    res.render('home', {
        title: 'User Management System'
    });
});

//login page
app.get('/login', (req,res) => {
    res.render('login', {
        title: 'User Login'
    })
});

app.post('/log', (req, res) => {
    const sql = "SELECT EXISTS(SELECT * from user_log WHERE email = '" + req.body.logemail + "' AND password = '" + req.body.pswd + "') as output";
    connection.query(sql, (err, results) => {
        if(err) throw err;
        if(results[0].output) {
            res.redirect('/user_index');
        }
        else{
            res.send("Invalid Information!!! Go back and try again or Sign Up!!");
        }
    })
})

//signup page
app.get('/signup', (req, res) => {
    res.render('signup', {
        title: 'User Registration'
    });
});

app.post('/register', (req, res) => {
    const data = {
        email: req.body.email,
        password: req.body.pswd
    };
    const sql = "INSERT INTO user_log SET ?";
    connection.query(sql, data, (err, results) => {
        if (err) throw err;
        res.redirect('/login');
    });
});

//showing details of users in table
app.get('/index', (req, res) => {

    const sql = "SELECT id,first_name,last_name,email,mobile FROM users";
    connection.query(sql, (err, rows) => {
        if (err) throw err;
        res.render('user_index', {
            title: 'USER DETAILS',
            users: rows
        });
    });
});

app.get('/user_index', (req, res) => {
    const sql = "SELECT id,first_name,last_name,email,mobile FROM users";
    connection.query(sql, (err, rows) => {
        if (err) throw err;
        res.render('user_index', {
            title: 'USER DETAILS',
            users: rows
        });
    });
})

//viewing complete details
app.get('/view/:userId', (req, res) => {
    const userId = req.params.userId;
    const sql = `Select * from users where id = ${userId}`;
    connection.query(sql,(err, result) => {
        if(err) throw err;
        res.render('user_view', {
            title : `Details for User ID: ${userId}`,
            user : result[0]
        });
    });
})

//adding details
app.get('/add', (req, res) => {
    res.render('user_add', {
        title: 'ENTER DETAILS'
    });
});

app.post('/save', (req, res) => {
    const data = {
        first_name: req.body.fname,
        last_name: req.body.lname,
        email: req.body.email,
        mobile: req.body.phone,
        address: req.body.address,
        pin: req.body.pin,
        state: req.body.state,
        country: req.body.country
    };
    const sql = "INSERT INTO users SET ?";
    connection.query(sql, data, (err, results) => {
        if (err) throw err;
        res.redirect('/user_index');
    });
});

//updating details
app.get('/edit/:userId',(req, res) => {
    const userId = req.params.userId;
    const sql = `Select * from users where id = ${userId}`;
    connection.query(sql,(err, result) => {
        if(err) throw err;
        res.render('user_edit', {
            title : 'UPDATE DETAILS',
            user : result[0]
        });
    });
});

app.post('/update',(req, res) => {
    const userId = req.body.id;
    const data = {
        first_name: req.body.fname,
        last_name: req.body.lname,
        email: req.body.email,
        mobile: req.body.phone,
        address: req.body.address,
        pin: req.body.pin,
        state: req.body.state,
        country: req.body.country
    };
    const sql = `UPDATE users SET ? where id = ${userId}`;
    connection.query(sql,data,(err, results) => {
      if(err) throw err;
      res.redirect('/user_index');
    });
});

//delete user
app.get('/delete/:userId',(req, res) => {
    const userId = req.params.userId;
    const sql = `DELETE from users where id = ${userId}`;
    connection.query(sql,(err, result) => {
        if(err) throw err;
        res.redirect('/user_index');
    });
});


// Server Listening
app.listen(3000, () => {
    console.log(`Server is running at http://localhost:3000`);
});