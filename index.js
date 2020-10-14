var express = require('express');
var bodyParser = require('body-parser');
//var methodOverride = require('method-override');
var mysql = require('mysql');
var session = require('express-session');
var bcrypt = require('bcrypt');
var app = express();
//var jsdom = require('jsdom');
//var $ = require("jquery")(new jsdom.JSDOM().window);

app.use(express.static('css'));
app.use(express.static('public'));
app.use(bodyParser.urlencoded({extended: true}));
//app.use(methodOverride('_method'));
app.use(session({
    secret: 'top secret code!',
    resave: true,
    saveUninitialized: true
}));
app.set('view engine', 'ejs');

// const connection = mysql.createConnection({
//     host: process.env.HOST,
//     user: process.env.USERNAME,
//     password: process.env.PASSWORD,
//     database: process.env.DATABASE
// });

const connection = mysql.createConnection({
    host: 'localhost',
    user: 'mytzy',
    password: 'mytzy',
    database: 'cheese'
});
//connection.connect(); // This is for JAawsDB

// Middleware 
function isAuthenticated(req, res, next){
    if(!req.session.authenticated) res.redirect('/login');
    else next();
}

/* check username in DB */
function checkUsername(username){
    let stmt = 'SELECT * FROM users WHERE username=?';
    return new Promise(function(resolve, reject){
       connection.query(stmt, [username], function(error, results){
           if(error) throw error;
           resolve(results);
       }); 
    });
}

/* check if password matches username */
function checkPassword(password, hash){
    return new Promise(function(resolve, reject){
       bcrypt.compare(password, hash, function(error, result){
          if(error) throw error;
          resolve(result);
       }); 
    });
}

app.get('/inventory', function(req, res) {
    var statement = 'SELECT * FROM totalCheeses;';
    connection.query(statement, function(error, result) {
        if(error) throw error;
        //console.log(result);
        let resCheese = result;
        console.log(resCheese);
        res.render('listOfProducts', {cheeseList: resCheese}); //
    });
});

app.get('/inventory/:cid', function(req, res){
    var stmt = 'SELECT * FROM totalCheeses WHERE cheeseId=' + req.params.cid + ';';
    console.log(stmt);
    connection.query(stmt, function(error, results){
        if(error) throw error;
        if(results.length) {
            var cheese = results[0];
            res.render('product', {cheese:cheese});
        }
    })
});

app.get('/', function(req, res){
    res.render('home');
});

/* Login Routes */
app.get('/login', function(req, res){
    res.render('login');
});


/* Add login post method */
app.post('/login', async function(req, res){
    let isUserExist   = await checkUsername(req.body.username);
    console.log(isUserExist[0]);
    let hashedPasswd  = isUserExist.length > 0 ? isUserExist[0].password : '';
    let passwordMatch = await checkPassword(req.body.password, hashedPasswd);
    console.log(passwordMatch);
    if(passwordMatch){
        req.session.authenticated = true;
        req.session.user = isUserExist[0].username;
        res.redirect('/inventory');
    }
    else{
        console.log("error:::");
        res.render('login', {error: true});
    }
});

/* Register Routes */
app.get('/register', function(req, res){
    res.render('register');
});

/* Register Post Method */
app.post('/register', async function(req, res){
    let salt = 10;
    bcrypt.hash(req.body.password, salt, function(error, hash){
        if(error) throw error;
        let stmt = 'INSERT INTO users (username, password) VALUES (?, ?)';
        let data = [req.body.username, hash];
        connection.query(stmt, data, function(error, result){
           if(error) throw error;
           res.redirect('/login');
        });
    });
});

app.get('/cart', isAuthenticated, function(req, res) {
    res.render('shoppingcart');
});

/* Logout Route */
app.get('/logout', function(req, res){
   req.session.destroy();
   res.redirect('/');
});

/* Error Route*/
app.get('*', function(req, res){
   res.render('error'); 
});

app.listen(process.env.PORT || 3000, function(){
    console.log('Server has been started');
});