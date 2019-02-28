<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="wuc_loading.ascx.cs" Inherits="HubbleAcademico.UI.WUC.wuc_loading" %>
<asp:UpdatePanel runat="server">
    <ContentTemplate>
        <asp:UpdateProgress runat="server">
            <ProgressTemplate>
                <div class="modal fade modal-loading" tabindex="-1" role="dialog" aria-labelledby="mySmallModalLabel" aria-hidden="true">
                    <div class="modal-dialog modal-sm">
                     <%--   <button type="button" class="close" id="btn_sairModalLoading" data-dismiss="modal" aria-label="Close" style="opacity: 0;">
                            <span aria-hidden="true">&times;</span>
                        </button>--%>
                        <div class="modal-header bg-white w-100">
                            <h5 class="modal-title text-dark text-center">Carregando...</h5>
                        </div>
                        <div class="modal-content">
                            <img src="_img/loading.gif" class="w-100 m-auto pb-3 rounded border-bottom" />
                            <div class="curiosidade p-3">
                                <p class="text-center">VOCÊ SABIA ?</p>
                                <p class="text-justify paragrafoCuriosidade"></p>
                            </div>
                        </div>
                    </div>
                </div>
            </ProgressTemplate>
        </asp:UpdateProgress>

    </ContentTemplate>
</asp:UpdatePanel>

