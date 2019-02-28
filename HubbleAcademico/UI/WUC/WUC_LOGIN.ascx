<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="WUC_LOGIN.ascx.cs" Inherits="HubbleAcademico.UI.WUC.WUC_LOGIN" %>
<%@ Register Src="~/UI/WUC/WUC_NAV.ascx" TagPrefix="uc1" TagName="WUC_NAV" %>
<%@ Register Src="~/UI/WUC/WUC_MENU_LATERAL.ascx" TagPrefix="uc1" TagName="WUC_MENU_LATERAL" %>
<%@ Register Src="~/UI/WUC/WUC_FOOTER.ascx" TagPrefix="uc1" TagName="WUC_FOOTER" %>
<%@ Register Src="~/UI/WUC/WUC_CADASTRO.ascx" TagPrefix="uc1" TagName="WUC_CADASTRO" %>
<%@ Register Src="~/UI/WUC/WUC_RECUPERACAO_SENHA.ascx" TagPrefix="uc1" TagName="WUC_RECUPERACAO_SENHA" %>



<asp:UpdatePanel runat="server">
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
                        <asp:Button runat="server" ID="bnt_logar" class="btn btn-success" Text="Acessar" OnClick="bnt_logar_Click" data-toggle="modal" data-target=".modal-loading" />
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
        <uc1:WUC_NAV runat="server" ID="WUC_NAV" />
        <div id="wrapper">
            <uc1:WUC_MENU_LATERAL runat="server" ID="WUC_MENU_LATERAL" />
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
        </div>
    
        <uc1:WUC_FOOTER runat="server" ID="WUC_FOOTER" />
        <uc1:WUC_CADASTRO runat="server" ID="WUC_CADASTRO" />
        <uc1:WUC_RECUPERACAO_SENHA runat="server" ID="WUC_RECUPERACAO_SENHA" />
    </ContentTemplate>
</asp:UpdatePanel>
