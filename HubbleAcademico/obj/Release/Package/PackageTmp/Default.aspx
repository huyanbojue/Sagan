<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="HubbleAcademico.Graficos" %>

<%@ Register Src="~/UI/WUC/wuc_cadastro.ascx" TagPrefix="uc1" TagName="wuc_cadastro" %>
<%@ Register Src="~/UI/WUC/wuc_recuSenha.ascx" TagPrefix="uc1" TagName="wuc_recuSenha" %>
<%@ Register Src="~/UI/WUC/wuc_modalSobre.ascx" TagPrefix="uc1" TagName="wuc_modalSobre" %>
<%@ Register Src="~/UI/WUC/wuc_modalSugestoes.ascx" TagPrefix="uc1" TagName="wuc_modalSugestoes" %>
<%@ Register Src="~/UI/WUC/wuc_loading.ascx" TagPrefix="uc1" TagName="wuc_loading" %>
<%@ Register Src="~/UI/WUC/wuc_doacoes.ascx" TagPrefix="uc1" TagName="wuc_doacoes" %>


<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <title>InfoHelix - Home</title>
    <link rel="shortcut icon" type="image/png" href="favicon.ico" />
    <link href="https://fonts.googleapis.com/css?family=Nunito" rel="stylesheet" />
    <link href="_css/bootstrap.min.css" rel="stylesheet" />
    <link href="_css/all.min.css" rel="stylesheet" type="text/css" />
    <link href="_css/sb-admin.css" rel="stylesheet" />
    <link href="_css/fontawesome.min.css" rel="stylesheet" />
    <link href="_css/style.css" rel="stylesheet" />
    <link href="_css/toastr.min.css" rel="stylesheet" />
    <script src="_js/popper.js"></script>
    <script src="_js/jquery.min.js"></script>
    <script src="_js/bootstrap.min.js"></script>
    <script src="_js/toastr.min.js"></script>
    <script src="_js/sb-admin.min.js"></script>
    <script src="_js/script.js"></script>
    <script src="_js/highcharts.js"></script>
    <script src="_js/highcharts-3d.js"></script>
    <script src="_js/exporting.js"></script>
    <script src="_js/export-data.js"></script>

    <script type="text/javascript">
        function CarregarPizza(exatas, humanas) {
            Highcharts.chart('graficoPizza', {
                chart: {
                    type: 'pie',
                    options3d: {
                        enabled: true,
                        alpha: 45,
                        beta: 0
                    }
                },
                title: {
                    text: 'Áreas do conhecimento'
                },
                tooltip: {
                    pointFormat: '{series.name}: <b>{point.percentage:.1f}%</b>'
                },
                plotOptions: {
                    pie: {
                        allowPointSelect: true,
                        cursor: 'pointer',
                        depth: 35,
                        dataLabels: {
                            enabled: true,
                            format: '{point.name}'
                        }
                    }
                },
                series: [{
                    type: 'pie',
                    name: 'Browser share',
                    data: [
                        ['HUMANAS', humanas],
                        ['EXATAS', exatas]
                    ]
                }]
            });


        }

    </script>

</head>

<body id="bodyHome">
    <form runat="server" id="myform">
        <asp:ScriptManager runat="server" EnablePageMethods="true" ID="manager" AsyncPostBackTimeout="500"></asp:ScriptManager>
        <asp:UpdatePanel runat="server" ID="up_pnlLoading">
            <ContentTemplate>
                <header style="background-color: #212529;">
                    <asp:Panel runat="server" ID="pnl_login">
                        <div class="form-row justify-content-center justify-content-md-end pt-2 pb-2 mr-2">
                            <div class="col-12 col-sm-6 col-md-auto control-header">
                                <asp:TextBox runat="server" class="form-control inpt" ID="txt_usuario" placeholder="Email"></asp:TextBox>
                            </div>
                            <div class=" col-12 col-sm-6 col-md-auto control-header">
                                <asp:TextBox runat="server" TextMode="Password" ID="txt_senha" class="form-control inpt" placeholder="Senha"></asp:TextBox>
                            </div>
                            <div class="col-4 col-md-auto col-md-auto control-header">
                                <asp:Button runat="server" ID="bnt_logar" class="btn btn-success" Text="Acessar" OnClientClick="CarregarCuriosidade();" OnClick="bnt_logar_Click" data-toggle="modal" data-target=".modal-loading" />
                            </div>

                            <div class="col-4 col-md-auto control-header ">
                                <button type="button" class="btn btn-outline-secondary btnAbreModalCad" data-toggle="modal" data-target=".modalCadastro">Cadastre-se</button>
                            </div>
                            <div class="col-4 col-md-auto control-header dropdown">
                                <a class="nav-link dropdown-toggle" href="#" id="drop_esqueciSenha" role="button" data-toggle="dropdown" aria-haspopup="true">
                                    <i class="fas fa-question-circle fa-fw"></i>
                                </a>
                                <div class="dropdown-menu dropdown-menu-right" aria-labelledby="drop_esqueciSenha">
                                    <a runat="server" class="dropdown-item" id="lb_abreModalRec" data-toggle="modal" data-target="#modalRecuSenha">Esqueci minha senha</a>
                                </div>
                            </div>
                        </div>

                    </asp:Panel>
                </header>

                <nav class="navbar navbar-expand navbar-dark bg-dark static-top">
                    <a class="navbar-brand mr-1" href="index.html">
                        <img src="_img/logo.png" alt="Logo Sistema" width="200" />
                    </a>
                    <button class="btn btn-link btn-sm text-white order-1 order-sm-0" id="sidebarToggle" href="#">
                        <i class="fas fa-bars"></i>
                    </button>

                    <div class="d-none d-md-inline-block form-inline ml-auto mr-0 mr-md-3 my-2 my-md-0" style="opacity: 0;">
                        <div class="input-group">
                            <input type="text" class="form-control" placeholder="Search for..." aria-label="Search" aria-describedby="basic-addon2" />
                            <div class="input-group-append">
                                <button class="btn btn-primary" type="button">
                                    <i class="fas fa-search"></i>
                                </button>
                            </div>
                        </div>
                    </div>
                    <asp:Panel runat="server" ID="pnl_menus">
                        <ul class="navbar-nav ml-auto ml-md-0">
                            <li class="nav-item">
                                <span class="text-white">Seja bem-vindo,&nbsp<small class="text-success"><asp:Literal runat="server" ID="lit_bemVindo"></asp:Literal>&nbsp!</small></span>
                            </li>
                            <li class="nav-item dropdown no-arrow">
                                <a class="nav-link dropdown-toggle" href="#" id="userDropdown" role="button" data-toggle="dropdown" aria-haspopup="true">
                                    <i class="fas fa-user-circle fa-fw" style="font-size: 30px"></i>
                                </a>
                                <div class="dropdown-menu dropdown-menu-right" aria-labelledby="userDropdown">
                                    <a class="dropdown-item" href="#">Minha Conta</a>
                                    <div class="dropdown-divider"></div>
                                    <asp:Button runat="server" ID="btn_sair" CssClass="dropdown-item" Text="Sair" OnClick="Lb_sair_Click" />
                                </div>
                            </li>
                        </ul>

                    </asp:Panel>
                </nav>

                <div id="wrapper">

                    <ul class="sidebar navbar-nav">
                        <li class="nav-item active">
                            <a class="nav-link" href="#">
                                <i class="fas fa-home" style="font-size: 20px;"></i>
                                <span style="font-size: 15px;">Home</span>
                            </a>
                        </li>

                        <li class="nav-item" data-toggle="modal" data-target=".modalSugestoes">
                            <a class="nav-link">
                                <i class="fas fa-atom" style="font-size: 20px"></i>
                                <span style="font-size: 15px;">Feedbacks ?</span></a>
                        </li>
                        <li class="nav-item itemDesenvolvedor">
                            <a class="nav-link" data-toggle="modal" data-target="#modalSobreMe">
                                <i class="fas fa-flask" style="font-size: 20px"></i>
                                <span style="font-size: 15px;">Desenvolvedor</span></a>
                        </li>
                        <li class="nav-item dropdown">
                            <a class="nav-link dropdown-toggle" href="#" id="pagesDropdown" data-toggle="dropdown">
                                <i class="fas fa-hand-holding-usd" style="font-size: 20px"></i>
                                <span style="font-size: 15px;">Doações</span>
                            </a>
                            <div class="dropdown-menu" aria-labelledby="pagesDropdown">
                                <h6 class="dropdown-header p-2">Ajude a nos manter nos ar</h6>
                                <a class="dropdown-item p-2" data-toggle="modal" data-target="#modalDoacao">Transferência bancaria</a>
                            </div>
                        </li>
                    </ul>
                    <asp:Panel runat="server" ID="pnl_conteudoLivre">
                        <div class="container-fluid">
                            <div class="row">
                                <div class="card border-top-0 border-left-0 shadow">
                                    <img class="card-img-top rounded shadow" src="_img/imgCard.jpg" alt="Imagem tema cosmos" />
                                    <div class="card-body">
                                        <h3 class="card-title text-center">Sobre o InfoHelix</h3>
                                        <p class="card-text text-justify">
                                            O InfoHelix foi criado pelo aluno, do Instituto Federal do campus Cuibá Ocatyde Jorge da Silva, 
                                            Gabriel Bastos. Possui como principal objetivo ajudar os estudantes do campus no controle e melhor visualização de suas notas,
                                            faltas,etc. Fornecendo diversas informações e gráficos relevantes aos seus usuários. Veja abaixo algumas das funcionalidades.
                                        </p>
                                    </div>

                                </div>
                            </div>
                            <div class="card-group mt-2" style="margin-bottom: 10%;">
                                <div class="card m-2 shadow">
                                    <img class="card-img-top" src="_img/imgFaltas.jpg" alt="Imagem faltas" />
                                    <div class="card-body">
                                        <h5 class="card-title text-center">Faltas</h5>
                                        <p class="card-text text-justify">O InfoHelix apresentará a totalidade de suas faltas, bem como a quantidade ainda permitida com base em aulas já ministradas</p>
                                    </div>
                                </div>
                                <div class="card m-2 shadow">
                                    <img class="card-img-top" src="_img/imgAprovacao.jpeg" alt="Imagem progresso de notas" />
                                    <div class="card-body">
                                        <h5 class="card-title text-center">Progresso para a aprovação</h5>
                                        <p class="card-text text-justify">No InfoHelix você terá informações de quanto precisa para ser aprovado em determinada materia.</p>
                                    </div>
                                </div>
                                <div class="card m-2 shadow">
                                    <img class="card-img-top" src="_img/imgInfRelevantes.jpeg" alt="Imagem análise de desempenho" />
                                    <div class="card-body">
                                        <h5 class="card-title text-center">Análises de desempenho</h5>
                                        <p class="card-text text-justify">O sistema oferece gráficos de desempenho, para que se possa ter uma maior noção de sua evolução acadêmica</p>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </asp:Panel>
                    <asp:Panel runat="server" ID="pnl_conteudoInicial">
                        <div class="container-fluid">
                            <div id="content-wrapper">
                                <div class="card mb-3">
                                    <div class="card-header">
                                        <i class="fas fa-user-graduate"></i>
                                        <label>INFORMAÇÕES RELEVANTES</label>
                                    </div>
                                    <div class="card-body">
                                        <div class="row">
                                            <div class="col-xl-3 col-sm-6 mb-3">
                                                <div class="card text-white bg-primary o-hidden h-100">
                                                    <div class="card-body">
                                                        <div class="card-body-icon">
                                                            <i class="fas fa-fw fa-comments"></i>
                                                        </div>
                                                        <div class="text-center">Total de Faltas</div>
                                                        <h2 class="text-center text-white">
                                                            <asp:Literal runat="server" ID="lit_totalFaltas"></asp:Literal></h2>
                                                    </div>
                                                    <a class="card-footer text-white clearfix small z-1" href="#">
                                                        <span class="float-left">View Details</span>
                                                        <span class="float-right">
                                                            <i class="fas fa-angle-right"></i>
                                                        </span>
                                                    </a>
                                                </div>
                                            </div>
                                            <div class="col-xl-3 col-sm-6 mb-3">
                                                <div class="card text-white bg-danger o-hidden h-100">
                                                    <div class="card-body">
                                                        <div class="card-body-icon">
                                                            <i class="fas fa-fw fa-life-ring"></i>
                                                        </div>
                                                        <div class="text-center">Total Permitido</div>
                                                        <h2 class="text-center text-white">
                                                            <asp:Literal runat="server" ID="lit_totalPermitido"></asp:Literal></h2>
                                                    </div>
                                                    <a class="card-footer text-white clearfix small z-1" href="#">
                                                        <span class="float-left">View Details</span>
                                                        <span class="float-right">
                                                            <i class="fas fa-angle-right"></i>
                                                        </span>
                                                    </a>
                                                </div>
                                            </div>
                                            <div class="col-xl-3 col-sm-6 mb-3">
                                                <div class="card text-white bg-warning o-hidden h-100">
                                                    <div class="card-body">
                                                        <div class="card-body-icon">
                                                            <i class="fas fa-fw fa-list"></i>
                                                        </div>
                                                        <div class="text-center">Aulas Previstas</div>
                                                        <h2 class="text-center text-white">
                                                            <asp:Literal runat="server" ID="lit_aulasPrevistas"></asp:Literal></h2>
                                                    </div>
                                                    <a class="card-footer text-white clearfix small z-1" href="#">
                                                        <span class="float-left">View Details</span>
                                                        <span class="float-right">
                                                            <i class="fas fa-angle-right"></i>
                                                        </span>
                                                    </a>
                                                </div>
                                            </div>
                                            <div class="col-xl-3 col-sm-6 mb-3">
                                                <div class="card text-white bg-success o-hidden h-100">
                                                    <div class="card-body">
                                                        <div class="card-body-icon">
                                                            <i class="fas fa-fw fa-shopping-cart"></i>
                                                        </div>
                                                        <div class="text-center">Aulas Ministradas</div>
                                                        <h2 class="text-center text-white">
                                                            <asp:Literal runat="server" ID="lit_aulasMinistradas"></asp:Literal></h2>
                                                    </div>
                                                    <a class="card-footer text-white clearfix small z-1" href="#">
                                                        <span class="float-left">View Details</span>
                                                        <span class="float-right">
                                                            <i class="fas fa-angle-right"></i>
                                                        </span>
                                                    </a>
                                                </div>
                                            </div>

                                        </div>
                                    </div>
                                    <div class="card-footer small text-muted">
                                        Updated
                                    </div>
                                </div>

                                <div class="card mb-3">
                                    <div class="card-header">
                                        <i class="fas fa-user-graduate"></i>
                                        <label>PROGRESSO NAS MATERIAS</label>
                                    </div>
                                    <div class="card-body">
                                        <asp:Literal runat="server" ID="lit_conteudoProgresso"></asp:Literal>
                                    </div>
                                    <div class="card-footer small text-muted">
                                        Updated<asp:Literal runat="server" ID="lit_day"></asp:Literal>
                                    </div>
                                </div>


                                <div class="card mb-3">
                                    <div class="card-header">
                                        <i class="fas fa-user-graduate"></i>
                                        <label>PROGRESSO NAS MATERIAS</label>
                                    </div>
                                    <div class="card-body">
                                        <div id="graficoPizza" style="height: 400px">
                                        </div>
                                    </div>
                                    <div class="card-footer small text-muted">
                                        Updated<asp:Literal runat="server" ID="Literal2"></asp:Literal>
                                    </div>
                                </div>
                            </div>
                        </div>

                    </asp:Panel>
                </div>
                <uc1:wuc_cadastro runat="server" ID="wuc_cadastro" />
                <uc1:wuc_loading runat="server" ID="wuc_loading" />
                <uc1:wuc_modalSobre runat="server" ID="wuc_modalSobre" />
                <uc1:wuc_modalSugestoes runat="server" ID="wuc_modalSugestoes" />
                <uc1:wuc_doacoes runat="server" ID="wuc_doacoes" />
            </ContentTemplate>
        </asp:UpdatePanel>
        <footer class="sticky-footer">
            <div class="container my-auto">
                <div class="copyright text-center my-auto">
                    <span>Copyright © Hélix 2018</span>
                </div>
            </div>
        </footer>
        <uc1:wuc_recuSenha runat="server" ID="wuc_recuSenha" />

    </form>


</body>

</html>
