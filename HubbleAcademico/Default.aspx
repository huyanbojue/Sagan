<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="HubbleAcademico.Graficos" %>

<%@ Register Src="~/UI/WUC/WUC_LOGIN.ascx" TagPrefix="uc1" TagName="WUC_LOGIN" %>
<%@ Register Src="~/UI/WUC/WUC_FEEDBACK.ascx" TagPrefix="uc1" TagName="WUC_FEEDBACK" %>
<%@ Register Src="~/UI/WUC/WUC_DOACOES.ascx" TagPrefix="uc1" TagName="WUC_DOACOES" %>



<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <title>INFOHELIX - LOGIN</title>
    <link rel="shortcut icon" type="image/png" href="favicon.ico" />
    <link href="https://fonts.googleapis.com/css?family=Nunito" rel="stylesheet" />
    <link href="_css/bootstrap.min.css" rel="stylesheet" />
    <link href="_css/all.min.css" rel="stylesheet" type="text/css" />
    <link href="_css/sb-admin.css" rel="stylesheet" />
    <link href="_css/fontawesome.min.css" rel="stylesheet" />
    <link href="_css/style.css" rel="stylesheet" />
    <link href="_css/toastr.min.css" rel="stylesheet" />

    <script src="_js/popper.js"></script>
    <script src="_js/jquery.min.js"></script>
    <script src="_js/bootstrap.min.js"></script>
    <script src="_js/toastr.min.js"></script>
    <script src="_js/sb-admin.min.js"></script>
    <script src="_js/script.js"></script>
    <script src="_js/highcharts.js"></script>
    <script src="_js/highcharts-3d.js"></script>
    <script src="_js/exporting.js"></script>
    <script src="_js/export-data.js"></script>
  
</head>
<body id="bodyHome">
    <form runat="server" id="myform">
        <asp:ScriptManager runat="server" EnablePageMethods="true" ID="manager" AsyncPostBackTimeout="500"></asp:ScriptManager>
        <asp:UpdateProgress runat="server">
            <ProgressTemplate>
                <div class="modal fade modal-loading" tabindex="-1" role="dialog" aria-labelledby="mySmallModalLabel" aria-hidden="true">
                    <div class="modal-dialog modal-sm">
                        <div class="modal-header bg-white w-100">
                            <h5 class="modal-title text-dark text-center">Carregando...</h5>
                        </div>
                        <div class="modal-content">
                            <img src="_img/loading.gif" class="w-100 m-auto pb-3 rounded" />
                            <div class="curiosidade p-3">
                                <p class="text-center">VOCÊ SABIA ?</p>
                                <p class="text-justify paragrafoCuriosidade"></p>
                            </div>
                        </div>
                    </div>
                </div>
            </ProgressTemplate>
        </asp:UpdateProgress>
        <uc1:WUC_LOGIN runat="server" ID="WUC_LOGIN" />
     
    </form>
  
</body>
</html>
