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

#Se hace la consulta
my $id = 5;
my $sth = $dbh->prepare(SELECT*FROM Actor WHERE ActorId=?");
$sthe 

print<<BLOCK;


