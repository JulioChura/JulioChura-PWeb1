#!"C:\xampp\perl\bin\perl.exe"
use warnings;
use strict;
use DBI;
use CGI;

#Se establece la conexion con la base de datos
my $user = 'alumno';
my $password = 'pweb1';
my $dsn = "DBI:mysql:database=pweb1;host=192.168.8.104";
my $dbh = DBI->connect($dsn, $user, $password) or die("No se pudo conectar!");

#Se hace la salida en formato html

my $q = CGI->new;
print $q->header('text/html');

print<<BLOCK;
<!DOCTYPE html>
<html>
 <head>
 <meta charset="UTF-8">
 <link rel="stylesheet" type="text/css" href="../css/styles.css">
 <title>Resultados </title>
 </head>
<body class="fondo-resultados">
<h1>Películas en el año 1985</h1>
BLOCK

#Se hace la consulta