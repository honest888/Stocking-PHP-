<?php
require_once("config.php");
require_once("functions.php");
$page_name = "MBR INPUT/OUTPUT";
$_SESSION['page'] = 'stocking_input.php';
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

	.input_title (
	color: red;
)
.btn-primary {
    color: #fff;
    background-color: #e62a2c;
    border-color: #e62a2c;
    box-shadow: none;
}


    .nostock {
        display: none;
    }
	.card-primary:not(.card-outline)>.card-header {
    background-color: #59595b;
}

    .oldest_info_div {
        background-color: #59595b;
        padding: 20px 0;
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
                        <div class="col-sm-4" style="text-align: center;">
                            <button class="btn bg-cyan" style="width: 160px; display: none;margin-right: 20px;" id="btn_overstock" value="">Overstock</button>
                            <?php
                            if ($_SESSION['stocking_action'] == 'in') {
                                echo '<button type="button" class="btn btn-primary" id="stocking_action" style="width: 160px; " value="in">IN</button>';
                            } else {
                                echo '<button type="button" class="btn btn-success" id="stocking_action" style="width: 160px;" value="out">OUT</button>';
                            }
                            ?>                            
							&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="stocking_overview.php" class="btn btn-primary" style="width: 150px; background-color:#59595b; border-color:#59595b;">OVERVIEW</a>

                            <button class="btn bg-gray-dark" style="display: none;width: 160px; margin-left: 20px; background-color:#59595b:" id="btn_overstock_view">Overstock View</button>
                        </div>
						
                        <div class="col-sm-6" style="text-align: right;">
						
                            <button class="btn btn-default" style="min-width: 200px;">USER:&nbsp;&nbsp;<?php echo $_SESSION ['user']['username'] ?></button>&nbsp;&nbsp;
                            <a href="logout.php" class="btn btn-success" style="width: 150px;">LOGOUT</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            <button id="btn_help" class="btn btn-danger" style="width: 150px;">HELP</button>
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
                        <div class="col-md-12">
                            <div class="card card-primary">
                                <div class="card-header">
                                    <h3 class="card-title">BARCODE INPUT</h3>
                                </div>
                                <!-- /.card-header -->
                                <div class="card-body" style="height: 120px;">
                                    <div class="row">
                                        <div class="col-sm-12">
                                            <label id="input_title">ENTER PART BARCODE</label>
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
                        <div class="col-md-12">
                            <div class="card card-primary">
                                <div class="card-body" id="lane_status_div" style="min-height: 300px;">

                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!-- /.content-wrapper -->
            <?php include("footer.php"); ?>
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

        <!-- Notification/confirm modal -->
        <div class="modal fade" id="notification_modal" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <h4 class="modal-title"><i class="icon fas fa-check"></i> <span></span></h4>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">×</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        <h4></h4>
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
                $(document).keypress(function (event) {  
                // console.log(event.key);
                $("#barcode").focus();
            });
                /*
                Lock Screen for input
                 */
                var locktarget = document.querySelector('#locktarget');
                var pointerlockchangeIsFiredonRequest = false;
                var posX = 0
                var posY = 0;
                var event_counter = 0;

                $("#barcode_div").on('click', function () {
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


                /*
                Input Barcode
                 */
                $("#barcode").on('keyup', function(e) {
                    if (e.keyCode == 13) {
                        perform_stock_operation();
                        /*var overstock = $("#btn_overstock").val();
                        if($(this).hasClass('in')) {
                            var input_kind = $("#input_kind").val();
                            var input = $(this);
                            if(input_kind == "part") {
                                var barcode = $(this).val();
                                if(barcode == "999999") {
                                    location.href = 'logout.php';
                                    return false;
                                }
                                if(overstock == "overstock") {
                                    go_to_overstock(barcode);
                                    input.val('');
                                    $("#success_message").text(barcode + " has been added to overstock");
                                    $(".alert-success").fadeTo(2000, 500).slideUp(500, function () {
                                        $(".alert-success").slideUp(500);
                                    });
                                    return false;
                                } else {
                                    var scanned_barcode = $("#scanned_barcode").val();
                                    var request_scan = $("#request_scan").val();

                                    if(request_scan == ""){
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
                                    read_area_lane_status(barcode);
                                }

                            } else {
                                var tool_location = $(this).val();
                                if(tool_location == "999999") {
                                    location.href = 'logout.php';
                                    return false;
                                }
                                var request_location = $("#request_location").val();
                                if(request_location == ""){
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
                                //read_area_lane_status('')
                            }
                        } else{
                            return;
                        }*/
                    }
                });

                function perform_stock_operation() {
                    var overstock = $("#btn_overstock").val();
                    if ($("#barcode").hasClass('in')) {
                        var input_kind = $("#input_kind").val();
                        var input = $("#barcode");
                        if (input_kind == "part") {
                            var barcode = $("#barcode").val();
                            if (barcode == "999999") {
                                location.href = 'logout.php';
                                return false;
                            }
                            if (overstock == "overstock") {
                                go_to_overstock(barcode);
                                input.val('');
                                $("#success_message").text(barcode + " has been added to overstock");
                                $(".alert-success").fadeTo(2000, 500).slideUp(500, function() {
                                    $(".alert-success").slideUp(500);
                                });
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
                                read_area_lane_status(barcode, $("#stocking_action").val());
                            }

                        } else {
                            var tool_location = $("#barcode").val();
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
                            //read_area_lane_status('')
                        }
                    } else {
                        return;
                    }
                }

                function barcode_scan() {
                    var part = $("#request_scan").val();
                    var lane = $("#request_location").val();
                    var shift_id = $("#shift_id").val();
                    var shift_date = $("#shift_date").val();
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
                        $(".oldest_info_div").hide();
                        if (result.error != '') {
                            //confirm pop up
                            $("#notification_modal").modal();
                            $("#notification_modal .modal-title span").text("Error");
                            $("#notification_modal .modal-body h4").text(result.error);
                        } else {
                            //confirm pop up
                            $("#notification_modal").modal();
                            $("#notification_modal .modal-title span").text("Success");
                            $("#notification_modal .modal-body h4").text(result.success);
                        }
                        $("#notification_modal").on("hidden.bs.modal", function() {
                            $("#barcode").focus();
                            location.reload()
                        })
                        $("#request_scan").val('');
                        $("#request_location").val('');
                    });
                }

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
                        $("#success_message").text("Just " + part + " has been added to overstack");
                        $(".alert-success").fadeTo(2000, 500).slideUp(500, function() {
                            $(".alert-success").slideUp(500);
                        });
                    });
                }
                /*
                Read Status of Area and Lanes
                 */

                function read_area_lane_status(part_no, direction) {
                    $.ajax({
                        url: "actions.php",
                        method: "post",
                        data: {
                            action: "read_area_lane_status",
                            part_no: part_no,
                            page: 'Stocking',
                            direction: direction
                        },
                        dataType: 'HTML',
                    }).done(function(html) {
                        $("#lane_status_div").html(html);

                        if (direction == 'out')
                            //for in, we should not show empty stock lanes
                            process_no_stock_lanes("hide");
                        else
                            //for out, we should not show empty stock lanes
                            process_no_stock_lanes("show");
                    });
                }

                $("#btn_help").on('click', function() {
                    $.ajax({
                        url: "actions.php",
                        method: "post",
                        data: {
                            action: "set_help_alarm",
                            page: 'Stocking'
                        },
                    }).done(function(result) {

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
                        read_area_lane_status($("#request_scan").val(), stocking_action);
                        /*if(updated_action == 'in'){
                            //for in, we should not show empty stock lanes
                            process_no_stock_lanes("hide");
                        }

                        else
                            //for out, we should not show empty stock lanes
                            process_no_stock_lanes("show");*/
                    });
                });

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

                /*Lane row clickable*/
                $(document).on("click", ".lane_row", function(e) {
                    var lane = $(this).data("lane");
                    var lane_id = lane.split(" ")[1];
                    //get barcode_in from lane_no
                    get_barcodein_from_laneno(lane_id);

                    //do visually update stock in/out
                    update_available_lane_stocks($(this));
                });

                //do visually update stock in/out without reloading of the pages
                function update_available_lane_stocks(lane_dom) {
                    var stock_dom = lane_dom.find("td").last().text();
                    var stock_value = parseInt(stock_dom.split("/")[0]);
                    var stock_total = parseInt(stock_dom.split("/")[1]);
                    //if currently stock in, we add 1 otherwise decrease 1, for 0, we show an alert
                    if ($("#stocking_action").val() == "in") {
                        //if($("#barcode").hasClass('in')){
                        stock_value = stock_value + 1;
                    } else
                        stock_value = stock_value - 1;

                    if (stock_value <= 0)
                        stock_value = 0;

                    var updated_stock_text = stock_value + "/" + stock_total;
                    lane_dom.find("td").last().text(updated_stock_text);
                }

                //get barcode in from the lane number when user press lane row in the table
                function get_barcodein_from_laneno(lane_id) {
                    $.ajax({
                        url: "actions.php",
                        method: "post",
                        data: {
                            action: "get_barcodein_from_laneno",
                            lane_id: lane_id,
                        },
                    }).done(function(result) {
                        if (result == "failure")
                            alert("Unable to process at the moment.");
                        else {
                            $("#barcode").val(result);
                            //do stock in/out operation in backend
                            perform_stock_operation();
                        }
                        console.log(result);
                    });
                }
                $('#notification_modal').on('show.bs.modal', function() {
                    var myModal = $(this);
                    clearTimeout(myModal.data('hideInterval'));
                    myModal.data('hideInterval', setTimeout(function() {
                        myModal.modal('hide');
                    }, 5000));
                });
            });
        </script>
</body>

</html>