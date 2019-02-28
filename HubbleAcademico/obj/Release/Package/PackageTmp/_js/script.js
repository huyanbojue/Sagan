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
        contentType: "application/x-www-form-urlencoded;charset=UTF-8",
        success: function (resposta) {
            document.querySelector('.paragrafoCuriosidade').textContent = resposta[2];

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


