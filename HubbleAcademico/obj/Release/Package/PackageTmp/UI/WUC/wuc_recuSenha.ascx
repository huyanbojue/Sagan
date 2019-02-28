<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="wuc_recuSenha.ascx.cs" Inherits="HubbleAcademico.UI.WUC.wuc_recuSenha" %>
<asp:UpdatePanel runat="server">
    <ContentTemplate>
        <div class="modal fade" id="modalRecuSenha" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
            <div class="modal-dialog modal-md" role="document">
                <div class="modal-content">
                    <div class="modal-header bg-light">
                        <h5 class="modal-title text-dark m-auto">Recuperação de senha</h5>
                    </div>
                    <div class="modal-body p-0">
                        <div class="container-fluid p-3">
                            <div class="form-row">
                                <div class="col-md-12">
                                    <asp:CompareValidator runat="server" ID="comp_confiSenha" CssClass="text-danger" ErrorMessage="Senhas não correspondem*" ControlToValidate="txt_confirmaNovaSenha" ControlToCompare="txt_novaSenha" Type="Integer" Operator="Equal" ValidationGroup="vld_novaSenha"></asp:CompareValidator>
                                </div>
                                <asp:Panel runat="server" ID="pnl_respostaSecreta" CssClass="w-100">
                                    <div class="form-group col-md-12">
                                        <label for="txt_respostaChave" class="lblCampo">Email cadastrado</label>
                                        <asp:RequiredFieldValidator runat="server" ID="RequiredFieldValidator1" CssClass="text-danger" ValidationGroup="vld_respostaChave" ControlToValidate="txt_email" ErrorMessage="Campo obrigatório*"></asp:RequiredFieldValidator>
                                        <asp:TextBox runat="server" ID="txt_email" CssClass="form-control inpt" TextMode="Email"></asp:TextBox>
                                    </div>
                                    <div class="form-group col-md-12">
                                        <label for="txt_respostaChave" class="lblCampo">Resposta secreta</label>
                                        <asp:RequiredFieldValidator runat="server" ID="req_respostaChave" CssClass="text-danger" ValidationGroup="vld_respostaChave" ControlToValidate="txt_respostaChave" ErrorMessage="Campo obrigatório*"></asp:RequiredFieldValidator>
                                        <asp:TextBox runat="server" ID="txt_respostaChave" CssClass="form-control inpt"></asp:TextBox>
                                    </div>
                                </asp:Panel>
                                <asp:Panel runat="server" ID="pnl_codigo" CssClass="w-100">
                                    <div class="form-group col-md-12">
                                        <label for="txt_respostaChave" class="lblCampo">Código</label>
                                        <asp:RequiredFieldValidator runat="server" ID="req_cod" ValidationGroup="vld_codigo" ControlToValidate="txt_codigo" ErrorMessage="Digite o código*"></asp:RequiredFieldValidator>
                                        <asp:TextBox runat="server" ID="txt_codigo" CssClass="form-control inpt"></asp:TextBox>
                                    </div>

                                </asp:Panel>
                                <asp:Panel runat="server" ID="pnl_novaSenha" CssClass="w-100">
                                    <div class="form-group col-md-12">
                                        <label for="txt_novaSenha" class="lblCampo">Nova senha</label>
                                        <asp:RequiredFieldValidator runat="server" ID="req_novaSenha" ValidationGroup="vld_novaSenha" ControlToValidate="txt_novaSenha" ErrorMessage="Digite uma nova senha*" CssClass="text-danger"></asp:RequiredFieldValidator>
                                        <asp:TextBox runat="server" ID="txt_novaSenha" CssClass="form-control inpt"></asp:TextBox>
                                    </div>
                                    <div class="form-group col-md-12">
                                        <label for="txt_novaSenha" class="lblCampo">Confirmar senha</label>
                                        <asp:RequiredFieldValidator runat="server" ValidationGroup="vld_novaSenha" ControlToValidate="txt_confirmaNovaSenha" ErrorMessage="Confirme a senha*" CssClass="text-danger"></asp:RequiredFieldValidator>
                                        <asp:TextBox runat="server" ID="txt_confirmaNovaSenha" CssClass="form-control inpt"></asp:TextBox>
                                    </div>
                                </asp:Panel>
                            </div>
                        </div>
                    </div>
                    <div class="modal-footer bg-light">
                        <div class="container-fluid">
                            <div class="form-row">
                                <div class="form-group col-md-3">
                                    <asp:UpdateProgress runat="server" ID="upProg_loadingRec">
                                        <ProgressTemplate>
                                            <img src="../../_img/loading2.gif" id="img_loadingRec" class="img-fluid w-50" />
                                        </ProgressTemplate>
                                    </asp:UpdateProgress>
                                </div>
                                <div class="form-group col-md-5">
                                    <asp:Button runat="server" ID="btn_respostaSecreta" CssClass="btn btn-md btn-block btn-success" Text="Recuperar senha" OnClick="Btn_respostaSecreta_click" ValidationGroup="vld_respostaChave" />
                                    <asp:Button runat="server" ID="btn_codigo" CssClass="btn btn-md btn-block btn-success" Text="Enviar" OnClick="Btn_codigo_click" ValidationGroup="vld_codigo" />
                                    <asp:Button runat="server" ID="btn_novaSenha" CssClass="btn btn-md btn-block btn-success" Text="Alterar senha" OnClick="Btn_novaSenha_click" ValidationGroup="vld_novaSenha" />
                                </div>
                                <div class="form-gourp col-md-4">
                                    <button type="button" class="btn btn-danger btn-md btn-block btn_fechar_modal" id="btn_sairModalrecSenha" data-dismiss="modal">Cancelar</button>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </ContentTemplate>
</asp:UpdatePanel>
