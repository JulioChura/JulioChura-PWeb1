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
my $year = $q->param('year');
print $q->header('text/html');


print<<BLOCK;
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link rel="stylesheet" href="../../css/styles.css">
</head>
<body class="fondoPrincipal">
    
    <form action="buscarPelicula.pl">
        <h1 class="cabecera">
            Buscador de pelicula
        </h1>
        <div class="formulario">
            <input type="text" class="campoLlenar" placeholder="$year" readonly>
            <a href="../index.html" class='enviar'>Limpiar</a>
        </div>
    </form>
BLOCK

#Se hace la consulta
my $sth = $dbh->prepare("SELECT * FROM  Movie WHERE Year > ?");
$sth->execute($year );

print<<BLOCK;
        <br><br>
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