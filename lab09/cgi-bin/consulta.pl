#!"C:\xampp\perl\bin\perl.exe"
use strict;
use warnings;
use CGI;
use utf8;



my $q = CGI->new;
print $q->header('text/html');

my $name = $q->param("nombre") || "";
my $periodo = $q->param("periodo") || "";
my $departamento = $q->param("departamento") || ""; 
my $denominacion = $q->param("denominacion") || "";

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

my %coincidencias;


my $archivo = 'Programas_de_Universidades.csv';
open my $IN, '<', $archivo or die "<h1>No se pudo abrir el archivo: $!</h1>\n";

my $valor = 0;
my $llave;
my $cadena;
my $line;
while ($line = <$IN>) {
    if ( $line =~ /^(\d{3})\|(.+)/ ) {
        $cadena = $2;
    } if ( $cadena =~ /^$name?(\|.*){2}\|$periodo?(\|.*){5}\|$departamento?(\|.*){5}\|$denominacion?(.*)/) {
        $llave = $valor;
        $coincidencias{$llave} = $line;
        $valor = $valor + 1; 
    } 
    $cadena ="";
}
close $IN;

print "<ul>";
foreach my $var (values %coincidencias) {
    print "<li class='items'> $var </li><br>\n";
}
print "</ul>";
print <<HTML;
</body>
</html>
HTML


