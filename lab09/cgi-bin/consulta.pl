#!"C:\xampp\perl\bin\perl.exe"
use strict;
use warnings;
use CGI;
use utf8;
use Text::Unaccent;

my $q = CGI->new;
print $q->header('text/html');

# my $varSinAcento = unac_string("UTF-8", $cadena);
# Esa funcion quita acentos
my $name = unac_string("UTF-8", $q->param("nombre") || "");
my $periodo = unac_string("UTF-8", $q->param("periodo") || "");
my $departamento = unac_string("UTF-8", $q->param("departamento") || ""); 
my $denominacion = unac_string("UTF-8", $q->param("denominacion") || "");

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


my $archivo = 'Programas_de_Universidades.csv';
open my $IN, '<', $archivo or die "<h1>No se pudo abrir el archivo: $!</h1>\n";

my $valor = 0;
my $llave;
my $cadena;
my $line;
while ($line = <$IN>) {
    if ( $line =~ /^(\d{3})\|(.+)/ ) {
        $cadena = $2;
    } if ( $cadena =~ /$name?\|(.*)$periodo?(\|.*){5}\|$departamento?(\|.*){5}\|$denominacion?(.*)/) {
        $llave = $valor;
        $coincidencias{$llave} = $cadena;
        $valor = $valor + 1; 
    } 

}

foreach my $var ( %coincidencias) {
    print "<h1> $var </h1>\n"
}
print <<HTML;
</body>
</html>
HTML


