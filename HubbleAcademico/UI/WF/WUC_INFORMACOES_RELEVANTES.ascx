<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="WUC_INFORMACOES_RELEVANTES.ascx.cs" Inherits="HubbleAcademico.UI.WF.WUC_INFORMACOES_RELEVANTES" %>
<asp:updatepanel runat="server">
    <ContentTemplate>
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
    </ContentTemplate>
</asp:updatepanel>