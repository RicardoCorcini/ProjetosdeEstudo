function start() {
  var buttonCalcularIMC = document.querySelector('#button-calculete-imc');
  buttonCalcularIMC.addEventListener('click', handleButtonClick);

  var inputWeight = document.querySelector('#input-weight');
  var inputHeight = document.querySelector('#input-height');

  inputHeight.addEventListener('input', handleButtonClick);
  inputWeight.addEventListener('input', handleButtonClick);

  handleButtonClick();
}

function calculateImc(peso, altura) {
  return peso / (altura * altura);
}

function handleButtonClick() {
  var inputWeight = document.querySelector('#input-weight');
  var inputHeight = document.querySelector('#input-height');
  var imcResult = document.querySelector('#imc-result');
  var imcObesidade = document.querySelector('#imc-obesidade');

  var peso = Number(inputWeight.value);
  var altura = Number(inputHeight.value);

  var imc = calculateImc(peso, altura);
  var obesidade = imc;
  var formataIMC = imc.toFixed(2).replace('.', ',');
  var informacao = 'teste';
  obesidade = Number(obesidade);

  if (obesidade >= 16 && obesidade < 17) {
    informacao = 'Muito abaixo do peso';
    console.log(informacao);
  } else if (obesidade >= 17 && obesidade < 18.5) {
    informacao = 'Abaixo do peso';
    console.log(informacao);
  } else if (obesidade >= 18.5 && obesidade < 25) {
    informacao = 'peso normal';
    console.log(informacao);
  } else if (obesidade >= 25 && obesidade < 30) {
    informacao = 'Acima do peso';
    console.log(informacao);
  } else if (obesidade >= 30 && obesidade < 35) {
    informacao = 'Obesidade grau I';
    console.log(informacao);
  } else if (obesidade >= 35 && obesidade < 40) {
    informacao = 'Obesidade grau II';
    console.log(informacao);
  } else if (obesidade >= 40) {
    informacao = 'Obesidade grau III';
    console.log(informacao);
  } else {
    informacao = 'Valor inválido';
    console.log(informacao);
  }
  imcResult.textContent = formataIMC;
  imcObesidade.textContent = informacao;
}

start();
