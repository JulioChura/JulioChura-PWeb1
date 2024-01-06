#!/usr/bin/perl
use warnings;
use strict;
use DBI;

my $q = CGI->new;
print $q->header('text/html');


#Se establece la conexion con la base de datos
my $user = 'alumno';
my $password = 'pweb1';
my $dsn = "DBI:MariaDB:database=pweb1;host=192.168.8.102";
my $dbh = DBI->connect($dsn, $user, $password) or die("No se pudo conectar!");


print<<BLOCK;
<!DOCTYPE html>
<html>
 <head>
 <meta charset="UTF-8">
 <link rel="stylesheet" type="text/css" href="../css/styles.css">
 <title>Resultados </title>
 </head>
<body class="fondo-resultados">
BLOCK

#Se hace la consulta
my $id = 5;
my $sth = $dbh->prepare("SELECT * FROM Actor WHERE ActorId=?");
$sth->execute($id);
if (my @row =  $sth->fetchrow_array) {
	print "<h1>";
    print join(", ", @row);  # Imprimir los valores separados por coma
    print "</h1>\n";
} else {
    print "<p>No se encontraron resultados para el ActorID $id</p>\n";
}
print<<BLOCK;
</body>
</html>
BLOCK

$sth->finish;
$dbh->disconnect;
