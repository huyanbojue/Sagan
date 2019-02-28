<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="WUC_MENU_LATERAL.ascx.cs" Inherits="HubbleAcademico.UI.WUC.WUC_MENU_LATERAL" %>
<%@ Register Src="~/UI/WUC/WUC_DOACOES.ascx" TagPrefix="uc1" TagName="WUC_DOACOES" %>
<%@ Register Src="~/UI/WUC/WUC_FEEDBACK.ascx" TagPrefix="uc1" TagName="WUC_FEEDBACK" %>
<%@ Register Src="~/UI/WUC/WUC_SOBRE.ascx" TagPrefix="uc1" TagName="WUC_SOBRE" %>



<asp:UpdatePanel runat="server">
    <ContentTemplate>
        <ul class="sidebar navbar-nav" style="height:100%;q">
            <asp:Panel runat="server" ID="pnl_usuarioNaoLogado">

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
            </asp:Panel>
            <asp:Panel runat="server" ID="pnl_usuarioLogado">
                <li class="nav-item" onclick="InformacoesRelevantesVisivel()">
                    <a class="nav-link">
                        <i class="fas fa-atom" style="font-size: 20px"></i>
                        <span style="font-size: 15px;">Informações Relevantes</span>

                    </a>
                </li>
                <li class="nav-item itemDesenvolvedor" onclick="ProgressoMateriasVisivel()">
                    <a class="nav-link">
                        <i class="fas fa-flask" style="font-size: 20px"></i>
                        <span style="font-size: 15px;">Avanço nas Disciplinas</span></a>
                </li>
                <li class="nav-item" onclick="GraficosAreasConhecimentoVisivel()">
                    <a class="nav-link">
                        <i class="fas fa-flask" style="font-size: 20px"></i>
                        <span style="font-size: 15px;">Áreas do Conhecimento</span></a>
                </li>
                <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle" href="#" id="dd_Conta" data-toggle="dropdown">
                        <i class="fas fa-hand-holding-usd" style="font-size: 20px"></i>
                        <span style="font-size: 15px;">Minha Conta</span>
                    </a>
                    <div class="dropdown-menu" aria-labelledby="pagesDropdown">
                        <a class="dropdown-item">Alterar Login/Senha</a>
                    </div>
                </li>
                <li class="nav-item itemDesenvolvedor">
                    <a class="nav-link" data-toggle="modal" data-target="#modalSobreMe">
                        <i class="fas fa-flask" style="font-size: 20px"></i>
                        <span style="font-size: 15px;">Sair</span></a>
                </li>
            </asp:Panel>

        </ul>
        <uc1:WUC_DOACOES runat="server" ID="WUC_DOACOES" />
        <uc1:WUC_FEEDBACK runat="server" ID="WUC_FEEDBACK" />
        <uc1:WUC_SOBRE runat="server" ID="WUC_SOBRE" />
    </ContentTemplate>
</asp:UpdatePanel>
