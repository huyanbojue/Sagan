<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="WUC_GRAFICOS_AREAS_CONHECIMENTO.ascx.cs" Inherits="HubbleAcademico.UI.WF.WUC_GRAFICOS_AREAS_CONHECIMENTO" %>
<asp:UpdatePanel runat="server">
    <ContentTemplate>
        <div class="card mb-3">
            <div class="card-header">
                <i class="fas fa-user-graduate"></i>
                <label>Áreas do Conhecimento</label>
            </div>
            <div class="card-body">
                <div id="graficoPizza" style="height: 400px">
                </div>
            </div>
            <div class="card-footer small text-muted">
                Updated<asp:Literal runat="server" ID="Literal2"></asp:Literal>
            </div>
        </div>
    </ContentTemplate>
</asp:UpdatePanel>
