<?php
require_once("config.php");
require_once("functions.php");
$page_name = "Stocking Level";
$_SESSION['page'] = 'stocking_levels.php';
login_check();
if (!isset($_SESSION['stocking_action']))
    header('Location: stocking_select_action.php');
require_once("assets.php");
$shift_inf = get_current_shift();
$booked_in_out = get_booked_in_out('Stocking', $shift_inf['shift'], $shift_inf['date']);
?>
<style>
    #chart {
        max-width: 50%;
        height: 400px;
    }

    .part-title {
        font-weight: bold;
        font-size: 20px;
    }

    .part-count {
        font-weight: bold;
        font-size: 60px;
    }
</style>
<script src="plugins/apexcharts.js"></script>

<body class="hold-transition sidebar-collapse layout-top-nav" onload="startTime()">
    <div class="wrapper">
        <?php include("header.php"); ?>
        <?php include("menu.php"); ?>
        <div class="content-wrapper">
            <div class="content-header">
                <div class="container-fluid">
                    <div class="row mb-2">
                    </div>
                </div>
            </div>
            <div class="content">
                <div class="container-fluid">
                    <h3 style="font-weight: bold;text-align: center;margin: 0;position: relative;top: 20px;">Stocking Levels</h3>
                    <div class="row" style="margin-bottom: 10px;">
                        <div class="col-md-6" style="display: flex;justify-content: space-around;">
                            <div style="border-radius: 100%;width: 200px;height: 200px;flex-direction: column;display:flex;background-color: #2f6eba !important;justify-content: center;align-items: center;">
                                <span class="part-title">ZR Cylinder</span>
                                <span class="part-count" id="zrc-count"></span>
                            </div>
                            <div style="border-radius: 100%;width: 200px;height: 200px;display:flex;flex-direction: column;background-color: #ffff53 !important;justify-content: center;align-items: center;">
                                <span class="part-title">ZRK Cylinder</span>
                                <span class="part-count" id="zrkc-count"></span>
                            </div>
                        </div>
                        <div class="col-md-6" style="display: flex;justify-content: space-around;">
                            <div style="border-radius: 100%;width: 200px;height: 200px;flex-direction: column;display:flex;background-color: #75a931;justify-content: center;align-items: center;">
                                <span class="part-title">ZR Block</span>
                                <span class="part-count" id="zrb-count"></span>
                            </div>
                            <div style="border-radius: 100%;width: 200px;height: 200px;display:flex;flex-direction: column;background-color: #ffff53 !important;justify-content: center;align-items: center;">
                                <span class="part-title">ZRK Block</span>
                                <span class="part-count" id="zrkb-count"></span>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-6">
                            <div class="card">
                                <div class="card-header">
                                    <b>L/P(Week)</b>
                                    <input type="week" value="<?= date("o") . "-W" . date("W") ?>" id="lp-week" />
                                </div>
                                <div class="card-body">
                                    <div id="lp-week-chart" style="width: 100%;"></div>
                                </div>
                            </div>
                            <div class="card">
                                <div class="card-header">
                                    <b>L/P(Month)</b>
                                    <input type="month" value="<?= date('Y-m') ?>" id="lp-month">
                                </div>
                                <div class="card-body">
                                    <div id="lp-month-chart" style="width: 100%;"></div>
                                </div>
                            </div>
                            <div class="card">
                                <div class="card-header">
                                    <b>L/P(Year)</b>
                                    <input type="number" value="<?= date('Y') ?>" id="lp-year" max="<?= date('Y') ?>">
                                </div>
                                <div class="card-body">
                                    <div id="lp-year-chart" style="width: 100%;"></div>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-6">
                            <div class="card">
                                <div class="card-header">
                                    <b>H/P(Week)</b>
                                    <input type="week" value="<?= date("o") . "-W" . date("W") ?>" id="hp-week" />
                                </div>
                                <div class="card-body">
                                    <div id="hp-week-chart" style="width: 100%;"></div>
                                </div>
                            </div>
                            <div class="card">
                                <div class="card-header">
                                    <b>H/P(Month)</b>
                                    <input type="month" value="<?= date('Y-m') ?>" id="hp-month">
                                </div>
                                <div class="card-body">
                                    <div id="hp-month-chart" style="width: 100%;"></div>
                                </div>
                            </div>
                            <div class="card">
                                <div class="card-header">
                                    <b>H/P(Year)</b>
                                    <input type="number" value="<?= date('Y') ?>" id="hp-year" max="<?= date('Y') ?>">
                                </div>
                                <div class="card-body">
                                    <div id="hp-year-chart" style="width: 100%;"></div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!-- /.content-wrapper -->
            <?php include("footer.php"); ?>
        </div>

        <script src="plugins/jquery/jquery.min.js"></script>
        <script src="plugins/bootstrap/js/bootstrap.bundle.min.js"></script>
        <script src="assets/js/adminlte.min.js"></script>
        <script src="assets/js/custom.js"></script>
        <script>
            $(document).ready(function() {
                $.ajax({
                    url: "actions.php",
                    method: "post",
                    data: {
                        'action': 'read_graph_circle',
                    },
                    dataType: 'JSON'
                }).done(function(res) {
                    $("#zrc-count").text(res.zrc)
                    $("#zrkc-count").text(res.zrkc)
                    $("#zrb-count").text(res.zrb)
                    $("#zrkb-count").text(res.zrkb)
                })

                var options = {
                    chart: {
                        height: 350,
                        type: 'line',
                        zoom: {
                            enabled: false
                        }
                    },
                    dataLabels: {
                        enabled: false
                    },
                    stroke: {
                        curve: 'smooth'
                    },
                    title: {
                        text: 'Product Trends by Month',
                        align: 'left'
                    },
                    grid: {
                        row: {
                            colors: ['#f3f3f3', 'transparent'], // takes an array which will be repeated on columns
                            opacity: 0.5
                        },
                    },
                    colors: ["#000000", "#BBBBBB", "#2f6eba", "#ffff53"],
                    series: [],
                    xaxis: {},
                    title: {
                        align: "center",
                        style: {
                            fontSize: '20px',
                            fontWeight: "bold"
                        }
                    },
                    legend: {
                        position: "top"
                    }
                }

                options.title.text = "L/P(Week)"
                window.lpWeekChart = new ApexCharts(document.querySelector("#lp-week-chart"), options);
                window.lpWeekChart.render()
                updateWeekGraph("lp")
                $("#lp-week").on('change', function() {
                    updateWeekGraph("lp")
                })

                options.title.text = "H/P(Week)"
                window.hpWeekChart = new ApexCharts(document.querySelector("#hp-week-chart"), options);
                window.hpWeekChart.render()
                updateWeekGraph("hp")
                $("#hp-week").on('change', function() {
                    updateWeekGraph("hp")
                })

                options.title.text = "L/P(Month)"
                window.lpMonthChart = new ApexCharts(document.querySelector("#lp-month-chart"), options);
                window.lpMonthChart.render()
                updateMonthGraph("lp")
                $("#lp-month").on('change', function() {
                    updateMonthGraph("lp")
                })

                options.title.text = "H/P(Month)"
                window.hpMonthChart = new ApexCharts(document.querySelector("#hp-month-chart"), options);
                window.hpMonthChart.render()
                updateMonthGraph("hp")
                $("#hp-month").on('change', function() {
                    updateMonthGraph("hp")
                })

                options.title.text = "L/P(Year)"
                window.lpYearChart = new ApexCharts(document.querySelector("#lp-year-chart"), options);
                window.lpYearChart.render()
                updateYearGraph("lp")
                $("#lp-year").on('change', function() {
                    updateYearGraph("lp")
                })


                options.title.text = "H/P(Year)"
                window.hpYearChart = new ApexCharts(document.querySelector("#hp-year-chart"), options);
                window.hpYearChart.render()
                updateYearGraph("hp")
                $("#hp-year").on('change', function() {
                    updateYearGraph("hp")
                })
            })

            function updateWeekGraph(type) {
                var weekVal = $(`#${type}-week`).val()
                $.ajax({
                    url: "actions.php",
                    method: "post",
                    data: {
                        'action': 'read_graph_week',
                        'part': type,
                        'week': weekVal
                    },
                    dataType: 'JSON'
                }).done(function(res) {
                    console.log(res)
                    if (type == 'lp') {
                        window.lpWeekChart.updateOptions({
                            xaxis: {
                                categories: res.xaxis
                            },
                            series: [{
                                name: "IN",
                                data: res.in_count_array
                            }, {
                                name: "OUT",
                                data: res.out_count_array
                            }, {
                                name: "ZRC",
                                data: res.val1
                            }, {
                                name: "ZRKC",
                                data: res.val2
                            }]
                        }, true)
                    } else {
                        window.hpWeekChart.updateOptions({
                            xaxis: {
                                categories: res.xaxis
                            },
                            series: [{
                                name: "IN",
                                data: res.in_count_array
                            }, {
                                name: "OUT",
                                data: res.out_count_array
                            }, {
                                name: "ZRB",
                                data: res.val1
                            }, {
                                name: "ZRKB",
                                data: res.val2
                            }]
                        }, true)
                    }
                })
            }

            function updateMonthGraph(type) {
                var monthVal = $(`#${type}-month`).val()
                $.ajax({
                    url: "actions.php",
                    method: "post",
                    data: {
                        'action': 'read_graph_month',
                        'part': type,
                        'month': monthVal
                    },
                    dataType: 'JSON'
                }).done(function(res) {
                    if (type == 'lp')
                        window.lpMonthChart.updateOptions({
                            xaxis: {
                                categories: res.xaxis
                            },
                            series: [{
                                name: "IN",
                                data: res.in_count_array
                            }, {
                                name: "OUT",
                                data: res.out_count_array
                            }, {
                                name: "ZRC",
                                data: res.val1
                            }, {
                                name: "ZRKC",
                                data: res.val2
                            }]
                        }, true)
                    else
                        window.hpMonthChart.updateOptions({
                            xaxis: {
                                categories: res.xaxis
                            },
                            series: [{
                                name: "IN",
                                data: res.in_count_array
                            }, {
                                name: "OUT",
                                data: res.out_count_array
                            }, {
                                name: "ZRB",
                                data: res.val1
                            }, {
                                name: "ZRKB",
                                data: res.val2
                            }]
                        }, true)
                })
            }

            function updateYearGraph(type) {
                var yearVal = $(`#${type}-year`).val()
                $.ajax({
                    url: "actions.php",
                    method: "post",
                    data: {
                        'action': 'read_graph_year',
                        'part': type,
                        'year': yearVal
                    },
                    dataType: 'JSON'
                }).done(function(res) {
                    if (type == 'lp')
                        window.lpYearChart.updateOptions({
                            xaxis: {
                                categories: res.xaxis
                            },
                            series: [{
                                name: "IN",
                                data: res.in_count_array
                            }, {
                                name: "OUT",
                                data: res.out_count_array
                            }, {
                                name: "ZRC",
                                data: res.val1
                            }, {
                                name: "ZRKC",
                                data: res.val2
                            }]
                        }, true)
                    else
                        window.hpYearChart.updateOptions({
                            xaxis: {
                                categories: res.xaxis
                            },
                            series: [{
                                name: "IN",
                                data: res.in_count_array
                            }, {
                                name: "OUT",
                                data: res.out_count_array
                            }, {
                                name: "ZRB",
                                data: res.val1
                            }, {
                                name: "ZRKB",
                                data: res.val2
                            }]
                        }, true)
                })
            }
        </script>
</body>

</html>