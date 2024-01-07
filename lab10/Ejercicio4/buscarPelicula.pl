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
<h1>Películas mejor rankeadas</h1>
BLOCK

#Se hace la consulta
my $score = 7;
my $votes = 5000;
my $sth = $dbh->prepare("SELECT * FROM  Movie WHERE Score > ? and Votes > ?");
$sth->execute($score, $votes );

print<<BLOCK;
        <table>
            <tr>
                <th>MovieID</th>
                <th>Title</th>
                <th>Year</th>
                <th>Score</th>
                <th>Votes</th>
            </tr>
BLOCK

while (my @row =  $sth->fetchrow_array) {
    print<<BLOCK;      
    <tr>
        <td>$row[0]</td>
        <td>$row[1]</td>
        <td>$row[2]</td>
        <td>$row[3]</td>
        <td>$row[4]</td>
    </tr>
BLOCK
}

print "</table>\n";

print<<BLOCK;
</body>
</html>
BLOCK

$sth->finish;
$dbh->disconnect;