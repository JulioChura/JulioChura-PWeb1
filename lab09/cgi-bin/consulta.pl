#!"C:\xampp\perl\bin\perl.exe"
use strict;
use warnings;
use CGI;

#probando
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
 <meta charset="utf-8">
 <link rel="stylesheet" type="text/css" href="../css/styles.css">
 <title>Resultados </title>
 </head>
<body>
BLOCK

my %coincidencias;

#^(\d{3})? : para que calzen tres numeros
#(.+) :Busca cualquier palabra o frase

my $archivo = 'Programas_de_Universidades.csv';
open my $IN, '<', $archivo or die "<h1>No se pudo abrir el archivo: $!</h1>\n";

my $llave;
my $cadena;
my $line;
while ($line = <$IN>) {
    if ( $line =~ /^(\d{3})\|(.+)/ ) {
        $llave = $1;
        $cadena = $2;
    } if ( $cadena =~ /$name\|(.*)$periodo(\|.*){5}\|$departamento(\|.*){5}\|$denominacion(.*)/) {
        $coincidencias{$llave} = $cadena; 
    } 

}

foreach my $var ( %coincidencias) {
    print "<h1> $var </h1>\n"
}
print <<HTML;
</body>
</html>
HTML


