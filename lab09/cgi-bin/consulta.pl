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

my %coincidencias;
my $fraseBusqueda = join('',$name, $periodo, $departamento, $denominacion);


#^(\d{3})? : para que calzen tres numeros
#(.+) :Busca cualquier palabra o frase
while (my $line = <IN>) {
    if ( $line =~ /^(\d{3})|(.+)/ ) {
        $coincidencias{$1} = $2;
    } if ( $coincidencias{$1} =~ /$name\|(.*)$periodo(\|.*){5}\| /) {

    }

}

#if (!($name eq "") && !($periodo eq "") && !($departamento eq "") && !($denominacion eq "") ) {
#   open(IN, "Programas_de_Universidad.txt") or die "<h1>ERROR: open file</h1>\n";
#   } else {
#   print "<h1>Llene todos los campos!</h1>"
#}

