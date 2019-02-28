<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Teste.aspx.cs" Inherits="HubbleAcademico.Teste" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title></title>
    <link href="_css/bootstrap.min.css" rel="stylesheet" />
    <link href="_css/all.min.css" rel="stylesheet" type="text/css" />
    <link href="_css/dataTables.bootstrap4.css" rel="stylesheet" />
    <link href="_css/sb-admin.css" rel="stylesheet" />
    <link href="_css/fontawesome.min.css" rel="stylesheet" />
    <link rel="shortcut icon" type="image/png" href="favicon.ico" />
    <link href="https://fonts.googleapis.com/css?family=Nunito" rel="stylesheet" />
    <link href="_css/styleHome.css" rel="stylesheet" />
    <link href="_css/toastr.min.css" rel="stylesheet" />
</head>
<body>
    <form id="form1" runat="server">
        <asp:ScriptManager runat="server"></asp:ScriptManager>
        <asp:UpdatePanel runat="server">
            <ContentTemplate>
                <div id="container" style="min-width: 310px; height: 400px; margin: 0 auto"></div>
                <asp:Button runat="server" ID="btn" OnClick="btn_click" />

                <button type="button" class="btn btn-primary btn_abreModalLoading" data-toggle="modal" data-target=".bd-example-modal-sm">Small modal</button>
                <asp:UpdateProgress ID="UpdateProgress1" runat="server">
                    <ProgressTemplate>
                        <div class="modal fade bd-example-modal-sm" tabindex="-1" role="dialog" aria-labelledby="mySmallModalLabel" aria-hidden="true">
                            <div class="modal-dialog modal-sm">
                                <h2 class="modal-title text-white">Loading...</h2>

                                <div class="modal-content p-2 bg-dark">
                                    <div class="container">
                                        <div class="row">
                                        <div class="col">
                                            <img src="_img/loading.gif" width="200" class="img-fluid rounded-circle m-auto" />
                                            </di>
                                        </div>
                                    </div>
                                    <small class="text-white text-center">"A paciência é a fortaleza do débil e a impaciência a debilidade do forte."</small>
                                </div>
                            </div>
                        </div>
                    </ProgressTemplate>
                </asp:UpdateProgress>
            </ContentTemplate>
        </asp:UpdatePanel>
        <asp:Repeater runat="server" ID="rpt" OnItemDataBound="Bound">
            <ItemTemplate>
                <asp:Literal runat="server" ID="litTeste"></asp:Literal>
            </ItemTemplate>
        </asp:Repeater>
    </form>
</body>

<script src="_js/highcharts.js"></script>
<script src="_js/data.js"></script>
<script src="_js/drilldown.js"></script>
<script src="_js/jquery.min.js"></script>
<script>
    document.querySelector('btn_abreModalLoading').click();
           function SairModal() {
            $('##container').click();
        }
</script>
<script src="_js/popper.js"></script>
<script src="_js/jquery.min.js"></script>
<script src="_js/bootstrap.bundle.min.js"></script>
<script src="_js/bootstrap.min.js"></script>
<script type="text/javascript">
    function Dados(portugues, matematica) {
        Highcharts.chart('container', {
            chart: {
                type: 'column'
            },
            title: {
                text: 'Browser market shares. January, 2018'
            },
            subtitle: {
                text: 'Click the columns to view versions. Source: <a href="http://statcounter.com" target="_blank">statcounter.com</a>'
            },
            xAxis: {
                type: 'category'
            },
            yAxis: {
                title: {
                    text: 'Total percent market share'
                }

            },
            legend: {
                enabled: false
            },
            plotOptions: {
                series: {
                    borderWidth: 0,
                    dataLabels: {
                        enabled: true,
                        format: '{point.y:.1f}%'
                    }
                }
            },

            tooltip: {
                headerFormat: '<span style="font-size:11px">{series.name}</span><br>',
                pointFormat: '<span style="color:{point.color}">{point.name}</span>: <b>{point.y:.2f}%</b> of total<br/>'
            },

            "series": [
                {
                    "name": "Browsers",
                    "colorByPoint": true,
                    "data": [
                        {
                            "name": "Chrome",
                            "y": portugues,
                            "drilldown": "Chrome"
                        },
                        {
                            "name": "Firefox",
                            "y": matematica,
                            "drilldown": "Firefox"
                        },
                        {
                            "name": "Internet Explorer",
                            "y": 7.23,
                            "drilldown": "Internet Explorer"
                        },
                        {
                            "name": "Safari",
                            "y": 5.58,
                            "drilldown": "Safari"
                        },
                        {
                            "name": "Edge",
                            "y": 4.02,
                            "drilldown": "Edge"
                        },
                        {
                            "name": "Opera",
                            "y": 1.92,
                            "drilldown": "Opera"
                        },
                        {
                            "name": "Other",
                            "y": 7.62,
                            "drilldown": null
                        }
                    ]
                }
            ],
            "drilldown": {
                "series": [
                    {
                        "name": "Chrome",
                        "id": "Chrome",
                        "data": [
                            [
                                "v65.0",
                                0.1
                            ],
                            [
                                "v64.0",
                                1.3
                            ],
                            [
                                "v63.0",
                                53.02
                            ],
                            [
                                "v62.0",
                                1.4
                            ],
                            [
                                "v61.0",
                                0.88
                            ],
                            [
                                "v60.0",
                                0.56
                            ],
                            [
                                "v59.0",
                                0.45
                            ],
                            [
                                "v58.0",
                                0.49
                            ],
                            [
                                "v57.0",
                                0.32
                            ],
                            [
                                "v56.0",
                                0.29
                            ],
                            [
                                "v55.0",
                                0.79
                            ],
                            [
                                "v54.0",
                                0.18
                            ],
                            [
                                "v51.0",
                                0.13
                            ],
                            [
                                "v49.0",
                                2.16
                            ],
                            [
                                "v48.0",
                                0.13
                            ],
                            [
                                "v47.0",
                                0.11
                            ],
                            [
                                "v43.0",
                                0.17
                            ],
                            [
                                "v29.0",
                                0.26
                            ]
                        ]
                    },
                    {
                        "name": "Firefox",
                        "id": "Firefox",
                        "data": [
                            [
                                "v58.0",
                                1.02
                            ],
                            [
                                "v57.0",
                                7.36
                            ],
                            [
                                "v56.0",
                                0.35
                            ],
                            [
                                "v55.0",
                                0.11
                            ],
                            [
                                "v54.0",
                                0.1
                            ],
                            [
                                "v52.0",
                                0.95
                            ],
                            [
                                "v51.0",
                                0.15
                            ],
                            [
                                "v50.0",
                                0.1
                            ],
                            [
                                "v48.0",
                                0.31
                            ],
                            [
                                "v47.0",
                                0.12
                            ]
                        ]
                    },
                    {
                        "name": "Internet Explorer",
                        "id": "Internet Explorer",
                        "data": [
                            [
                                "v11.0",
                                6.2
                            ],
                            [
                                "v10.0",
                                0.29
                            ],
                            [
                                "v9.0",
                                0.27
                            ],
                            [
                                "v8.0",
                                0.47
                            ]
                        ]
                    },
                    {
                        "name": "Safari",
                        "id": "Safari",
                        "data": [
                            [
                                "v11.0",
                                3.39
                            ],
                            [
                                "v10.1",
                                0.96
                            ],
                            [
                                "v10.0",
                                0.36
                            ],
                            [
                                "v9.1",
                                0.54
                            ],
                            [
                                "v9.0",
                                0.13
                            ],
                            [
                                "v5.1",
                                0.2
                            ]
                        ]
                    },
                    {
                        "name": "Edge",
                        "id": "Edge",
                        "data": [
                            [
                                "v16",
                                2.6
                            ],
                            [
                                "v15",
                                0.92
                            ],
                            [
                                "v14",
                                0.4
                            ],
                            [
                                "v13",
                                0.1
                            ]
                        ]
                    },
                    {
                        "name": "Opera",
                        "id": "Opera",
                        "data": [
                            [
                                "v50.0",
                                0.96
                            ],
                            [
                                "v49.0",
                                0.82
                            ],
                            [
                                "v12.1",
                                0.14
                            ]
                        ]
                    }
                ]
            }
        });
    }


		</script>
</html>
