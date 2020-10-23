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
//     database: process.env.DATABASE,
//     multipleStatements: true
// });

const connection = mysql.createConnection({
    host: 'localhost',
    user: 'mytzy',
    password: 'mytzy',
    database: 'cheese',
    multipleStatements: true
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

app.get('/inventory', isAuthenticated, function(req, res) {
    var statement = 'SELECT * FROM totalCheeses;';
    connection.query(statement, function(error, result) {
        if(error) throw error;
        //console.log(result);
        let resCheese = result;
        console.log(resCheese);
        console.log(isAuthenticated);
        console.log("Name: " + req.session.user);
        console.log("ID: " + req.session.user_id);
        let the_id = req.session.user_id;
        let the_name = req.session.user;
        console.log("the id: " + the_id);
        res.render('listOfProducts', {cheeseList: resCheese, the_user_id: the_id, the_user_name: the_name}); //
    });
});

app.get('/inventory/:cid', function(req, res){
    var stmt = 'SELECT * FROM totalCheeses WHERE cheeseId=' + req.params.cid + ';';
    console.log(stmt);
    connection.query(stmt, function(error, results){
        if(error) throw error;
        if(results.length) {
            var cheese = results[0];
            console.log(cheese);
            res.render('product', {cheese:cheese});
        }
    });
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
        req.session.user_id = isUserExist[0].userId;
        console.log("authenticated: " + req.session.authenticated);
        console.log("username: " + req.session.user);
        console.log("ID: " + req.session.user_id);
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
        let stmt = 'INSERT INTO users (username, password, email, gender, address) VALUES (?, ?, ?, ?, ?)';
        let data = [req.body.username, hash, req.body.email, '', ''];
        connection.query(stmt, data, function(err, result){
            console.log(stmt)
           if(err) throw err;
           res.redirect('/login');
        });
    });
});

app.get('/cart', isAuthenticated, function(req, res) {
    var stmt = 'SELECT * FROM totalCheeses;';
    connection.query(stmt, function(error, result) {
        if (error) throw error;
        res.render('shoppingcart', {cheeseList : result});
    });
});

function createCartStatement(numOfCheeses) {
    var updateStatement = "";
    var i;
    for(i = 1; i <= numOfCheeses; i++) {
        let tempStmt = 'update totalCheeses set invnum = (invnum - ?) where cheeseId=' + i + '; ';
        updateStatement += tempStmt;
    }
    //console.log(updateStatement);
    return updateStatement;
}

app.post('/cart', function(req, res) {
    //to do
    var stmt = createCartStatement(6);
    let data = [parseInt(req.body.choicenum1),parseInt(req.body.choicenum2),parseInt(req.body.choicenum3),parseInt(req.body.choicenum4),parseInt(req.body.choicenum5),parseInt(req.body.choicenum6)];
    
    connection.query(stmt, data, function(err, result) {
        console.log("HERE!");
        console.log(stmt);
        if(err) throw err;
        res.redirect('/inventory'); 
    });
});

app.get('/editCart', isAuthenticated, function(req, res) {
    res.render('editcart');
});

app.get('/user/:uid', isAuthenticated, function(req, res) {
    console.log("User page");
    var stmt = 'SELECT * FROM users where userId = ' + req.session.user_id + ';';
    connection.query(stmt, function(error, result) {
        if(result.length) {
            if(error) throw error;
            let userInfo = result[0];
            res.render('userprofile', {userInfo:userInfo});
        }
    });
});

app.post('/user/:uid', isAuthenticated, function(req, res) {
    console.log("User page");
    var stmt = 'update users set email = \'' + req.body.email + '\', gender = \'' + req.body.gender + '\', address = \'' + req.body.address + '\' where userId=' + req.session.user_id + ';';
    connection.query(stmt, function(error, result) {
        console.log("Query update Started");
        console.log("reached here!");
        if(error) throw error;
        res.redirect('/inventory');
    });
});

app.get('/search', isAuthenticated, function(req, res) {
   let stmt = "SELECT * from totalCheeses where cheeseName like '%" + req.query.cname + "%';";// complete yooo
   
   connection.query(stmt, function(error, result){
        if(error) throw error;
        console.log(result);
        if(result.length){
            res.render('searchResults', {result:result}); //, {user: req.session.user, result: result}
        }else{
            res.render('error');
        }
    });
});

app.get('/adminLogin', function(req, res) {
    res.render('adminLogin');
});

app.post('/adminLogin', function(req, res) {
    if(req.body.adminName == "admin" && req.body.adminPW == "password") {
        res.redirect('/admin');
    } else {
        res.redirect('/');
    }
});

app.get('/admin', function(req, res) {
    var statement = 'SELECT * FROM totalCheeses; SELECT * FROM users';
    connection.query(statement, function(error, result) {
        if(error) throw error;
        //console.log(result);
        let resCheese = result[0];
        let resUser = result[1]
        console.log(resCheese);
        console.log(resUser);
        res.render('admin', {cheeseList: resCheese, userList: resUser}); //
    });
});

/**
 * These features will not be implemented due to the heavy interference with the cart functionality.
 * Unfortunately, we backed ourselves into a corner with the way that the cart was structured:
 * (Having all items on the page with being able to choose how many you want to take).
 * We don't have enough time to fix what is already implemented so we will instead have the cheeses set.
 * */


//Deprecated function
app.post('/adminAdd', function(req, res) {
   var stmt = 'Insert into totalCheeses (cheeseName, cost, category, image, description, invnum) values (?, ?, ?, ?, ?, ?);'; 
   let data = [req.body.newCheeseName, req.body.newCheeseCost, req.body.newCheeseCategory, req.body.newCheeseImage, req.body.newCheeseDescription, req.body.invnum];
   
   connection.query(stmt, data, function(err, result) {
       if(err) throw err;
       
       res.redirect('/admin');
   });
});
//Deprecated function
app.post('/adminDelete', function(req, res) {
   var statement = "DELETE FROM totalCheeses WHERE cheeseID = " + req.query.cheeseID + ";";
   connection.query(statement, function(error, result) {
        if(error) throw error;
        //console.log(result);
        res.redirect('/admin');
    });
});
//Deprecated function
app.post('/adminUpdate', function(req, res) {
   var statement = "UPDATE totalCheeses SET cheeseName=" + req.query.cheeseName + ", cheeseCost=" + req.query.cheeseCost + ", cheeseCategory=" + req.query.cheeseCategory + ", cheeseImage=" + req.query.cheeseImage + ", cheeseDescription=" + req.query.cheeseDescription + ", cheeseInvnum=" + req.query.cheeseInvnum + ", cheeseId=" + req.query.cheeseId + ";";
   connection.query(statement, function(error, result) {
        if(error) throw error;
        //console.log(result);
        res.redirect('/admin');
    });
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