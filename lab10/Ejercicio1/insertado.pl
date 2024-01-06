#!/usr/bin/perl
use warnings;
use strict;
use DBI;

#Se establece la conexion con la base de datos
my $user = 'alumno';
my $password = 'pweb1';
my $dsn = "DBI:MariaDB:database=pweb1;host=192.168.8.102";
my $dbh = DBI->connect($dsn, $user, $password) or die("No se pudo conectar!");

#Se prepara la consulta SQL para insertar datos en la tabla actor 
my $sth = $dbh->prepare("INSERT INTO Actor(ActorID, Name) VALUES (?,?)");

#Se ejecuta la consulta con valores específos(ActorID y Name)
$sth->execute(5, "Speed Racer");

#Se finaliza la ejecucion de consulta
$sth->finish;

#Se desconecta la base de datos 
$dbh->disconnect;
