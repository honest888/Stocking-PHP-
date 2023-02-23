<?php
require_once ("config.php");
require_once ("functions.php");
$page_name = "L/P Input";
$_SESSION['page'] = 'system_fill_input.php';
login_check();
require_once ("assets.php");
$shift_inf = get_current_shift();
$booked_in_out = get_booked_in_out('L/P', $shift_inf['shift'], $shift_inf['date']);
?>
<style>
    .table thead>tr>th, tbody>tr>td {
        text-align: center;
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
                    <div class="col-sm-6">
                        <h1 class="m-0" style="display: inline"><?php echo $page_name; ?></h1>
                    </div>
                    <div class="col-sm-6" style="text-align: right;">
                        <button class="btn btn-default" style="min-width: 200px;"><?php echo $_SESSION['user']['username']?></button>
                        <a href="logout.php" class="btn btn-default" style="width: 150px;">LOGOUT</a>
                        <a href="system_fill_overview.php" class="btn btn-primary" style="width: 150px;">OVERVIEW</a>
                        <button id="btn_help" class="btn btn-danger" style="width: 150px;">HELP</button>
                    </div>
                </div>
            </div>
        </div>
        <div class="content">
            <div class="container-fluid">
                <div class="row">
                    <div class="col-md-6">
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

                    <div class="col-md-6">
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
                    <div class="col-sm-12">
                        <div class="card card-primary">
                            <div class="card-body">
                                <table class="table table-bordered table-striped" id="shift_barcode_in_out">
                                    <thead>
                                    <tr>
                                        <th>PART NO.</th>
                                        <th>AREA</th>
                                        <th>LANE</th>
                                        <th>IN/OUT</th>
                                        <th>TIMESTAMP</th>
                                        <th>MEMBER</th>
                                    </tr>
                                    </thead>
                                    <tbody>
                                    <?php
                                    $post_data['page'] = 'L/P';
                                    $post_data['shift_id'] = $shift_inf['shift'];
                                    $post_data['shift_date'] = $shift_inf['date'];
                                    read_scan_table($post_data);
                                    ?>
                                    </tbody>
                                </table>
                            </div>
                            <!-- /.card-body -->
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- /.content-wrapper -->
    <?php include ("footer.php"); ?>
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
        var locktarget = document.querySelector('#locktarget');
        var pointerlockchangeIsFiredonRequest = false;
        var posX = 0
        var posY = 0;
        var event_counter = 0;

        $("#barcode_div").on('click', function () {
            LockTarget();
        });

        document.addEventListener("pointerlockchange", function () {
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

        $("#barcode").on('keyup', function (e) {
            if (e.keyCode == 13) {
                if($(this).hasClass('in')) {
                    var input_kind = $("#input_kind").val();
                    var input = $(this);
                    if(input_kind == "part") {
                        var barcode = $(this).val();
                        if(barcode == "999999") {
                            location.href = 'logout.php';
                            return false;
                        }
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
                    }
                } else{
                    return;
                }
            }
        });

        function barcode_scan() {
            var part = $("#request_scan").val();
            var lane = $("#request_location").val();
            var shift_id = $("#shift_id").val();
            var shift_date = $("#shift_date").val();
            $.ajax({
                url: "actions.php",
                method: "post",
                data: {
                    part:part,
                    lane:lane,
                    action:"read_barcode",
                    shift_id:shift_id,
                    shift_date:shift_date,
                    page:'L/P'
                },
                dataType:'JSON',
            }).done(function (res) {
                //console.log(res);
                $("#request_scan").val('');
                $("#request_location").val('');
                if(res.error == '') {
                    $("#count_booked_in").text(res.booked_in);
                    $("#count_booked_out").text(res.booked_out);
                    read_barcode_table();
                } else {
                    console.log(res.error);
                }
            });
        }

        function read_barcode_table()
        {
            var shift_id = $("#shift_id").val();
            var shift_date = $("#shift_date").val();
            $.ajax({
                url: "actions.php",
                method: "post",
                data: {
                    action:"read_scan_table",
                    shift_id:shift_id,
                    shift_date:shift_date,
                    page:'L/P'
                },
                dataType:'HTML',
            }).done(function (html) {
                $("#shift_barcode_in_out").find('tbody').html(html);
            });
        }

        $("#btn_help").on('click', function () {
            $.ajax({
                url: "actions.php",
                method: "post",
                data: {
                    action:"set_help_alarm"
                },
            }).done(function (result) {

            });
        });
    });
</script>
</body>
</html>
