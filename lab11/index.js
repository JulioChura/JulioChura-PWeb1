//Vamos a capturar en input
const txtn1 = document.querySelector("#n1");
const txtn2 = document.querySelector("#n2");
const respuesta = document.querySelector("#resp");
const btnCalcular = document.getElementById("calcular");


// para controlar los eventos hacemos uso de addEventListener(evento, name_funcion)
btnCalcular.addEventListener("click", calcular);
function calcular() {
    const op1 = parseFloat(txtn1.value);
    const op2 = parseFloat(txtn2.value);
    let resp = op1+op2;
    respuesta.innerText = resp;
}
//Para controlar los clicks 