<?php
require_once("config.php");
require_once("functions.php");
$page_name = "Container Devan Main";
require_once("assets.php");
?>
<link rel="stylesheet" href="assets/css/bootstrap-datetimepicker.min.css">
<style>
    .table tr>td,
    tr>th {
        text-align: center;
        vertical-align: middle;
        font-size: 14px;
    }

    .table-scroll {
        position: relative;
        width: 100%;
        z-index: 1;
        margin: auto;
        overflow: auto;
        height: 910px;
    }

    .table-scroll table {
        width: 100%;
        min-width: 1280px;
        margin: auto;
        border-collapse: separate;
        border-spacing: 0;
    }

    .table-wrap {
        position: relative;
    }

    .table-scroll th,
    .table-scroll td {
        padding: 5px 10px;
        border-top: 1px solid #878787;
        border-left: 1px solid #878787;
        background: #fff;
        vertical-align: middle;
        white-space: nowrap;
    }

    .table-scroll thead th {
        background: #FFF;
        color: #000;
        position: -webkit-sticky;
        position: sticky;

    }

    .table-scroll tbody tr:last-child th,
    tr:last-child>td {
        border-bottom: 1px solid #878787;
    }

    th:first-child {
        position: -webkit-sticky;
        position: sticky;
        left: 0;
        z-index: 2;
        background: #e3e2e2;
    }

    thead th:first-child {
        z-index: 5;
    }

    th:nth-child(2) {
        position: -webkit-sticky;
        position: sticky;
        left: 99px;
        z-index: 2;
        background: #e3e2e2;
    }

    thead th:nth-child(2) {
        z-index: 5;
    }

    th:nth-child(3) {
        position: -webkit-sticky;
        position: sticky;
        left: 161px;
        z-index: 2;
        background: #e3e2e2;
    }

    thead th:nth-child(3) {
        z-index: 5;
    }

    .bootstrap-datetimepicker-widget table thead th {
        background: #fff;
    }

    .bootstrap-datetimepicker-widget tbody tr:last-child th,
    tr:last-child>td {
        border-bottom: 0;
    }

    .devan-row th {
        cursor: pointer;
    }

    .active-devan {
        -webkit-box-shadow: inset 0px 0px 5px #c1c1c1;
        -moz-box-shadow: inset 0px 0px 5px #c1c1c1;
        box-shadow: inset 0px 0px 5px #c1c1c1;
        outline: none;
        color: white;
        background-color: red;
    }
    #btn_revan.active-devan:hover {
        background-color: red;
        color: white;
    }
    #btn_revan:hover {
        background-color: none;
    }
</style>

<body class="hold-transition sidebar-collapse layout-top-nav" onload="startTime()">
    <div class="wrapper">
        <?php include("header.php"); ?>
        <?php include("menu.php"); ?>
        <?php
        $this_month_start = date('Y-m') . '-01';
        $start_date = date('Y-m-d', strtotime('previous sunday', strtotime($this_month_start)));
        $this_month_end = date("Y-m-t", strtotime($this_month_start));
        $end_date = date('Y-m-d', strtotime('next monday', strtotime($this_month_end)));
        $query = "SELECT * FROM {$tblContainerDevan} WHERE `date` BETWEEN  '{$start_date}' AND '{$end_date}' ORDER BY `date` ASC LIMIT 1";
        $result = $db->query($query);
        if (mysqli_num_rows($result) > 0) {
            $row = mysqli_fetch_object($result);
            $approved_by = $row->approved_by;
        } else {
            $approved_by = '';
        }

        ?>
        <div class="content-wrapper">
            <div class="content-header">
                <div class="container-fluid">
                    <div class="row mb-2">
                        <div class="col-sm-4">
                            <h1 class="m-0" style="display: inline">Deeside Devanning / Vanning Schedule</h1>
                        </div>
                        <div class="col-sm-3" style="text-align: center;">
                            <button class="btn btn-default" id="btn_revan" style="width: 50%;">Revan</button>
                        </div>
                        <div class="col-sm-5" style="text-align: right;">
                            <span style="margin-right: 20px;">Approved by : <?php echo $approved_by; ?></span>
                            <input class="form-control" type="text" id="year_month" name="year_month" style="display: inline-block; width: 200px;" value="<?php echo date('m/Y'); ?>">
                            <button class="btn btn-success" id="btn_load_data">Load Data</button>
                            <label class="btn btn-primary" style="margin-top: 7px; font-weight: normal;">
                                Import Data <input type="file" hidden id="file" name="file">
                            </label>
                        </div>
                        <div class="col-sm-12" style="font-size: 13px; color: #6c757d">
                            All containers must arrive and depart as scheduled below. If there are any deviations to the Schedule when the Japan Specialist is unavailable then please notify the specialist AS SOON AS POSSIBLE. If there are any questions then always STOP-CALL-WAIT.
                        </div>
                    </div>
                </div>
            </div>
            <div class="content">
                <div class="container-fluid">
                    <div class="row">
                        <div class="col-md-12">
                            <div class="card">
                                <div class="card-body" style="width: 100%; height: 910px; padding: 0; overflow: auto;">
                                    <div id="table-scroll" class="table-scroll">
                                        <p style="padding-top: 30px; text-align: center; display: none;" id="no_result_p">There is no data yet</p>
                                        <table id="main-table" class="main-table" style="display: none;">
                                            <thead>
                                                <tr>
                                                    <th style="height: 25px;top: 0;"></th>
                                                    <th style="height: 25px;top: 0;"></th>
                                                    <th style="height: 25px;top: 0; border-right: 1px solid #878787;"></th>
                                                    <th scope="col" colspan="12" style="height: 25px;top: 0;">Delivery Management</th>
                                                    <th scope="col" rowspan="6" style="top: 0;"></th>
                                                    <th scope="col" colspan="21" style="height: 25px;top: 0;">In House Management</th>
                                                </tr>
                                                <tr>
                                                    <th style="height: 25px; top:32px;"></th>
                                                    <th style="height: 25px; top:32px;"></th>
                                                    <th style="height: 25px; top:32px; border-right: 1px solid #878787;"></th>
                                                    <!--------Delivery Management------->
                                                    <th scope="col" colspan="4" style="top:32px; height: 25px;">Arrival</th>
                                                    <th scope="col" rowspan="5" style="top:32px;">PENTALVER Instructions</th>
                                                    <th scope="col" colspan="4" style="height: 25px; top:32px;">Departure</th>
                                                    <th scope="col" colspan="3" style="height: 25px; top:32px;">On Dock (before departure)</th>

                                                    <!--------In House Management-------->
                                                    <th scope="col" rowspan="5" style="top:32px;">In House Instructions</th>
                                                    <th scope="col" colspan="3" style="top:32px; height: 25px; background-color: red; color:#fff">Confirmation</th>
                                                    <th scope="col" colspan="6" style="top:32px;">Docked on to the Japan Bay</th>
                                                    <th scope="col" rowspan="2" style="top:32px;"></th>
                                                    <th scope="col" rowspan="5" style="top:32px;"></th>
                                                    <th scope="col" colspan="9" rowspan="2" style="top: 32px;">
                                                        Stored in the Deeside Yard
                                                        (after all actions have been completed)
                                                    </th>
                                                </tr>

                                                <tr>
                                                    <th style="height: 25px; top:64px;"></th>
                                                    <th style="height: 25px; top:64px;"></th>
                                                    <th style="height: 25px; top:64px; border-right: 1px solid #878787;"></th>

                                                    <!--------Delivery Management------->
                                                    <th scope="col" rowspan="4" style="top: 64px;">Inbound Renban / <br />Air Freight Case Number</th>
                                                    <th scope="col" rowspan="4" style="top: 64px;">Shipping Line</th>
                                                    <th scope="col" rowspan="4" style="top: 64px;">Number of ZR Modules</th>
                                                    <th scope="col" rowspan="4" style="top: 64px;">Container Number</th>

                                                    <th scope="col" rowspan="4" style="top: 64px;">Inbound Renban</th>
                                                    <th scope="col" rowspan="4" style="top: 64px;">Export Load Reference</th>
                                                    <th scope="col" rowspan="4" style="top: 64px;">Shipping Line</th>
                                                    <th scope="col" rowspan="4" style="top: 64px;">Container Number</th>

                                                    <th scope="col" rowspan="4" style="top: 64px;">Inbound Renban</th>
                                                    <th scope="col" rowspan="4" style="top: 64px;">Shipping Line</th>
                                                    <th scope="col" rowspan="4" style="top: 64px;">Container Number</th>

                                                    <!--------In House Management-------->
                                                    <th scope="col" rowspan="3" style="background-color: red; color:#fff; top: 64px;">
                                                        GL / TL to confirm in house instructions were actioned correctly
                                                    </th>
                                                    <th scope="col" rowspan="3" style="background-color: red; color:#fff; top: 64px;">
                                                        GL confirmation Customs check completed
                                                    </th>
                                                    <th scope="col" rowspan="3" style="background-color: red; color:#fff; top: 64px;">
                                                        Module Condition Record number of damaged modules
                                                    </th>
                                                    <th scope="col" colspan="6" style="background-color: #c8ccce; height: 25px; top:64px;">Devan and Customs Seal Info</th>
                                                </tr>

                                                <tr>
                                                    <th style="height: 25px; top:96px;"></th>
                                                    <th style="height: 25px; top:96px;"></th>
                                                    <th style="height: 25px; top:96px; border-right: 1px solid #878787;"></th>

                                                    <!--------In House Management-------->
                                                    <th scope="col" colspan="4" style="background-color: #A1A6AA; top: 96px;">Containers to be Devanned</th>
                                                    <th scope="col" rowspan="2" style="background-color: red; color: #FFF; top: 96px;">
                                                        To be filled in by the GL / TL record seal number removed from container.
                                                    </th>
                                                    <th scope="col" rowspan="3" style="background-color: #A1A6AA; top: 96px;">
                                                        Container Number
                                                    </th>
                                                    <th scope="col" rowspan="2" style="background-color: red; color: #FFF; top: 96px;">EXPECTED SEAL NO.</th>
                                                    <th scope="col" colspan="9" style="top: 96px;"></th>
                                                </tr>

                                                <tr>
                                                    <th style="height: 25px; top:128px;"></th>
                                                    <th style="height: 25px; top:128px;"></th>
                                                    <th style="height: 25px; top:128px; border-right: 1px solid #878787;"></th>
                                                    <!--------In House Management-------->
                                                    <th scope="col" rowspan="2" style="background-color: #A1A6AA; top: 128px;">Inbound Renban (No. 1)</th>
                                                    <th scope="col" rowspan="2" style="background-color: #A1A6AA; top: 128px;">Export Renban</th>
                                                    <th scope="col" rowspan="2" style="background-color: #A1A6AA; top: 128px;">Shipping Line</th>
                                                    <th scope="col" rowspan="2" style="width: 120px; background-color: #A1A6AA; top: 128px;">ZR</th>

                                                    <th scope="col" rowspan="2" style="top: 128px;">Inbound Renban (No. 1)</th>
                                                    <th scope="col" rowspan="2" style="top: 128px;">Tapped Modules</th>
                                                    <th scope="col" rowspan="2" style="top: 128px;">Container Number</th>
                                                    <th scope="col" rowspan="2" style="top: 128px;">Inbound Renban (No. 2)</th>
                                                    <th scope="col" rowspan="2" style="top: 128px;">Tapped Modules</th>
                                                    <th scope="col" rowspan="2" style="top: 128px;">Container Number</th>
                                                    <th scope="col" rowspan="2" style="top: 128px;">Inbound Renban (No. 3)</th>
                                                    <th scope="col" rowspan="2" style="top: 128px;">Tapped Modules</th>
                                                    <th scope="col" rowspan="2" style="top: 128px;">Container Number</th>
                                                </tr>
                                                <tr>
                                                    <th style="height: 25px; top:153px;">DATE</th>
                                                    <th style="height: 25px; top:153px;">SHIFT</th>
                                                    <th style="height: 25px; top:153px; border-right: 1px solid #878787;">TIME</th>
                                                    <th scope="col" style="background-color: red; color: #FFF;top: 153px;">Print Name</th>
                                                    <th scope="col" style="background-color: red; color: #FFF;top: 153px;">Print Name</th>
                                                    <th scope="col" style="background-color: red; color: #FFF;top: 153px;">Quantity</th>
                                                    <th scope="col" style="background-color: red; color: #FFF;top: 153px;">PIPCONT / PIPSEAL</th>
                                                    <th scope="col" style="background-color: red; color: #FFF;top: 153px;">&nbsp;</th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                            </tbody>
                                        </table>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

                </div>
            </div>
        </div>
        <!-- /.content-wrapper -->
        <?php include("footer.php"); ?>
    </div>

    <div class="modal fade" id="container_number_modal">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h4 class="modal-title">Container Number</h4>
                </div>
                <div class="modal-body">
                    <form class="">
                        <div class="form-group">
                            <label class="">Container Number</label>
                            <input type="text" class="form-control" id="container_number" name="container_number">
                        </div>
                    </form>
                </div>
                <div class="modal-footer justify-content-center">
                    <button type="button" class="btn btn-success" id="enter_container_number" data-dismiss="modal" style="width: 160px;">OK</button>
                </div>
            </div>
            <!-- /.modal-content -->
        </div>
        <!-- /.modal-dialog -->
    </div>
    <!-- REQUIRED SCRIPTS -->

    <!-- jQuery -->
    <script src="plugins/jquery/jquery.min.js"></script>
    <!-- Bootstrap 4 -->
    <script src="plugins/bootstrap/js/bootstrap.bundle.min.js"></script>
    <script src="plugins/moment/moment.min.js"></script>
    <script src="assets/js/bootstrap-datetimepicker.min.js"></script>
    <!-- AdminLTE App -->
    <script src="assets/js/adminlte.min.js"></script>
    <script src="assets/js/custom.js"></script>
    <script>
        $(document).ready(function() {
            $("#file").on('change', function() {
                $("#loading").fadeIn(500);
                var file_data = $(this).prop('files')[0];
                var form_data = new FormData();
                form_data.append('file', file_data);
                $.ajax({
                    url: 'container_devan_import.php',
                    cache: false,
                    contentType: false,
                    processData: false,
                    data: form_data,
                    type: 'post',
                    success: function(result) {
                        console.log(result); // <-- display response from the PHP script, if any
                        $("#file").val("");
                        read_container_devan();
                    }
                });
            });

            $("#year_month").datetimepicker({
                format: 'MM/YYYY',
                icons: {
                    previous: 'fas fa-angle-left',
                    next: 'fas fa-angle-right',
                }
            });

            $("#btn_load_data").on('click', function() {
                $("#loading").fadeIn(500);
                var year_month = $("#year_month").val();
                if (year_month == '') {
                    $("#year_month").focus();
                    return false;
                }
                read_container_devan();
            });

            function read_container_devan() {

                var year_month = $("#year_month").val();
                $.ajax({
                    url: "actions.php",
                    method: "post",
                    data: {
                        'action': 'read_container_devan',
                        'year_month': year_month
                    },
                    dataType: 'HTML',
                }).done(function(html) {
                    //console.log(html);
                    $("#loading").fadeOut(500);
                    if (html == "there is no data yet") {
                        $("#main-table").hide();
                        $("#no_result_p").show();
                    } else {
                        $("#main-table tbody").html(html);
                        $("#main-table").show();
                        $("#no_result_p").hide();
                    }
                    $(".devan-row").on('click', function(ev) {
                        const id = $(ev.currentTarget).data("container");
                        if (id && window.onrevan) {
                            $.ajax({
                                url: "actions.php",
                                method: "post",
                                data: {
                                    'action': 'update_revan_state',
                                    'container_number': id
                                },
                            }).done(function(result) {
                                if (result != 'Failed') {
                                    $(".devan-row").each(function() {
                                        var date = $(this).attr('data-schedule_date');
                                        var row_contrainer = $(this).attr('data-container');
                                        if (row_contrainer == id && date >= result) {
                                            $(this).find('td').css('background-color', 'red');
                                            $(this).find('td').css('color', 'white');
                                        }
                                    });
                                }
                                window.onrevan = false;
                                $("#btn_revan").removeClass("active-devan");
                            });
                        }
                    })

                });
            }

            $(document).on('input', '.input-value', function() {
                var value = $(this).val();
                var field = $(this).attr('name');
                var row_id = $(this).closest('tr').attr('data-row');
                $.ajax({
                    url: "actions.php",
                    method: "post",
                    data: {
                        'action': 'update_container_devan',
                        'value': value,
                        'field': field,
                        'row_id': row_id
                    },
                }).done(function(result) {
                    console.log(result);
                });
            });

            $("#btn_revan").on('click', function() {
                if (window.onrevan) {
                    window.onrevan = false;
                    $("#btn_revan").removeClass("active-devan");
                } else {
                    window.onrevan = true;
                    $("#btn_revan").addClass("active-devan");
                }
                // $("#container_number_modal").modal();
            });

            $(document).on('click', '#enter_container_number', function() {
                var container_number = $("#container_number").val();
                if (container_number == '')
                    return false;
                $.ajax({
                    url: "actions.php",
                    method: "post",
                    data: {
                        'action': 'update_revan_state',
                        'container_number': container_number,
                    },
                }).done(function(result) {
                    if (result != 'Failed') {
                        $(".devan-row").each(function() {
                            var date = $(this).attr('data-schedule_date');
                            var row_contrainer = $(this).attr('data-container');
                            if (row_contrainer == container_number && date >= result) {
                                $(this).find('td').css('background-color', 'red');
                                $(this).find('td').css('color', 'white');
                            }
                        });
                    }
                });

            });

            read_container_devan();
        });
    </script>
</body>

</html>