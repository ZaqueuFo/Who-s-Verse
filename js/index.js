var imagem = document.querySelectorAll(".doutor");
var posicao = 0;

function esconder() {
    for(var i = 0; i < imagem.length; i++) {
        imagem[i].classList.remove('on');
    }
}

function mostrar() {
   imagem[posicao].classList.add('on');
}

function voltar() {
    esconder();
    if(posicao === 0) {
        posicao = imagem.length - 1;
    } else {
        posicao--;
    }
    mostrar();
}

function avancar() {
    esconder()
    if(posicao = imagem.length - 1) {
        posicao = 0
    } else {
        posicao++
    }
    mostrar();
}

