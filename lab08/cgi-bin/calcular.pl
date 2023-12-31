#!"C:\xampp\perl\bin\perl.exe"
use strict;
use warnings;
use CGI;

my $q = CGI->new;
print $q->header('text/html');
my $num1 = $q->param('cadena');
my $num2;
my $signo;

print<<BLOCK;
<!DOCTYPE html>
<html>
 <head>
 <meta charset="utf-8">
 <link rel="stylesheet" type="text/css" href="../css/styles.css">
 <title>Búsquedas bibliográficas de Programación Web 1 </title>
 </head>
<body>
BLOCK

#^: Coincide con el inicio de la cadena.
#\s*: Coincide con cero o más espacios en blanco.
#\(?: Coincide con un paréntesis abierto opcional.
#(\d+): Captura uno o más dígitos (el número).
#\)?: Coincide con un paréntesis cerrado opcional.
#\s*: Coincide con cero o más espacios en blanco al final de la cadena.
#$: Coincide con el final de la cadena.
#Vamos a verificar la presencia de parentesis y validar la entrada

if ($num1 =~ /^\s*\(?\s*(-?\d+)\s*\)?\s*([*+\/-])\s*\(?\s*(-?\d+)\s*\)?\s*/  ) {
    $num1 = $1;
    $signo = $2;
    $num2 = $3;
} else {
    print "<h1> Ingrese un valor valido!</h1>\n";
    print '<div class="enlace"><a href="../calculadora.html">Regresar</a></dive>';
    print "</body></html>"; 
    exit 1;
    
}

my $resultado;
if ($signo eq "+") {
    $resultado = $num1 + $num2;
} elsif ($signo eq "-" ) {
    $resultado = $num1 - $num2;
} elsif ($signo eq "*") {
    $resultado = $num1 * $num2;
} else {
    $resultado = $num1 / $num2;
}

print "<h1>El resultado es: $resultado</h1>\n";
print '<div class="enlace"><a href="../calculadora.html">Regresar</a></dive>';
print <<HTML;
</body>
</html>
HTML