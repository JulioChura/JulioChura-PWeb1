var resultado = "capucchino"
function cafetera(ing1) {
    if (ing1=="leche") {
        console.log(resultado);
        return resultado;
    } else {
        console.log("Incorrecto");
    }
}

cafetera("leche");