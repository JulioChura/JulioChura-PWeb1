#!"C:\xampp\perl\bin\perl.exe"
use strict;
use warnings;
use CGI;

my $q = CGI->new;
print $q->header('text/html');

my $name = $q->param("nombre");
my $periodo = $q->param("periodo");
my $departamento = $q->param("departamento");
my $denominacion = $q->param("denominacion");

print<<BLOCK;
<!DOCTYPE html>
<html>
 <head>
 <meta charset="utf-8">
 <link rel="stylesheet" type="text/css" href="../css/styles.css">
 <title>Resultados </title>
 </head>
<body>
BLOCK

if (!($name eq "") && !($periodo eq "") && !($departamento eq "") && !($denominacion eq "") ) {

} else {
    print "<h1>Llene todos los campos!</h1>"
}

