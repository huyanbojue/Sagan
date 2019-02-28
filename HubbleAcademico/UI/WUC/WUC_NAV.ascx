<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="WUC_NAV.ascx.cs" Inherits="HubbleAcademico.UI.WUC.WUC_HEADER" %>
<asp:UpdatePanel runat="server">
    <ContentTemplate>
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
                </ul>
            </asp:Panel>
        </nav>
    </ContentTemplate>
</asp:UpdatePanel>