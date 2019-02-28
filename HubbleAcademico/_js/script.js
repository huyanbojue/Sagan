function FecharModal() {
    var element = document.getElementById('bodyHome');
    element.classList.remove("modal-open");
    var node = document.querySelectorAll('.modal-backdrop');

    for (i = 0; i <= node.length; i++) {
        if (node[i].parentNode) {
            node[i].parentNode.removeChild(node[i]);
        }
    }
}
function FecharFundoPreto() {
    var node = document.querySelector('.modal-backdrop');
    if (node.parentNode) {
        node.parentNode.removeChild(node);
    }
    var element = document.getElementById('bodyHome');
    element.classList.remove("modal-open");
}

function AbrirModalRecSenha() {
    $('#drop_esqueciSenha').click();
    $('#lb_abreModalRec').click();
}
function CarregarCuriosidade() {
    $.ajax({
        url: "http://localhost:64671/_api/curiosidades/curiosidades.json",
        dataType: 'json',
        contentType: "application/charset=UTF-8",
        success: function (resposta) {
            $('.paragrafoCuriosidade').text = resposta.curiosidade[2];

        },
        error: function (erro) {
            console.log("Erro => " + erro.messsage);
        }
    });
}
function Alertar(tipo, header, msg) {
    toastr[tipo](msg, header);

    toastr.options = {
        "closeButton": true,
        "debug": false,
        "newestOnTop": false,
        "progressBar": false,
        "positionClass": "toast-top-right",
        "preventDuplicates": false,
        "onclick": null,
        "showDuration": "400",
        "hideDuration": "2000",
        "timeOut": "5000",
        "extendedTimeOut": "1000",
        "showEasing": "swing",
        "hideEasing": "linear",
        "showMethod": "fadeIn",
        "hideMethod": "fadeOut"
    };
}

function InformacoesRelevantesVisivel() {
    $('#WUC_INFORMACOES_RELEVANTES').display('block');
    $('#WUC_PROGRESSO_DISCIPLINAS').display('none');
    $('#WUC_GRAFICOS_AREAS_CONHECIMENTO').display('none');
}

function ProgressoMateriasVisivel() {
    $('#WUC_INFORMACOES_RELEVANTES').display('none');
    $('#WUC_PROGRESSO_DISCIPLINAS').display('blobk');
    $('#WUC_GRAFICOS_AREAS_CONHECIMENTO').display('none');
}
function GraficosAreasConhecimentoVisivel() {
    $('#WUC_INFORMACOES_RELEVANTES').display('none');
    $('#WUC_PROGRESSO_DISCIPLINAS').display('none');
    $('#WUC_GRAFICOS_AREAS_CONHECIMENTO').display('block');
}

//function ValidarCheck() {
//    cb = document.querySelector('#WUC_LOGIN_WUC_CADASTRO_cb_isAceitoTermos');
//    if (cb.checked === false) {
//        return confirm("É necessário aceitar os termos de uso!");
//    }
//}
function Carregando() {
    btnImg = document.querySelector('#WUC_LOGIN_WUC_CADASTRO_imgBtn_Cadastro');
    btnImg.src = "../../_img/carregando.gif";
}
$(document).ajaxStart($.blockUI).ajaxStop($.unblockUI);


