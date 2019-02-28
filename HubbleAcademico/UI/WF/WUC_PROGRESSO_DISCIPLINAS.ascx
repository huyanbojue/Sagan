<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="WUC_PROGRESSO_DISCIPLINAS.ascx.cs" Inherits="HubbleAcademico.UI.WF.WUC_PROGRESSO_DISCIPLINAS" %>
<asp:UpdatePanel runat="server">
    <ContentTemplate>
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
    </ContentTemplate>
</asp:UpdatePanel>