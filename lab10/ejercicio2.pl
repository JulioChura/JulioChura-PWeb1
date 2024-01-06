#!"C:\xampp\perl\bin\perl.exe"
use warnings;
use strict;
use DBI;
use CGI;
#Se establece la conexion con la base de datos
my $user = 'alumno';
my $password = 'pweb1';
my $dsn = "DBI:mysql:database=pweb1;host=192.168.8.102";
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
my $year = 1985;
my $sth = $dbh->prepare("SELECT * FROM  Movie WHERE Year=?");
$sth->execute($year);
if (my @row =  $sth->fetchrow_array) {
	print "<h1>";
    print join(", ", @row);  # Imprimir los valores separados por coma
    print "</h1>\n";
} else {
    print "<p>No se encontraron resultados</p>\n";
}
print<<BLOCK;
</body>
</html>
BLOCK

$sth->finish;
$dbh->disconnect;
