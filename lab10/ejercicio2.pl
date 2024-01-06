#!"C:\xampp\perl\bin\perl.exe"
use warnings;
use strict;
use DBI;

#Se establece la conexion con la base de datos
my $user = 'alumno';
my $password = 'pweb1';
my $dsn = "DBI:mysql:database=pweb1;host=192.168.8.102";
my $dbh = DBI->connect($dsn, $user, $password) or die("No se pudo conectar!");

