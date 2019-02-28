<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="WUC_CADASTRO.ascx.cs" Inherits="HubbleAcademico.UI.WUC.wuc_cadastro" %>

<asp:UpdatePanel runat="server">
    <ContentTemplate>
        <div class="modal fade modalCadastro" id="exampleModalCenter" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
            <div class="modal-dialog modal-lg" role="document">
                <div class="modal-content">
                    <div class="modal-header bg-light">
                        <h5 class="modal-title text-dark m-auto">Inscreva-se gratuitamente!</h5>
                    </div>
                    <div class="modal-body p-0">
                        <div class="container-fluid p-5">
                            <div class="form-row">

                                <div class="form-group col-md-6">
                                    <label for="txt_loginAcademico" class="lblCampo">Matrícula Q-Acadêmico</label>
                                    <asp:RequiredFieldValidator runat="server" ValidationGroup="vld_cadastro" ErrorMessage="Campo Obrigatório*" ControlToValidate="txt_loginAcademico" CssClass="text-danger"></asp:RequiredFieldValidator>
                                    <asp:TextBox runat="server" ID="txt_loginAcademico" CssClass="form-control inpt" MaxLength="13"></asp:TextBox>
                                </div>
                                <div class="form-group col-md-6">
                                    <label for="txt_senhaAcademico" class="lblCampo">Senha Q-Acadêmico</label>
                                    <asp:RequiredFieldValidator runat="server" ValidationGroup="vld_cadastro" ErrorMessage="Campo Obrigatório*" ControlToValidate="txt_senhaAcademico" CssClass="text-danger"></asp:RequiredFieldValidator>
                                    <asp:TextBox runat="server" ID="txt_senhaAcademico" TextMode="Password" CssClass="form-control inpt"></asp:TextBox>
                                </div>
                                <div class="form-group col-md-12">
                                    <label for="txt_email" class="lblCampo">Email</label>
                                    <asp:RequiredFieldValidator runat="server" ValidationGroup="vld_cadastro" ErrorMessage="Campo Obrigatório*" ControlToValidate="txt_email" CssClass="text-danger"></asp:RequiredFieldValidator>
                                    <asp:TextBox runat="server" TextMode="Email" ID="txt_email" CssClass="form-control inpt"></asp:TextBox>
                                </div>
                                <div class="form-group col-md-6">
                                    <label for="txt_senhaSistema" class="lblCampo">Crie uma senha</label>
                                    <asp:RequiredFieldValidator runat="server" ValidationGroup="vld_cadastro" ErrorMessage="Campo Obrigatório*" ControlToValidate="txt_senhaSistema" CssClass="text-danger"></asp:RequiredFieldValidator>
                                    <asp:TextBox runat="server" ID="txt_senhaSistema" TextMode="Password" CssClass="form-control inpt"></asp:TextBox>
                                </div>
                                <div class="form-group col-md-6">
                                    <label for="txt_confirmacaoSenha" class="lblCampo">Confirmar senha</label>
                                    <asp:RequiredFieldValidator runat="server" ValidationGroup="vld_cadastro" ErrorMessage="Campo Obrigatório*" ControlToValidate="txt_confirmacaoSenha" CssClass="text-danger"></asp:RequiredFieldValidator>
                                    <asp:CompareValidator runat="server" ID="cmpNumbers" ControlToValidate="txt_confirmacaoSenha" ControlToCompare="txt_senhaSistema" Operator="Equal" Type="String" ErrorMessage="Senhas não correspondem*" CssClass="text-danger" ValidationGroup="vld_cadastro" Display="Dynamic" />

                                    <asp:TextBox runat="server" ID="txt_confirmacaoSenha" TextMode="Password" CssClass="form-control inpt" ValidationGroup="vld_cadastro"></asp:TextBox>
                                </div>
                                <div class="form-group col-md-6">
                                    <label for="ddl_perguntaRec" class="lblCampo">Pergunta de segurança</label>
                                    <asp:CompareValidator runat="server" ID="CompareValidator1" ControlToValidate="ddl_perguntaRec" Operator="NotEqual" ValueToCompare="0" Type="Integer" ErrorMessage="Escolha uma pergunta*" CssClass="text-danger" ValidationGroup="vld_cadastro" Display="Dynamic" />
                                    <asp:DropDownList runat="server" ID="ddl_perguntaRec" CssClass="form-control inpt" AutoPostBack="false">
                                        <asp:ListItem Text="Selecione..." Selected="True" Value="0"></asp:ListItem>
                                        <asp:ListItem Text="Nome de seu animal de estimação" Value="1"></asp:ListItem>
                                        <asp:ListItem Text="Primeiro namorado(a)" Value="2"></asp:ListItem>
                                        <asp:ListItem Text="Amigo de infância " Value="3"></asp:ListItem>
                                        <asp:ListItem Text="Comida predileta" Value="4"></asp:ListItem>
                                    </asp:DropDownList>
                                </div>
                                <div class="form-group col-md-6">
                                    <label for="txt_respostaSecreta" class="lblCampo">Resposta secreta</label>
                                    <asp:RequiredFieldValidator runat="server" ValidationGroup="vld_cadastro" ErrorMessage="Campo Obrigatório*" ControlToValidate="txt_respostaSecreta" CssClass="text-danger"></asp:RequiredFieldValidator>
                                    <asp:TextBox runat="server" ID="txt_respostaSecreta" CssClass="form-control inpt"></asp:TextBox>
                                </div>

                            </div>
                        </div>
                        <div class="modal-footer bg-light">
                            <div class="container-fluid">
                                <div class="form-row">
                                    <div class="form-group col-md-4">
                                        <asp:CheckBox runat="server" ID="cb_isAceitoTermos" />
                                        <asp:Label runat="server" CssClass="text-dark" AssociatedControlID="cb_isAceitoTermos">Aceito os <a href="../../_pdf/TERMOS DE SERVIÇO.pdf" target="_blank">termos</a> de uso.</asp:Label>
                                    </div>
                                    <div class="form-group col-md-5">
                                        <asp:LinkButton runat="server" ID="linkBtn_cadastro" CssClass="btn btn-success btn-lg btn-block btn_fechar_modal" OnClick="linkBtn_Click" Text="Cadastrar"></asp:LinkButton>
                                    </div>
                                    <div class="form-group col-md-3">
                                        <button type="button" class="btn btn-danger btn-lg btn-block btn_fechar_modal" id="btn_sairModalCadastro" data-dismiss="modal" onclick="FecharFundoPreto();">Cancelar</button>
                                    </div>

                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </ContentTemplate>
</asp:UpdatePanel>


