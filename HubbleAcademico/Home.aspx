<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Home.aspx.cs" Inherits="HubbleAcademico.Home" %>

<%@ Register Src="~/UI/WUC/WUC_NAV.ascx" TagPrefix="uc1" TagName="WUC_NAV" %>
<%@ Register Src="~/UI/WUC/WUC_MENU_LATERAL.ascx" TagPrefix="uc1" TagName="WUC_MENU_LATERAL" %>
<%@ Register Src="~/UI/WF/WUC_INFORMACOES_RELEVANTES.ascx" TagPrefix="uc1" TagName="WUC_INFORMACOES_RELEVANTES" %>
<%@ Register Src="~/UI/WF/WUC_PROGRESSO_DISCIPLINAS.ascx" TagPrefix="uc1" TagName="WUC_PROGRESSO_DISCIPLINAS" %>
<%@ Register Src="~/UI/WF/WUC_GRAFICOS_AREAS_CONHECIMENTO.ascx" TagPrefix="uc1" TagName="WUC_GRAFICOS_AREAS_CONHECIMENTO" %>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>INFOHELIX - HOME</title>
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
    <script type="text/javascript">
        function CarregarPizza(exatas, humanas) {
            Highcharts.chart('graficoPizza', {
                chart: {
                    type: 'pie',
                    options3d: {
                        enabled: true,
                        alpha: 45,
                        beta: 0
                    }
                },
                title: {
                    text: 'Áreas do conhecimento'
                },
                tooltip: {
                    pointFormat: '{series.name}: <b>{point.percentage:.1f}%</b>'
                },
                plotOptions: {
                    pie: {
                        allowPointSelect: true,
                        cursor: 'pointer',
                        depth: 35,
                        dataLabels: {
                            enabled: true,
                            format: '{point.name}'
                        }
                    }
                },
                series: [{
                    type: 'pie',
                    name: 'Browser share',
                    data: [
                        ['HUMANAS', humanas],
                        ['EXATAS', exatas]
                    ]
                }]
            });
        }
    </script>
</head>
<body>
    <form id="form1" runat="server">
        <asp:ScriptManager runat="server"></asp:ScriptManager>
        <uc1:WUC_NAV runat="server" ID="WUC_NAV" />
        <uc1:WUC_MENU_LATERAL runat="server" ID="WUC_MENU_LATERAL" />
        <div class="container-fluid">
            <div id="content-wrapper">
                <uc1:WUC_INFORMACOES_RELEVANTES runat="server" ID="WUC_INFORMACOES_RELEVANTES" />
                <uc1:WUC_PROGRESSO_DISCIPLINAS runat="server" ID="WUC_PROGRESSO_DISCIPLINAS" />
                <uc1:WUC_GRAFICOS_AREAS_CONHECIMENTO runat="server" ID="WUC_GRAFICOS_AREAS_CONHECIMENTO" />
            </div>
        </div>
    </form>
</body>
</html>
