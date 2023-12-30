#!"C:\xampp\perl\bin\perl.exe"
use strict;
use warnings;
use CGI;

my $q = CGI->new;
print $q->header('text/html');
my $num1 = $q->param('num1');
my $num2 = $q->param('num2');
my $signo = $q->param('signo');

print<<BLOCK;
<!DOCTYPE html>
<html>
 <head>
 <meta charset="utf-8">
 <link rel="stylesheet" type="text/css" href="../estilo.css">
 <title>Búsquedas bibliográficas de Programación Web 1 </title>
 </head>
<body>
BLOCK



#Vamos a verificar la presencia de parentesis y validar la entrada

if ($num1 =~ /^\s*\(?(\d+)\)?\s*$/  ) {
    $num1 = $1;
} else {
    print "<h1> Ingrese un valor valido!</h1>\n.$num1";
}

if ($num2 =~ / (\()?(\d)+(\))?/ ) {
    $num2 = $2;
} else {
    print "<h1> Ingrese un valor valido!</h1>\n";
}
print "<h1> Ingrese un valor valido! $num1 </h1>\n";
