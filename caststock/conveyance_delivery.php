<?php
require_once ("config.php");
require_once ("functions.php");
$page_name = "Conveyance Delivery";
$_SESSION['page'] = 'conveyance_delivery.php';
login_check();
require_once ("assets.php");
?>
<link rel="stylesheet" href="assets/css/bootstrap-datetimepicker.min.css">
<style>
    .font-2 {
        font-size: 2rem;
    }

    .font-3 {
        font-size: 3rem;
    }

    .font-5 {
        font-size: 5rem;
    }

    .action {
        height: 64px;
        color: #FFF;
        text-transform: uppercase;
        font-size: 30px;
        font-weight: 600;
        width: 200px;
    }

    .kanban {
        height: 480px;
        text-transform: uppercase;
    }

    .start-kanban {
        background-color: #053C48;
        color: #FFF;
        height: auto;
        text-transform: uppercase;
        text-align: center;
    }

    .kanban_input{
        background-color: #4D737C;
        border-radius: 15px;
        border-color: #4D737C;
        color: #283C41;
        height: 50px;
        margin: 0 auto;
        text-align: center;
        font-size: 30px;
        text-transform: uppercase;
    }

    .kanban_input:focus {
        background-color: #4D737C;
        border-color: #4D737C;
    }

    #start_button {
        width: 180px;
        height: 180px;
        font-size: 40px;
        text-transform: uppercase;
        border-radius: 90px;
    }

    .red-kanban {
        background-color: #FF0000;
        color: #FFF;
    }

    .green-kanban{
        background-color: #3AAD00;
        color: #A0D785
    }

    .blue-kanban{
        background-color: #053C48;
        color: #FFF;
    }

    .grey-kanban{
        background-color: #E6E7E6;
        color: #FFF;
    }

    .action {
        height: 50px;
        color: #FFF;
        text-transform: uppercase;
        font-size: 20px;
        font-weight: 500;
    }

    .logout-box{
        background-color: #1697FF;
    }

    .help-box{
        background-color: #FFAE00;
    }

    .item-div {
        width: 100%;
        padding: 10px;
        text-align: center
    }

    .date-string {
        color: #b8b7b7;
        font-size: 26px;
    }

    .pick-list {
        font-size: 40px;
        font-weight: 600;
    }

    .completed-kanban {
        color:green;
        text-decoration: line-through;
        font-size: 20px;
    }

    .uncompleted-kanban {
        color: #000;
        font-size: 20px;
    }

    .helped-kanban {
        color: red;
        font-size: 20px;
    }

    .select-kanban {
        cursor: pointer;
    }

</style>
<body class="hold-transition sidebar-collapse layout-top-nav" onload="startTime()">
<div class="wrapper">
    <?php include("header.php"); ?>
    <?php include("menu.php"); ?>
    <div class="content-wrapper">
        <div class="content-header">
            <div class="container-fluid">
                <div id="locktarget" style="display: none">Target</div>
                <div class="row mb-2">
                    <div class="col-sm-12">
                        <h1 class="m-0" style="display: inline"><?php echo $page_name; ?></h1>
                    </div>
                </div>
            </div>
        </div>
        <div class="content">
            <div class="container-fluid">
                <div class="row m-0 p-0 start-kanban" id="start_area">
                    <div class="col-md-2" style="padding-top: 20px;">
                        <div id="date_picker" class="text-center" style="width: 100%; font-size: 24px; font-weight: 600">
                            <input class="form-control pick_date" type="text"
                                   style="display: inline-block; width: 200px;" value="<?php echo date('d/m/Y'); ?>">
                        </div>
                    </div>
                    <div class="col-md-8" style="padding-top: 20px;">
                        <input type="text" class="form-control kanban_input" id="start_kanban_input" placeholder="INPUT">
                    </div>
                    <div class="col-md-2"></div>
                    <div class="col-md-12 align-items-center" style="display: flex; min-height: 200px;">
                        <h1 style="text-align: center; width: 100%;">Please start delivery</h1>
                    </div>
                    <div class="col-md-12" style="min-height: 250px;">
                        <button class="btn btn-success" id="start_button">Start</button>
                    </div>
                </div>

                <div class="row m-0 p-0" id="delivery_area" style="display: none;">
                    <div class="col-md-12">
                        <input type="hidden" id="current_kanban_id" value="">
                        <div id="locktarget" style="display: none">Target</div>
                        <div class="row m-0 p-0 start-kanban finish-box" id="kanban_area">
                            <div class="col-md-3 align-items-center" style="display: flex">
                                <div id="date_picker" class="text-center" style="width: 100%; font-size: 24px; font-weight: 600">
                                    <input class="form-control pick_date" type="text" id="pick_date" name="pick_date"
                                           style="display: inline-block; width: 200px;" value="<?php echo date('d/m/Y'); ?>">
                                </div>
                            </div>
                            <div class="col-md-6 text-center">
                                <div class="item-div" id="input_div">
                                    <input type="text" class="form-control kanban_input" id="kanban_input" name="kanban_input" autofocus placeholder="kanban">
                                </div>
                            </div>
                            <div class="col-md-3 align-items-center" style="display: flex">
                                <button class="btn text-center" id="button_dolly" style="margin: 0 auto; width: 150px; background-color: #3B23A7; color: #FFF;">Dolly</button>
                            </div>
                            <div class="col-md-12 p-2">
                                <h1>Current Pick</h1>
                            </div>

                            <div class="col-md-6">
                                <div class="font-2" style="color: #9E9E9E;">Kanban</div>
                                <div class="font-5" id="current_kanban"></div>
                                <div class="" id="current_kanban_part_number"></div>
                            </div>
                            <div class="col-md-6">
                                <div class="font-2" style="color: #9E9E9E;">Address</div>
                                <div class="font-5" id="current_address"></div>
                            </div>

                            <div class="col-md-6 p-2">
                                <button class="btn bg-red action" id="andon_help">Help</button>
                            </div>
                            <div class="col-md-6 p-2">
                                <a class="btn action bg-blue" id="btn_finish" style="background-color:#00FF51; padding-top: 10px;">Finish</a>
                            </div>

                            <div class="col-md-2" style="background-color: #fff;"></div>
                            <div class="col-md-8">
                                <div class="font-3">
                                    <span class="" style="color: #9E9E9E;">Delivery List:</span>
                                    <span id="pick_status"> 0/0</span>
                                </div>
                            </div>
                            <div class="col-md-2" style="background-color: #fff; border-right: 0"></div>
                        </div>
                        <div class="row" id="pick_list">
                            <div class="col-md-6" style="min-height: 360px;"></div>
                            <div class="col-md-6" style="min-height: 360px;"></div>
                        </div>
                    </div>
                </div>

                <div class="row m-0 p-0 finish-box">
                    <div class="col-md-12 align-items-center" style="display: flex; height: 40px; text-align: center">
                        <div class="text-center" style="width: 100%; font-size: 24px; font-weight: 600;">
                            <a href="logout.php" style="color: #FFF;"><?php echo $_SESSION['user']['username']?>: Logout</a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- /.content-wrapper -->
    <?php include ("footer.php"); ?>
</div>

<input type="hidden" id="kanban_id" value="0">
<input type="hidden" id="is_help" value="0">
<input type="hidden" id="status" value="delivery">
<input type="hidden" id="input_type" value="kanban">

<div class="modal fade" id="confirm_user_modal">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h4 class="modal-title">Select User</h4>
            </div>
            <div class="modal-body">
                <?php
                $users = get_all_users();
                echo '<select class="form-control" id="confirm_user_id" name="confirm_user_id">';
                echo '<option></option>';
                foreach ($users as $user){
                    if($user['type'] == 1)
                        echo '<option value="'.$user['user_id'].'">'.$user['username'].'</option>';
                }
                echo '</select>';
                ?>
                <input type="hidden" id="confirm_help_alarm_id">
            </div>
            <div class="modal-footer justify-content-center">
                <button type="button" class="btn btn-success" id="confirm_help_with_user" style="width: 160px;">OK</button>
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

        $(".pick_date").datetimepicker({
            format: 'DD/MM/YYYY',
            icons: {
                previous: 'fas fa-angle-left',
                next: 'fas fa-angle-right',
            }
        });

        /*
        Lock input
        */
        var locktarget = document.querySelector('#locktarget');
        var pointerlockchangeIsFiredonRequest = false;
        var posX = posY = 0;
        var event_counter = 0;
        var request_counter = 0;

        $(document).on('click', "#input_div", function () {
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
            /*reenterPointerLockTest.step(function() {
             assert_true(document.pointerLockElement === locktarget, "Pointer is locked again without engagement gesture");
             });

             lock_log.innerHTML = "Status: Exited pointer lock; Please click the 'Repeat Lock' button and exit the lock.";

             reenterPointerLockTest.done();*/
        }

        function runRepeatLockPointerTest() {
            repeatLockPointerTest.step(function () {
                assert_equals(request_counter + 5, event_counter, "Each requestPointerLock() will fire a pointerlockchange event");
            });

            lock_log.innerHTML = "Status: Test over.";

            repeatLockPointerTest.done();
        }

        function LockTarget() {
            locktarget.requestPointerLock();
        }


        $("#start_button").on('click', function () {
            $("#start_area").hide();
            $("#delivery_area").show();
            read_kanban_box();
        });

        $(document).on('keypress', "#start_kanban_input", function (e) {
            if (e.keyCode == 13) {
                var value = $(this).val();
                alert(value);
                if(value != "") {
                    $("#start_area").hide();
                    $("#delivery_area").show();
                    $(".logout-box").css('background-color', '#053C48');
                    $(".finish-box").css('background-color', '#053C48');
                    read_kanban_box();
                } else {
                    return false;
                }
            }
        });

        $('#pick_date').on('dp.change', function(e){
            read_kanban_box();
        })


        function read_kanban_box()
        {
            var pick_date = $("#pick_date").val();
            var kanban_id = $("#kanban_id").val();
            var status = $("#status").val();
            $.ajax({
                url: "actions.php",
                method: "post",
                data: {
                    action: 'read_kanban_box',
                    pick_date:pick_date,
                    kanban_id:kanban_id,
                    status:status,
                },
                dataType:'JSON',
            }).done(function (result) {
                if(result.error) {
                    alert(result.error);
                    return false;
                } else {
                    $("#current_kanban_id").val(result.kanban_id);
                    var current_kanban_html = '<span style="color: #9E9E9E; font-size: 20px;">Part No.</span><span style="color: #FFF; font-size: 20px;">' + result.part_number + '</span>'
                    $("#current_kanban").text(result.kanban);
                    $("#current_kanban_part_number").html(current_kanban_html);
                    $("#current_address").text(result.delivery_address);
                    $("#button_dolly").text(result.dolly_location);
                    $("#button_dolly").css('background-color', result.color);
                    $("#pick_status").text(result.pick_status);
                    if(result.is_help == 1 && result.is_delivered == 0) {
                        $("#is_help").val(result.is_help);
                        $(".finish-box").removeClass('blue-kanban');
                        $(".finish-box").removeClass('green-kanban');
                        $(".finish-box").addClass('red-kanban');
                    }

                    if(result.is_help == 0 && result.is_delivered == 0) {
                        $(".finish-box").removeClass('green-kanban');
                        $(".finish-box").removeClass('red-kanban');
                        $(".finish-box").addClass('blue-kanban');
                    }

                    if(result.is_help == 0 && result.is_delivered == 1) {
                        $(".finish-box").removeClass('blue-kanban');
                        $(".finish-box").removeClass('red-kanban');
                        $(".finish-box").addClass('green-kanban');
                    }
                    check_finish();
                    read_pick_list();
                }
            });
        }

        //Kanban List
        function read_pick_list()
        {
            var pick_date = $("#pick_date").val();
            var status = $("#status").val();
            $.ajax({
                url: "actions.php",
                method: "post",
                data: {
                    action: 'read_pick_list',
                    pick_date:pick_date,
                    status: status
                },
                dataType:'HTML',
            }).done(function (result) {
                $("#pick_list").html(result);
            });
        }

        function check_finish()
        {
            var status = $("#status").val();
            var pick_date  = $("#pick_date ").val();
            $.ajax({
                url: "actions.php",
                method: "post",
                data: {
                    action: 'check_pick_finish',
                    status:status,
                    pick_date:pick_date
                },
            }).done(function (result) {
                if(result == 'success') {
                    $("#btn_finish").attr('href', 'conveyance_delivery.php');
                    $(".finish-box").addClass('bg-green');
                    $("#btn_finish").attr('href', 'logout.php');
                }

                if(result == 'in_progress') {
                    $("#btn_finish").attr('href', '#');
                    $(".finish-box").removeClass('bg-green');
                    $(".finish-box").removeClass('bg-red');
                }

                if(result == 'in_help') {
                    $("#btn_finish").attr('href', '#');
                    $(".finish-box").removeClass('bg-green');
                    $(".finish-box").addClass('bg-red');
                }
            });
        }

        $(document).on('click', '#andon_help', function () {
            if($("#current_kanban_id").length == 0 || $("#current_kanban_id").val()=='')
                return false;
            var kanban_id = $("#current_kanban_id").val();
            var is_help = $("#is_help").val();
            if(is_help == 0) {
                $.ajax({
                    url: "actions.php",
                    method: "post",
                    data: {
                        kanban_id:kanban_id,
                        action:"conveyance_andon_help",
                        status: 'delivery'
                    },
                }).done(function (result) {
                    if(result == 'ok') {
                        $(".help-box").addClass('bg-red');
                        $(".finish-box").addClass('bg-red');
                        $(".start-kanban").removeClass('blue-kanban');
                        $(".start-kanban").addClass('red-kanban');
                        $("#is_help").val('1');
                        read_pick_list();
                    } else {
                        alert('Help failed');
                    }
                });
            } else {
                $("#confirm_user_modal").modal({
                    backdrop: 'static',
                    keyboard: false
                });
            }
        });
        $(document).on('keypress', "#kanban_input", function (e) {
            if (e.keyCode == 13) {
                $("#kanban_id").val(0);
                var value = $(this).val().toUpperCase();
                var input_type = $("#input_type").val();
                var kanban_no = $("#current_kanban").text();
                var location = $("#current_address").text();

                if(input_type == 'kanban') {
                    if(value != kanban_no) {
                        alert('Error kanban scan ' + kanban_no + 'not ' + value);
                        $("#kanban_input").val('');
                        $("#kanban_input").focus();
                        return false;
                    } else {
                        $("#input_type").val('location');
                        $("#kanban_input").val('');
                        $("#kanban_input").attr('placeholder', 'Address');
                        $("#kanban_input").focus();
                        return false;
                    }
                }

                if(input_type == 'location') {
                    if(value != location) {
                        alert('Error Wrong location');
                        $("#kanban_input").val('');
                        $("#kanban_input").focus();
                        return false;
                    } else {
                        var kanban_id = $("#current_kanban_id").val();
                        $.ajax({
                            url: "actions.php",
                            method: "post",
                            data: {
                                input_type:input_type,
                                kanban_id:kanban_id,
                                action:"conveyance_delivery",
                            },
                        }).done(function (result) {
                            if(result == 'ok') {
                                $("#kanban_input").val('');
                                $("#kanban_input").focus();
                                $("#kanban_input").attr('placeholder', 'Kanban');
                                $("#input_type").val('kanban');
                                read_kanban_box();
                            }
                            else {
                                alert('Incorrect kanban or address');
                            }
                        });
                    }
                }
            }
        });

        $(document).on('click', '#btn_finish', function () {
            var href = $(this).attr('href');
            if(href == '#') {
                alert('You can not finish before delivery all kanban');
                return false;
            }
        });

        $("#confirm_help_with_user").on('click', function () {
            if($("#current_kanban_id").length == 0 || $("#current_kanban_id").val()=='')
                return false;
            var kanban_id = $("#current_kanban_id").val();
            var confirm_user_id = $("#confirm_user_id").val();
            $.ajax({
                url: "actions.php",
                method: "post",
                data: {
                    action:"confirm_conveyance_andon_help",
                    confirm_user_id:confirm_user_id,
                    kanban_id:kanban_id
                },
                dataType:'HTML',
            }).done(function (html) {
                $("#confirm_user_modal").modal('hide');
                $(".help-box").removeClass('bg-red');
                $("#btn_finish").removeClass('bg-red');
                $(".finish-box").removeClass('red-kanban');
                $("#kanban_area").removeClass('red-kanban');
                $("#is_help").val('0');
                read_pick_list();
                check_finish();
            });
        });

        $(document).on('click', '.select-kanban', function () {
            var kanban_id = $(this).attr('data-kanban');
            $("#kanban_id").val(kanban_id);
            $("#current_kanban_id").val(kanban_id);
            read_kanban_box();
        });

    });
</script>
</body>
</html>
