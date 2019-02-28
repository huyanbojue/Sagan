<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="wuc_modalSugestoes.ascx.cs" Inherits="HubbleAcademico.UI.WUC.wuc_modalSugestoes" %>

<div class="modal fade modalSugestoes" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-md">
    
        <div class="modal-content">
            <div class="modal-header bg-light">
                <h5 class="modal-title m-auto">Reclamações ou Sugestões</h5>

            </div>
            <div class="modal-body m-auto">
                <div class="container-fluid">
                    <div class="form-row">
                        <div class="form-group col-md-6">
                            <label for="txt_nomeContato" class="lblCampo">Nome</label>
                            <asp:RequiredFieldValidator runat="server" ControlToValidate="txt_nomeContato" ErrorMessage="Campo obrigatório*" CssClass="text-danger" ValidationGroup="vld_sugestoes"></asp:RequiredFieldValidator>
                            <asp:TextBox runat="server" ID="txt_nomeContato" CssClass="form-control txtSugestao"></asp:TextBox>
                        </div>
                        <div class="form-group col-md-6">
                            <label for="txt_emailFeed" class="lblCampo">Email</label>
                            <asp:RequiredFieldValidator runat="server" ControlToValidate="txt_emailFeed" ErrorMessage="Campo obrigatório*" CssClass="text-danger" ValidationGroup="vld_sugestoes"></asp:RequiredFieldValidator>
                            <asp:TextBox runat="server" ID="txt_emailFeed" CssClass="form-control txtSugestao" TextMode="Email"></asp:TextBox>
                        </div>
                        <div class="form-group col-md-12">
                            <label for="txt_sugestao" class="lblCampo">Mensagem</label>
                            <asp:RequiredFieldValidator runat="server" ControlToValidate="txt_sugestao" ErrorMessage="Campo obrigatório*" CssClass="text-danger" ValidationGroup="vld_sugestoes"></asp:RequiredFieldValidator>
                            <asp:TextBox runat="server" ID="txt_sugestao" CssClass="form-control txtSugestao" TextMode="MultiLine" Rows="5"></asp:TextBox>
                        </div>
                    </div>

                </div>
                <div class="modal-footer bg-light">
                    <div class="container-fluid">
                        <div class="form-row">
                        
                            <div class="form-group col-md-8">
                                <asp:Button runat="server" ID="btn_cadastrar" CssClass="btn btn-success btn-lg btn-block" Text="Enviar" OnClientClick="CarregarCuriosidade();" data-toggle="modal" data-target=".modal-loading" ValidationGroup="vld_sugestoes" />
                            </div>
                            <div class="form-group col-md-4">
                                <button type="button" class="btn btn-danger btn-lg btn-block btn_fechar_modal" id="btn_sairModalSugestao" data-dismiss="modal" onclick="FecharFundoPreto();">Cancelar</button>
                            </div>
                        </div>
                    </div>
                </div>

            </div>
           
        </div>
    </div>
</div>
