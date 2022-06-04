const express = require('express');
const app = express();
const mysql = require('mysql');
var moment = require('moment');
const formidable = require('formidable');
const fs = require('fs');
const session = require('express-session')
const parseurl = require('parseurl');
const bcrypt = require('bcrypt');

app.use(express.static('public'));
//Connexion à la bdd
let pool = mysql.createPool({
    connectionLimit: 10000,
    host: "localhost",
    user: "root",
    password: "",
    database: "blog"
    //port:3306
})
app.use(session({
    secret: 'keyboard cat',
    resave: false,
    saveUninitialized: true,
    cookie: {
        maxAge: 3600000
    }
}))
app.use(function (req, res, next) {
    //Créer une variable utilisable dans ejs
    res.locals.role = req.session.role;
    res.locals.email = req.session.email;
    if (req.session.role == "admin") {
        res.locals.isAdmin = true;
    } else {
        res.locals.isAdmin = false;
    }
    if (req.session.role && req.session.email) {
        res.locals.isNotLogin = false;
    } else {
        res.locals.isNotLogin = true;
    }

    next();
})
app.use(function (req, res, next) {
    //récupérer la route demandée
    let pathname = parseurl(req).pathname.split('/');
    console.log(pathname);
    //on met les url sécurisées dans un tableau
    let protectedPath = ['addArticle', 'deleteArticle', 'editArticle'];
    let connexionPathless = ['admin'];
    //si l'utilisateur n'est pas authentifié en admin et que l'url est protégée alors je redirige vers l'acceuil sinon je dis next();
    if (req.session.role != "admin" && protectedPath.indexOf(pathname[1]) !== -1) {
        res.redirect('/');
    } else {
        next();
    }

})
app.get('/deco', function (req, res) {
    req.session.destroy(function (err) {
        res.redirect('/');
    })
})
app.get('/admin', function (req, res) {
    if (req.session.role && req.session.email) {
        res.redirect('/');
    } else {
        res.render('admin.ejs');
    }

})
app.post('/admin', function (req, res) {
    //soumission du formulaire
    const form = formidable();
    // parser les données qui sont issues du form
    form.parse(req, function (err, fields, files) {
        //console.log(fields);
        //console.log(files);
        pool.query("SELECT email, mdp, role FROM utilisateur WHERE email=?", [fields.email], function (err, result) {
            //console.log(result);
            if (result.length > 0) {
                //console.log(result);
                bcrypt.compare(fields.mdp, result[0].mdp, function (err, bool) {
                    //console.log(err);
                    //console.log(bool);

                    if (bool == true) {
                        //console.log(bool);
                        req.session.role = result[0].role;
                        req.session.email = result[0].email;
                        res.redirect('/');
                    } else {
                        res.render('admin.ejs', {
                            message: "Le mot de passe est incorrect"
                        });
                    }
                })
            } else {
                res.render('admin.ejs', {
                    message: "L'email n'est pas correct"
                });
            }

        })
        console.log(email);
        bcrypt.hash(fields.mdp, 10, function (err, hash) {
            //console.log(hash);
        })
    })

})


app.get('/', function (req, res) {
    // SI COMMENTAIRE(S)
    // SQL AVANT : SELECT *, COUNT(c.idC) AS nb FROM article a JOIN commentaire c ON a.idA = c.idA GROUP BY (c.idA) ORDER BY dateA DESC
    pool.query("SELECT * FROM article a ORDER BY dateA DESC", function (error, articles, fields) {
        pool.query("SELECT * FROM categorie", function (error, categories, fields) {
            console.log(articles);
            res.render('home.ejs', {
                articles: articles,
                categories: categories
            });
        })
    })
})
app.get('/deleteArticle/:id', function (req, res) {
    pool.query("DELETE FROM article WHERE idA = ?", [req.params.id], function (error, fields) {
        res.redirect('/');
    })
})
app.get('/editArticle/:id', function (req, res) {
    pool.query('SELECT * FROM article WHERE idA=?', [req.params.id], function (error, article, fields) {
        pool.query('SELECT * FROM categorie', function (error, categories, fields) {
            res.render('editArticle.ejs', {
                article: article[0],
                categories: categories
            });
        })

    })
})
app.post('/editArticle/:id', function (req, res) {
    //soumission du formulaire

    //upload de l'image
    const form = formidable();

    // parser les données qui sont issues du form
    form.parse(req, function (err, fields, files) {
        //console.log(fields);
        //console.log(files);
        //récupérer le chemin de l'image temporaire
        if (files.photo.originalFilename != "") {
            let oldpath = files.photo.filepath;
            let newpath = "public/img/" + files.photo.originalFilename;
            let pathBdd = files.photo.originalFilename
            fs.rename(oldpath, newpath, function (err) {
                if (err) throw err;

                pool.query("UPDATE article SET titre=?, description=?, auteur=?, image=?, dateA=?, idCateg=? WHERE idA=?", [fields.titre, fields.description, fields.auteur, pathBdd, fields.date, fields.idCateg, req.params.id], function (error, fields) {
                    console.log(error);
                    res.redirect('/');
                })
            })
        } else {
            pool.query("UPDATE article SET titre=?, description=?, auteur=?, dateA=?, idCateg=? WHERE idA=?", [fields.titre, fields.description, fields.auteur, fields.date, fields.idCateg, req.params.id], function (error, fields) {
                //console.log(error);
                res.redirect('/');
            })
        }

    })
})
app.get('/article/:id', function (req, res) {
    pool.query('SELECT * FROM article WHERE idA = ? ORDER BY dateA DESC', [req.params.id], function (error, article, fields) {
        pool.query('SELECT * FROM commentaire WHERE idA = ? ORDER BY dateMessage DESC', [req.params.id], function (error, commentaires, fields) {
            res.render('article.ejs', {
                article: article[0],
                commentaires: commentaires
            });
        })

    });
})
app.post('/article/:id', function (req, res) {
    const form = formidable();
    form.parse(req, function (err, fields, files) {
        pool.query('INSERT INTO commentaire (pseudo, message, dateMessage, idA) VALUES (?,?,NOW(),?)', [fields.pseudo, fields.message, req.params.id], function (error, result) {
            //console.log(err);
            res.redirect('/article/' + req.params.id);
        })
    })
})
app.get('/addArticle', function (req, res) {
    pool.query('SELECT * FROM categorie', function (error, categories, fields) {
        res.render('addArticle.ejs', {
            categories: categories
        });
    })
})
app.post('/addArticle', function (req, res) {
    //soumission du formulaire

    //upload de l'image
    const form = formidable();

    // parser les données qui sont issues du form
    form.parse(req, function (err, fields, files) {
        console.log(fields);
        console.log(files);
        //récupérer le chemin de l'image temporaire
        let oldpath = files.photo.filepath;
        let newpath = "public/img/" + files.photo.originalFilename;
        let pathBdd = files.photo.originalFilename
        fs.rename(oldpath, newpath, function (err) {
            if (err) throw err;
            pool.query('INSERT INTO article (titre, description, auteur, image, dateA, idU, idCateg) VALUES (?,?,?,?,?,1,?)', [fields.titre, fields.description, fields.auteur, pathBdd, fields.date, fields.categ], function (error, result) {
                console.log(err);
                res.redirect('/')
            })
        })
    })
})


app.listen(3005, function () {
    console.log('Serveur démarré sur le port 3005');
})