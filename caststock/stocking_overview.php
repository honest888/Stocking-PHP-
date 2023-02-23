<?php
require_once("config.php");
require_once("functions.php");
$page_name = "Stocking Overview";
$_SESSION['page'] = 'stocking_overview.php';
login_check();
if (!isset($_SESSION['stocking_action']))
    header('Location: stocking_select_action.php');
require_once("assets.php");
$shift_inf = get_current_shift();
$booked_in_out = get_booked_in_out('Stocking', $shift_inf['shift'], $shift_inf['date']);
?>
<style>
    .table thead>tr>th,
    tbody>tr>td {
        text-align: center;
    }

    .lane-table td {
        height: 50px;
        width: 50px;
        border: 1px solid #999797;
    }

    .title-td {
        font-weight: bold;
        background-color: #eeeeee;
    }

    .highlight-td {
        background-color: #57a7fa;
    }

    .highlight-td {
        padding: 10px;
        /*display: inline-block;
        border-radius: 5px;*/
        animation: blinkingBackground 6s infinite;
    }

    @keyframes blinkingBackground {
        0% {
            background-color: #57a7fa;
            color: #fff;
        }

        25% {
            background-color: #ffffff;
            color: #000;
        }

        50% {
            background-color: #57a7fa;
            color: #fff;
        }

        75% {
            background-color: #ffffff;
            color: #000;
        }

        100% {
            background-color: #57a7fa;
            color: #fff;
        }
    }

    .full-td {
        background-color: #385626;
        color: #FFF;
        cursor: pointer;
    }

    .m-full-td {
        background-color: #1AB050;
        color: #FFF;
        cursor: pointer;
    }

    .l-full-td {
        background-color: #92D051;
        color: #FFF;
        cursor: pointer;
    }

    .clicked-box {
        background-color: red;
    }

    .ZRC-color {
        background-color: #2f6eba;
    }

    .ZRB-color {
        background-color: #9fcd62;
    }

    .ZRKB-color {
        background-color: #ffff53;
    }

    .ZRKC-color {
        background-color: #ffff53;
    }
</style>

<body class="hold-transition sidebar-collapse layout-top-nav" onload="startTime()">
    <div class="wrapper">
        <?php include("header.php"); ?>
        <?php include("menu.php"); ?>
        <div class="content-wrapper">
            <div class="content-header">
                <div class="container-fluid">
                    <div class="row mb-2">
                        <div class="col-sm-2">
                            <h1 class="m-0" style="display: inline"><?php echo $page_name; ?></h1>
                        </div>
                        <div class="col-sm-3" style="text-align: center;">
                            <button class="btn bg-cyan" style="display: none;width: 160px; margin-right: 20px;" id="btn_overstock" value="">Overstock</button>
                            <?php
                            if ($_SESSION['stocking_action'] == 'in') {
                                echo '<button type="button" class="btn btn-primary" id="stocking_action" style="width: 160px;" value="in">IN</button>';
                            } else {
                                echo '<button type="button" class="btn btn-success" id="stocking_action" style="width: 160px;" value="out">OUT</button>';
                            }
                            ?>
                            <button class="btn bg-gray-dark" style="display: none;width: 160px; margin-left: 20px;" id="btn_overstock_view">Overstock View</button>
                        </div>
                        <div class="col-sm-4">
                            <div style="width: 100%;">
                            <div style="display:flex; align-items: flex-start;">
                                <div class="row">
                                    <div style="padding-top:0.375rem;">
                                        <label>AREA:</label>
                                        <select id="area" class="mr-3">
                                            <option value="ALL">ALL</option>
                                            <option value="HP">HP</option>
                                            <option value="LP">LP</option>
                                        </select>
                                    </div>
                                    <div>
                                        <table class="table" style="border-collapse: separate; ">
                                            <tbody>
                                                <tr>
                                                    <td class="align-middle" style="padding: 0px;">KEY:</td>
                                                    <td class="align-middle" style="background-color: #92D051; width: 30px; padding: 0.25rem;">1</td>
                                                    <td class="align-middle" style="background-color: #1AB050; width: 30px; padding: 0.25rem;">2</td>
                                                    <td class="align-middle" style="background-color: #385626; width: 30px; padding: 0.25rem;">3</td>
                                                </tr>
                                            </tbody>
                                        </table>
                                    </div>
                                    <div class="ml-2">
                                        <!-- <button class="btn btn-default" id="btn_export_excel">Download</button> -->
                                        <form method="post" id="excel_export" action="excel_export.php">
                                            <button type="submit" class="btn btn-default" style="margin-left: 10px;" value="Export">Export</button>
                                            <input type="hidden" id="page" name="page" value="stocking_overview">
                                        </form>
                                    </div>
                                </div>
                            </div>
                                <!-- <table class="table">
                                    <tr>
                                        <td style="width: 70px; border: 0px;">KEY: </td>
                                        <td style="background-color: #92D051; width: 50px; border: 0px;"></td>
                                        <td style="border: 0px; text-align: left;"> * 1</td>
                                        <td style="background-color: #1AB050; width: 50px; border: 0px;"></td>
                                        <td style="border: 0px; text-align: left;"> * 2</td>
                                        <td style="background-color: #385626; width: 50px; border: 0px;"></td>
                                        <td style="border: 0px; text-align: left;"> * 3</td>
                                    </tr>
                                </table> -->
                            </div>
                            <!-- <div style="width: 100%; min-height: 100px; background-color: #4573C5; color: #fff;" id="box_information">
                            </div> -->
                        </div>
                        <div class="col-sm-3" style="text-align: right;">
                            <button class="btn btn-default" style="min-width: 200px;"><?php echo $_SESSION['user']['username'] ?></button>
                            <a href="logout.php" class="btn btn-success" style="width: 150px;">LOGOUT</a>
                        </div>
                    </div>
                    
                </div>
            </div>
            <div class="content">
                <div class="container-fluid">
                    <div class="row">
                        <div class="col-md-12">
                            <div class="alert alert-danger alert-dismissible" style="display: none;">
                                <button type="button" class="close" data-dismiss="alert" aria-hidden="true">×</button>
                                <h5><i class="icon fas fa-ban"></i> Error!&nbsp;&nbsp;<span id="error_message"></span></h5>
                            </div>
                            <div class="alert alert-success alert-dismissible" style="display: none;">
                                <button type="button" class="close" data-dismiss="alert" aria-hidden="true">×</button>
                                <h5><i class="icon fas fa-check"></i> Success!&nbsp;&nbsp;<span id="success_message"></span></h5>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-3">
                            <div class="card card-primary">
                                <div class="card-header">
                                    <h3 class="card-title">BARCODE INPUT</h3>
                                </div>
                                <!-- /.card-header -->
                                <div class="card-body" style="height: 120px;">
                                    <div class="row">
                                        <div class="col-sm-12">
                                            <label id="input_title">Part Barcode Input</label>
                                            <div id="barcode_div">
                                                <input type="text" class="form-control in" name="barcode" id="barcode" autofocus>
                                                <input type="hidden" name="shift_id" id="shift_id" value="<?php echo $shift_inf['shift']; ?>">
                                                <input type="hidden" name="shift_data" id="shift_date" value="<?php echo $shift_inf['date']; ?>">
                                                <input type="hidden" name="request_scan" id="request_scan">
                                                <input type="hidden" name="request_location" id="request_location">
                                                <input type="hidden" name="input_kind" id="input_kind" value="part">
                                            </div>
                                            <div id="alert_div" style="padding-top: 10px;"></div>
                                            <div id="locktarget" style="display: none">Target</div>
                                        </div>
                                    </div>
                                </div>
                                <!-- /.card-body -->
                            </div>
                        </div>

                        <div class="col-md-3">
                            <div class="card card-primary">
                                <div class="card-header">
                                    <h3 class="card-title">CURRENT SHIFT</h3>
                                </div>
                                <!-- /.card-header -->
                                <div class="card-body" style="height: 120px;">
                                    <div class="row">
                                        <div class="col-sm-6" style="text-align: center;">
                                            <h4>Booked IN</h4>
                                            <h4 id="count_booked_in"><?php echo $booked_in_out['booked_in']; ?></h4>
                                        </div>
                                        <div class="col-sm-6" style="text-align: center;">
                                            <h4>Booked OUT</h4>
                                            <h4 id="count_booked_out"><?php echo $booked_in_out['booked_out']; ?></h4>
                                        </div>
                                    </div>
                                </div>
                                <!-- /.card-body -->
                            </div>
                        </div>
                        <div class="col-md-3">
                            <div class="card card-primary">
                                <div class="card-header">
                                    <h3 class="card-title">SEARCH</h3>
                                </div>
                                <div class="card-body">
                                    <input type="text" class="form-control" name="part_search" id="part_search" >
                                    <button class="btn btn-primary float-right" id="btn_part_search" style="margin-top: 5px; width: 120px;">Search</button>
                                    <button class="btn btn-default float-right" id="btn_clear_search" style="margin-top: 5px; margin-right: 10px; width: 120px;">Clear</button>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-3">
                            <div class="card card-primary">
                                <div class="card-header">
                                    <h3 class="card-title">PART</h3>
                                </div>
                                <div class="card-body" style="height: 120px;">
                                    <table class="table table-bordered">
                                        <thead>
                                            <tr>
                                                <th>Part Number</th>
                                                <th>Amount</th>
                                                <th>Location</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <tr>
                                                <td id="search_part_no" style="height: 40px;"></td>
                                                <td id="search_part_amount" style="height: 40px;"></td>
                                                <td id="search_part_location" style="height: 40px;"></td>
                                            </tr>
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                        </div>
                        
                    </div>
                    <div id="lane_info_box" style="display: none;">
                            <div class="card card-primary">
                                <div class="card-body">
                                    <div class="row">
                                        <!-- <div class="col-md-12" style="padding-left: 0rem; padding-right: 0rem; display: none;" id="lane_group"> -->
                                        <div class="col-md-12" id="lane_status_div"  style="min-height: 100px; background-color: black; color: #fff;">
                                        </div>
                                        <!-- </div> -->

                                        <!-- <div class="col-md-12" id="information_group" style="display:none;"> -->
                                        <div class="col-md-12" style="background-color: black; color: #fff; " id="box_information">

                                        </div>
                                        <!-- </div> -->
                                    </div>
                                </div>
                            </div>
                    </div>
                    <div class="row">
                        <div class="w-100">
                            <div class="card card-primary">
                                <div class="card-body">
                                    <div class="d-flex justify-content-center">
                                    <?php
                                    $max_rows = get_max_lane_rows();
                                    // L/P
                                    $lanes = get_all_lanes('L/P', ' ORDER BY lane_no ASC');
                                    echo '<div id="lp_table">';
                                    echo '<h5>L/P</h5>';
                                    echo '<div class="d-flex">';
                                    foreach ($lanes as $lane) {
                                        echo '<table class="lane-table" style="border-collapse: separate; border-spacing: 2px;" data-area="L/P">';
                                        $allocations = $lane->allocation;
                                        $height = $lane->height;
                                        $index = ceil($allocations / $height) - 1;
                                        if ($allocations % $height != 0)
                                            $index++;
                                        if ($max_rows - $allocations / $height > 0) {
                                            for ($i = $max_rows - $allocations / $height; $i >= 0; $i--) {
                                                echo '<tr data-lane="' . $lane->id . '">';
                                                echo '<td></td>';
                                                echo '</tr>';
                                            }
                                        }

                                        for ($i = $height; $i <= $allocations; $i += $height) {
                                            echo '<tr data-lane="' . $lane->id . '">';
                                            echo '<td id="td_' . $lane->id . '_' . $i . '" data-index="' . $index . '">' . $i . '</td>';
                                            echo '</tr>';
                                            $index--;
                                        }

                                        if ($allocations < $i && $allocations > ($i - $height)) {
                                            echo '<tr data-lane="' . $lane->id . '">';
                                            echo '<td id="td_' . $lane->id . '_' . $i . '" data-index="' . $index . '">' . $allocations . '</td>';
                                            echo '</tr>';
                                        }

                                        echo '<tr>';
                                        echo '<td id="td_' . $lane->id . '_0" class="title-td">L' . $lane->lane_no . '</td>';
                                        echo '</tr>';

                                        echo '</table>';
                                    }
                                    for ($j = 2; $j > 0; $j--) {
                                        echo '<table class="active-t float-left lane-table" style="border-collapse: separate; border-spacing: 2px;" data-area="L/P">';
                                        for ($i = $max_rows; $i >= 0; $i--) {
                                            echo '<tr data-lane="' . $lane->id . '">';
                                            echo '<td style="background-color: #00b0f0;"></td>';
                                            echo '</tr>';
                                        }
                                        echo '</table>';
                                    }
                                    echo '</div></div>';
                                    // H/P
                                    $lanes = get_all_lanes('H/P', ' ORDER BY lane_no ASC');
                                    echo '<div id="hp_table">';
                                    echo '<h5>H/P</h5>';
                                    echo '<div class="d-flex">';
                                    foreach ($lanes as $lane) {
                                        echo '<table class="lane-table" style="border-collapse: separate; border-spacing: 2px;" data-area="L/P">';
                                        $allocations = $lane->allocation;
                                        $height = $lane->height;
                                        $index = ceil($allocations / $height) - 1;
                                        if ($allocations % $height != 0)
                                            $index++;
                                        if ($max_rows - $allocations / $height > 0) {
                                            for ($i = $max_rows - $allocations / $height; $i > 0; $i--) {
                                                echo '<tr data-lane="' . $lane->id . '">';
                                                echo '<td></td>';
                                                echo '</tr>';
                                            }
                                        }

                                        for ($i = $height; $i <= $allocations; $i += $height) {
                                            echo '<tr data-lane="' . $lane->id . '">';
                                            echo '<td id="td_' . $lane->id . '_' . $i . '" data-index="' . $index . '">' . $i . '</td>';
                                            echo '</tr>';
                                            $index--;
                                        }

                                        if ($allocations < $i && $allocations > ($i - $height)) {
                                            echo '<tr data-lane="' . $lane->id . '">';
                                            echo '<td id="td_' . $lane->id . '_' . $i . '" data-index="' . $index . '">' . $allocations . '</td>';
                                            echo '</tr>';
                                        }

                                        echo '<tr>';
                                        echo '<td id="td_' . $lane->id . '_0" class="title-td">L' . $lane->lane_no . '</td>';
                                        echo '</tr>';

                                        echo '</table>';
                                    }
                                    echo '</div></div>';
                                    ?>
                                    </div>
                                    <div style="margin-top: 20px;display: grid; column-gap: 20px;grid-template-rows: 30px 30px;grid-template-columns: auto auto;">
                                        <div class="ZRC-color" style="text-align: center;">ZR Cylinder</div>
                                        <div class="ZRB-color" style="text-align: center;">ZR Block</div>
                                        <div class="ZRKC-color" style="text-align: center;">ZRK Cylinder</div>
                                        <div class="ZRKB-color" style="text-align: center;">ZRK Block</div>
                                    </div>
                                </div>
                            </div>
                            <!-- /.card-body -->
                        </div>
                        
                    </div>

                   
                </div>
            </div>
        </div>
        <!-- /.content-wrapper -->
        <?php include("footer.php"); ?>
    </div>

    <div class="modal fade" id="help_modal">
        <div class="modal-dialog">
            <div class="modal-content bg-danger">
                <div class="modal-header">
                    <h4 class="modal-title">ANDON HELP</h4>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">

                </div>
                <div class="modal-footer justify-content-center">
                    <button type="button" class="btn btn-success" id="confirm_help" data-dismiss="modal" style="width: 160px;">OK</button>
                </div>
            </div>
            <!-- /.modal-content -->
        </div>
        <!-- /.modal-dialog -->
    </div>

    <div class="modal fade" id="overstock_modal" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h4 class="modal-title">Overstock View</h4>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">×</span>
                    </button>
                </div>
                <div class="modal-body">

                </div>
                <div class="modal-footer justify-content-between">
                    <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                </div>
            </div>
        </div>
        <!-- /.modal-dialog -->
    </div>

    <!-- REQUIRED SCRIPTS -->

    <!-- jQuery -->
    <script src="plugins/jquery/jquery.min.js"></script>
    <!-- Bootstrap 4 -->
    <script src="plugins/bootstrap/js/bootstrap.bundle.min.js"></script>
    <!-- AdminLTE App -->
    <script src="assets/js/adminlte.min.js"></script>
    <script src="assets/js/custom.js"></script>
    <script>
        $(document).ready(function() {
            //Overview Screen
            load_overview_screen();
            /*setInterval(function () {
                load_overview_screen();
            }, 10000);*/

            //Check Help
            // setInterval(intervalFunction, 1200);

            function intervalFunction() {
                $.ajax({
                    url: "actions.php",
                    method: "post",
                    data: {
                        action: "get_help_alarm",
                        page: 'Stocking'
                    },
                    dataType: 'HTML',
                }).done(function(html) {
                    if (html != 'NO HELP') {
                        $("#help_modal").find('.modal-body').html(html);
                        $("#help_modal").modal();
                        clearInterval(intervalFunction);
                    }
                });
            }

            $("#confirm_help").on('click', function() {
                var alarm_id = $("#confirm_help_alarm_id").val();
                $.ajax({
                    url: "actions.php",
                    method: "post",
                    data: {
                        action: "confirm_help_alarm",
                        alarm_id: alarm_id

                    },
                }).done(function(result) {
                    setInterval(intervalFunction, 1200);
                });
            });

            var locktarget = document.querySelector('#locktarget');
            var pointerlockchangeIsFiredonRequest = false;
            var posX = 0
            var posY = 0;
            var event_counter = 0;

            $("#barcode_div").on('click', function() {
                LockTarget();
            });

            document.addEventListener("pointerlockchange", function() {
                event_counter++;
                if (event_counter === 1) {
                    pointerlockchangeIsFiredonRequest = true;
                    runRequestPointerLockTest();
                } else if (event_counter === 2) {
                    runExitPointerLockTest();
                } else if (event_counter === 3) {
                    runReEnterPointerLockTest()
                } else if (event_counter > 104) {
                    runRepeatLockPointerTest();
                }
            });

            function runRequestPointerLockTest() {
                posX = window.screenX;
                posY = window.screenY;
            }

            function runExitPointerLockTest() {
                locktarget.requestPointerLock(); // To re-enter pointer lock
            }

            function runReEnterPointerLockTest() {
                console.log("runReEnterPointerLockTest")
            }

            function runRepeatLockPointerTest() {
                console.log("runRepeatLockPointerTest")
            }

            function LockTarget() {
                locktarget.requestPointerLock();
            }

            // $("#barcode").on('keyup', function(e) {
            //     if (e.keyCode == 13) {
            //         if ($(this).hasClass('in')) {
            //             var overstock = $("#btn_overstock").val();
            //             var input_kind = $("#input_kind").val();
            //             var input = $(this);
            //             if (input_kind == "part") {
            //                 var barcode = $(this).val();
            //                 if (barcode == "999999") {
            //                     location.href = 'logout.php';
            //                     return false;
            //                 }
            //                 if (overstock == "overstock") {
            //                     go_to_overstock(barcode);
            //                     input.val('');
            //                     return false;
            //                 } else {
            //                     var scanned_barcode = $("#scanned_barcode").val();
            //                     var request_scan = $("#request_scan").val();

            //                     if (request_scan == "") {
            //                         request_scan += barcode;
            //                     } else {
            //                         request_scan += "," + barcode;
            //                     }
            //                     scanned_barcode += "," + barcode;
            //                     $("#scanned_barcode").val(scanned_barcode);
            //                     $("#request_scan").val(request_scan);
            //                     $("#input_kind").val('location');
            //                     $("#input_title").text('Location Barcode Input');
            //                     $("#input_title").css('color', 'blue');
            //                     input.val('');
            //                     get_lane_status_by_part(barcode, 'scan');
            //                     read_area_lane_status_overview(barcode, $("#stocking_action").val());

            //                     // $("#lane_info_box").show();
            //                     // $("#lane_group").show();
            //                     // $("#lane_group").addClass("col-md-12");
            //                     $("#lane_info_box").show();
            //                     $("#lane_status_div").show();
            //                     $("#box_information").hide();                            }
            //             } else {
            //                 var tool_location = $(this).val();
            //                 if (tool_location == "999999") {
            //                     location.href = 'logout.php';
            //                     return false;
            //                 }
            //                 var request_location = $("#request_location").val();
            //                 if (request_location == "") {
            //                     request_location += tool_location;
            //                 } else {
            //                     request_location += "," + tool_location;
            //                 }
            //                 $("#request_location").val(request_location);
            //                 $("#input_kind").val('part');
            //                 $("#input_title").text('Part Barcode Input');
            //                 $("#input_title").css('color', '#0e0e0e');
            //                 input.val('');
            //                 barcode_scan();
            //             }
            //         } else {
            //             return;
            //         }
            //     }
            // });
            
            $("#barcode").on('keyup', function(e) {
                if (e.keyCode == 13) {
                    if ($(this).hasClass('in')) {
                        var overstock = $("#btn_overstock").val();
                        var input_kind = $("#input_kind").val();
                        var input = $(this);
                        if (input_kind == "part") {
                            var barcode = $(this).val();
                            if (barcode == "999999") {
                                location.href = 'logout.php';
                                return false;
                            }
                            if (overstock == "overstock") {
                                go_to_overstock(barcode);
                                input.val('');
                                return false;
                            } else {
                                var scanned_barcode = $("#scanned_barcode").val();
                                var request_scan = $("#request_scan").val();

                                if (request_scan == "") {
                                    request_scan += barcode;
                                } else {
                                    request_scan += "," + barcode;
                                }
                                scanned_barcode += "," + barcode;
                                $("#scanned_barcode").val(scanned_barcode);
                                $("#request_scan").val(request_scan);
                                $("#input_kind").val('location');
                                $("#input_title").text('Location Barcode Input');
                                $("#input_title").css('color', 'blue');
                                input.val('');
                                get_lane_status_by_part(barcode, 'scan');
                                read_area_lane_status_overview(barcode, $("#stocking_action").val());

                                // $("#lane_info_box").show();
                                // $("#lane_group").show();
                                // $("#lane_group").addClass("col-md-12");
                                $("#lane_info_box").show();
                                $("#lane_status_div").show();
                                $("#box_information").hide();
                                // if($("#information_group").is(":visible"))
                                // {   
                                //     $("#lane_group").removeClass("col-md-12");
                                //     $("#lane_group").addClass("col-md-6");
                                //     $("#information_group").removeClass("col-md-12");
                                //     $("#information_group").addClass("col-md-6");
                                // }                                    
                                // else
                                // {
                                //     $("#lane_group").removeClass("col-md-6");
                                //     $("#lane_group").addClass("col-md-12");
                                //     $("#information_group").removeClass("col-md-12");
                                //     $("#information_group").addClass("col-md-6");
                                // }
                            }
                        } else {
                            var tool_location = $(this).val();
                            if (tool_location == "999999") {
                                location.href = 'logout.php';
                                return false;
                            }
                            var request_location = $("#request_location").val();
                            if (request_location == "") {
                                request_location += tool_location;
                            } else {
                                request_location += "," + tool_location;
                            }
                            $("#request_location").val(request_location);
                            $("#input_kind").val('part');
                            $("#input_title").text('Part Barcode Input');
                            $("#input_title").css('color', '#0e0e0e');
                            input.val('');
                            barcode_scan();
                        }
                    } else {
                        return;
                    }
                }
            });
            function barcode_scan() {
                var part = $("#request_scan").val();
                var lane = $("#request_location").val();
                var shift_id = $("#shift_id").val();
                var shift_date = $("#shift_date").val();
                $('td').removeClass('highlight-td');
                $.ajax({
                    url: "actions.php",
                    method: "post",
                    data: {
                        part: part,
                        lane: lane,
                        action: "read_barcode",
                        shift_id: shift_id,
                        shift_date: shift_date,
                        page: 'Stocking'
                    },
                    dataType: 'JSON',
                }).done(function(result) {
                    //console.log(result);
                    $("#barcode").focus();
                    $("#request_scan").val('');
                    $("#request_location").val('');
                    if (result.error != '') {
                        $("#error_message").text(result.error);
                        $(".alert-danger").fadeTo(2000, 500).slideUp(500, function() {
                            $(".alert-danger").slideUp(500);
                        });
                    } else {
                        $("#count_booked_in").text(result.booked_in);
                        $("#count_booked_out").text(result.booked_out);
                        $("#success_message").text(result.success);
                        $(".alert-success").fadeTo(2000, 500).slideUp(500, function() {
                            $(".alert-success").slideUp(500);
                        });
                    }
                    load_overview_screen();
                });
            }

            function load_overview_screen() {
                $.ajax({
                    url: "actions.php",
                    method: "post",
                    data: {
                        action: "load_overview_screen",
                        page: 'Stocking'
                    },
                    dataType: 'JSON',
                }).done(function(data) {
                    $(".title-td").removeClass('full-td m-full-td l-full-td ZRC-color ZRB-color ZRKC-color ZRKB-color');
                    $("[data-index]").removeClass('full-td m-full-td l-full-td ZRC-color ZRB-color ZRKC-color ZRKB-color');
                    for (var i = 0; i < data.length; i++) {
                        var td_id = data[i].id;
                        var td_class = data[i].td_class;
                        console.log("td_class");
                        console.log(td_class);
                        if (td_class) {
                            $("#" + td_id).addClass(td_class);
                        }
                    }
                });
            }

            /*
            Search
             */
            $("#btn_part_search").on('click', function() {
                if ($("#part_search").val() == "") {
                    $("#part_search").focus();
                    return false;
                }
                var part_no = $("#part_search").val();
                $("#search_part_no").html("&nbsp;");
                $("#search_part_amount").text('');
                $("#search_part_location").text('');
                get_lane_status_by_part(part_no, 'search');
            });

            $("#btn_clear_search").on('click', function() {
                $("#part_search").val('')
                $("#search_part_no").html('');
                $("#search_part_amount").text('');
                $("#search_part_location").text('');
                $('td').removeClass('highlight-td');
            });

            function get_lane_status_by_part(part_no, action) {
                $('td').removeClass('highlight-td');
                $.ajax({
                    url: "actions.php",
                    method: "post",
                    data: {
                        action: "get_filled_lanes_by_part",
                        part_no: part_no,
                        page: 'Stocking'
                    },
                    dataType: 'JSON',
                }).done(function(data) {
                    console.log(data);
                    if (data.part) {
                        if (action == 'search') {
                            $("#search_part_no").text(data.part.part_no);

                            var lanes = data.lanes;
                            var lane_names = [];
                            for (let i = 0; i < lanes.length; i++) {
                                if (lanes[i].area == 'L/P')
                                    var prefix = 'SF';
                                else if (lanes[i].area == 'H/P')
                                    var prefix = 'L';
                                else
                                    var prefix = 'FL';
                                var lane_name = prefix + lanes[i].lane_no;
                                lane_name = lane_name + ': ' + lanes[i].locations;
                                lane_names.push(lane_name);
                                //Highlight TD
                                highlight_lane(lanes[i].lane_id)

                            }
                            $("#search_part_amount").text(data.amount);
                            $("#search_part_location").html(lane_names.join("<br/>"));
                            $("#search_part_location").css('text-align', 'left');
                        } else {
                            var lanes = data.lanes;
                            for (let i = 0; i < lanes.length; i++) {
                                //Highlight TD
                                highlight_lane(lanes[i].lane_id);
                            }
                        }

                    }
                });
            }

            //Highlight td
            function highlight_lane(lane_id) {
                $(document).find('table.lane-table').each(function() {
                    $(this).find('tr').each(function() {
                        if ($(this).attr('data-lane') == lane_id) {
                            $(this).find('td').each(function() {
                                if (!$(this).hasClass('title-td') &&
                                    !$(this).hasClass('full-td') &&
                                    !$(this).hasClass('m-full-td') &&
                                    !$(this).hasClass('l-full-td')) {
                                    $(this).addClass('highlight-td');
                                }
                            });
                        }
                    });
                });
            }

            $(document).on('click', '.full-td, .m-full-td, .l-full-td', function() {
                var index = $(this).attr('data-index');
                var id = $(this).closest('tr').attr('data-lane');
                $('td').removeClass('clicked-box');
                $('td').removeClass('highlight-td');
                $(this).addClass('clicked-box');
                $.ajax({
                    url: "actions.php",
                    method: "post",
                    data: {
                        lane_id: id,
                        action: "get_box_data",
                        box_index: index,
                        page: 'Stocking'
                    },
                    dataType: 'HTML',
                }).done(function(html) {
                    
                    $("#lane_info_box").show();
                    $("#lane_status_div").hide();
                    $("#box_information").show();
                    $("#box_information").html(html);
                });

            });


            function go_to_overstock(part) {
                $.ajax({
                    url: "actions.php",
                    method: "post",
                    data: {
                        part: part,
                        action: "go_to_overstock",
                        page: 'Stocking'
                    },
                    dataType: 'JSON',
                }).done(function(result) {
                    console.log(result);
                });
            }

            $("#btn_overstock").on('click', function() {
                var overstock = $(this).val();
                if (overstock == "") {
                    $(this).val('overstock');
                    $(this).removeClass('bg-cyan');
                    $(this).addClass('bg-yellow');
                } else {
                    $(this).val('');
                    $(this).removeClass('bg-yellow');
                    $(this).addClass('bg-cyan');
                }
            });

            $("#btn_overstock_view").on('click', function() {
                $.ajax({
                    url: "actions.php",
                    method: "post",
                    data: {
                        action: "overstock_view",
                    },
                    dataType: "HTML",
                }).done(function(result) {
                    $("#overstock_modal").find('.modal-body').html(result);
                    $("#overstock_modal").modal();
                });
            });

            $("#stocking_action").on('click', function() {
                var stocking_action = $(this).val();
                if (stocking_action == 'in') {
                    $(this).val('out');
                    $(this).text('OUT');
                    $(this).removeClass('btn-primary');
                    $(this).addClass('btn-success');
                    var updated_action = 'out';
                } else {
                    $(this).val('in');
                    $(this).text('IN');
                    $(this).removeClass('btn-success');
                    $(this).addClass('btn-primary');
                    var updated_action = 'in';
                }
                $.ajax({
                    url: "actions.php",
                    method: "post",
                    data: {
                        action: "set_stocking_action",
                        stocking_action: updated_action,
                    },
                }).done(function(result) {
                    // read_area_lane_status($("#request_scan").val(), stocking_action);
                    /*if(updated_action == 'in'){
                        //for in, we should not show empty stock lanes
                        process_no_stock_lanes("hide");
                    }

                    else
                        //for out, we should not show empty stock lanes
                        process_no_stock_lanes("show");*/
                });
            });

            function read_area_lane_status_overview(part_no, direction) {
                $.ajax({
                    url: "actions.php",
                    method: "post",
                    data: {
                        action: "read_area_lane_status_overview",
                        part_no: part_no,
                        page: 'Stocking',
                        direction: direction
                    },
                    dataType: 'HTML',
                }).done(function(html) {
                    $("#lane_status_div").html(html);
                    // $("#lane_status_div").show();

                    if (direction == 'out')
                        //for in, we should not show empty stock lanes
                        process_no_stock_lanes("hide");
                    else
                        //for out, we should not show empty stock lanes
                        process_no_stock_lanes("show");
                });
            }

            function process_no_stock_lanes(flag) {
                var tr_doms = $("#lane_status_div tbody tr");
                if (tr_doms) {
                    for (var i = 0; i < tr_doms.length; i++) {
                        if (tr_doms.eq(i).hasClass("lane_row")) { //if lane number row
                            //get stock value and add hide class if current stock equals to 0
                            var lane_stock_text = tr_doms.eq(i).find("td").last().text();
                            var stock_value = parseInt(lane_stock_text.split("/")[0]);
                            if (stock_value == 0) { //if no stock
                                if (flag == "hide")
                                    tr_doms.eq(i)[0].classList.add('nostock');
                                else
                                    tr_doms.eq(i)[0].classList.remove('nostock');
                            }
                        }
                    }
                }
            }

            $("#area").on('change', function(e) {
                var optionSelected = $("option:selected", this);
                var valueSelected = this.value;
                switch (valueSelected) {
                    case 'HP':
                        // $("#free_location").removeClass("col-sm-7");
                        // $("#free_location").addClass("col-sm-12");
                        // $("#system_fill").removeClass("col-sm-5");
                        // $("#system_fill").removeClass("col-sm-12");
                        // $("#system_fill").hide();
                        $("#lp_table").hide();
                        $("#hp_table").show();
                        break;
                    case 'LP':
                        $("#hp_table").hide();
                        $("#lp_table").show();
                        break;
                    default:
                        $("#lp_table").show();
                        $("#hp_table").show();
                }
            });
        });
    </script>
</body>

</html>