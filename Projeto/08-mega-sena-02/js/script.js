var state = { board: [], currenteGame: [], saveGames: [] };

function start() {
  readLocalStorage();
  creatBoard();
  newGame();
}

//Armazenamento local, no navegador
function readLocalStorage() {
  //verificar se tem local storae no navegador
  //se não tiver para a aplicação
  if (!window.localStorage) {
    return;
  }
  //cria a variavel para salvar dados
  var savedGamesFromLocalStorage = window.localStorage.getItem('saved-games');

  if (savedGamesFromLocalStorage) {
    state.saveGames = JSON.parse(savedGamesFromLocalStorage);
  }
  console.log(savedGamesFromLocalStorage);
}

//gravar dados no localstorage
function writeToLocalStorage() {
  window.localStorage.setItem('saved-games', JSON.stringify(state.saveGames));
}

function creatBoard() {
  state.board = [];
  for (var i = 0; i <= 60; i++) {
    state.board.push(i);
  }
}

function newGame() {
  resetGame();
  render();
}

function render() {
  renderBoard();
  renderButton();
  renderSavedGames();
}

function renderBoard() {
  var divBoard = document.querySelector('#megasena-board');
  divBoard.innerHTML = '';
  var ulNumbers = document.createElement('ul');
  ulNumbers.classList.add('numbers');

  for (var i = 0; i < state.board.length; i++) {
    var currenteNumer = state.board[i];
    var liNumber = document.createElement('li');

    liNumber.textContent = currenteNumer;
    liNumber.classList.add('number');
    liNumber.addEventListener('click', handleNumberClick);

    //deixar numero marcado apos seleção
    if (isNumberInGame(Number(currenteNumer))) {
      liNumber.classList.add('selected_number');
    }

    //fim marcação
    ulNumbers.appendChild(liNumber);
  }
  divBoard.appendChild(ulNumbers);
}

function handleNumberClick(event) {
  var value = Number(event.currentTarget.textContent);

  if (isNumberInGame(value)) {
    RemoveNumberFromGame(value);
  } else {
    addNumberToGame(value);
  }

  render();
}

function addNumberToGame(numberToAdd) {
  if (numberToAdd < 1 || numberToAdd > 60) {
    console.error('Numero inválido', numberToAdd);
    return;
  }

  if (state.currenteGame.length >= 6) {
    console.error('O Jogo esta competo');
    return;
  }
  if (isNumberInGame(numberToAdd)) {
    console.error('Este número já esta no jogo.', numberToAdd);
    return;
  }

  state.currenteGame.push(numberToAdd);
}

function RemoveNumberFromGame(numberToRemove) {
  if (numberToRemove < 1 || numberToRemove > 60) {
    console.error('Numero inválido', numberToRemove);
    return;
  }
  var newGame = [];

  for (var i = 0; i < state.currenteGame.length; i++) {
    var currenteNumer = state.currenteGame[i];

    if (currenteNumer === numberToRemove) {
      continue;
    }
    newGame.push(currenteNumer);
  }
  state.currenteGame = newGame;
}

function isNumberInGame(NumberTOCheck) {
  /*
  esse if é funciononal
  if (state.currenteGame.includes(NumberTOCheck)) {
    return true;
  }
  return false;
*/
  // essa forma é mais elegante e funciona
  return state.currenteGame.includes(NumberTOCheck);
}

function renderButton() {
  var divButtons = document.querySelector('#megasena-buttons');
  //Limpa campos
  divButtons.innerHTML = '';
  //Apresenta resultado no html
  //divButtons.textContent = 'teste';
  var buttonNewGame = createNewGameButton();
  //cria jogo aleatório
  var buttonRandomGame = createRandomGameButton();
  // salvar jogo
  var buttonSaveGame = createSaveGameButton();

  //Cria botano na tela html
  divButtons.appendChild(buttonNewGame);
  divButtons.appendChild(buttonRandomGame);
  divButtons.appendChild(buttonSaveGame);
}

function createRandomGameButton() {
  var button = document.createElement('button');
  button.textContent = 'Jogo Aleatório';

  //Cria novo jogo
  button.addEventListener('click', randomGame);

  return button;
}

function createNewGameButton() {
  var button = document.createElement('button');
  button.textContent = 'Novo jogo';

  //Cria novo jogo
  button.addEventListener('click', newGame);

  return button;
}

//Função que cria o botao para salavr jogo
function createSaveGameButton() {
  var button = document.createElement('button');
  button.textContent = 'Salvar Jogo';
  button.disabled = !isGamenComplete();

  //Cria novo jogo
  button.addEventListener('click', savaGame);

  return button;
}

// mostra josgos salvos na div megasena-saved-games
function renderSavedGames() {
  var dicSaveGames = document.querySelector('#megasena-saved-games');
  dicSaveGames.innerHTML = '';

  if (state.saveGames.length === 0) {
    dicSaveGames.innerHTML = '<p>Nenhum jogo Salvo</p>';
  } else {
    var ulSavedGames = document.createElement('ul');

    for (var i = 0; i < state.saveGames.length; i++) {
      var currenteGame = state.saveGames[i];

      var liGame = document.createElement('li');
      liGame.textContent = currenteGame.join(', ');

      ulSavedGames.appendChild(liGame);
    }
    dicSaveGames.appendChild(ulSavedGames);
  }
}

//função para salvar jogo
function savaGame() {
  if (!isGamenComplete()) {
    console.log('O Jogo não esta completo!!!');
    return;
  }
  state.saveGames.push(state.currenteGame);
  writeToLocalStorage();
  newGame();
}

function isGamenComplete() {
  return state.currenteGame.length === 6;
}

function resetGame() {
  state.currenteGame = [];
}

function randomGame() {
  //Zerar jogo
  resetGame();

  while (!isGamenComplete()) {
    //Gera numero aleatório entre zero e um
    // ceil arredonda para cima
    var randomNumber = Math.ceil(Math.random() * 60);
    addNumberToGame(randomNumber);
  }

  render();
}
start();
