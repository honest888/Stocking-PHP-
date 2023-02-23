<?php
require_once ("config.php");
require_once ("functions.php");
$page_name = "Conveyance Pick";
$_SESSION['page'] = 'conveyance_pick.php';
login_check();
require_once ("assets.php");
?>
<link rel="stylesheet" href="assets/css/bootstrap-datetimepicker.min.css">
<style>

    .finish-box {
        background-color: #1697FF;
        color: #FFF;
        text-transform: uppercase;
        text-align: center;
    }

    .kanban_input {
        background-color: #58B4FF;
        border-radius: 15px;
        border-color: #58B4FF;
        color: #2E5F87;
        height: 50px;
        text-align: center;
        font-size: 30px;
        text-transform: uppercase;
    }

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

    .blue-kanban {
        background-color: #1697FF;
        color: #FFF;
    }

    .red-kanban {
        background-color: #FF0000;
        color: #FFF;
    }

    .green-kanban {
        background-color: #3AAD00;
        color: #A0D785
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

    .kanban {
        height: 480px;
        text-transform: uppercase;
    }

    .kanban_input:focus {
        background-color: #58B4FF;
    }

    .item-div {
        width: 100%;
        padding: 10px;
        text-align: center
    }

    .date-string {
        color: #000;
        font-size: 26px;
    }

    .pick-list {
        font-size: 40px;
        font-weight: 600;
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
                <div class="row mb-2">
                    <div class="col-sm-12">
                        <h1 class="m-0" style="display: inline"><?php echo $page_name; ?></h1>
                    </div>
                </div>
            </div>
        </div>
        <div class="content">
            <div class="container-fluid">
                <input type="hidden" id="current_kanban_id" value="">
                <div id="locktarget" style="display: none">Target</div>
                <div class="row m-0 p-0 finish-box" id="kanban_area">
                    <div class="col-md-3 align-items-center" style="display: flex">
                        <div id="date_picker" class="text-center" style="width: 100%; font-size: 24px; font-weight: 600">
                            <input class="form-control" type="text" id="pick_date" name="pick_date"
                                   style="display: inline-block; width: 200px;" value="<?php echo date('d/m/Y'); ?>">
                        </div>
                    </div>
                    <div class="col-md-6 text-center">
                        <div class="item-div" id="input_div">
                            <input type="text" class="form-control kanban_input" id="kanban_input" name="kanban_input" autofocus  placeholder="INPUT">
                        </div>
                    </div>
                    <div class="col-md-3 align-items-center" style="display: flex">
                        <button class="btn text-center" id="button_dolly" style="margin: 0 auto; width: 150px; background-color: #3B23A7; color: #FFF;">Dolly</button>
                    </div>
                    <div class="col-md-12 p-2">
                        <h1>Current Pick</h1>
                    </div>

                    <div class="col-md-6">
                        <div class="font-2" style="color: #000;">Kanban</div>
                        <div class="font-5" id="current_kanban"></div>
                        <div class="" id="current_kanban_part_number"></div>
                    </div>
                    <div class="col-md-6">
                        <div class="font-2" style="color: #000;">Address</div>
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
                            <span class="" style="color: #000;">Pick List:</span>
                            <span id="pick_status"> 0/0</span>
                        </div>
                    </div>
                    <div class="col-md-2" style="background-color: #fff; border-right: 0"></div>
                </div>
                <div class="row" id="pick_list">
                    <div class="col-md-6" style="min-height: 360px;"></div>
                    <div class="col-md-6" style="min-height: 360px;"></div>
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
<input type="hidden" id="status" value="pick">

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

        $("#pick_date").datetimepicker({
            format: 'DD/MM/YYYY',
            icons: {
                previous: 'fas fa-angle-left',
                next: 'fas fa-angle-right',
            }
        });

        read_kanban_box();
        read_pick_list();

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


        //Read kanban box
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
                    var current_kanban_html = '<span style="color: #000; font-size: 20px;">Part No.</span><span style="color: #FFF; font-size: 20px;">' + result.part_number + '</span>'
                    $("#current_kanban").text(result.kanban);
                    $("#current_kanban_part_number").html(current_kanban_html);
                    $("#current_address").text(result.address);
                    $("#button_dolly").text(result.dolly_location);
                    $("#button_dolly").css('background-color', result.color);
                    $("#pick_status").text(result.pick_status);
                    if(result.is_help == 1 && result.is_completed == 0) {
                        $("#is_help").val(result.is_help);
                        $(".finish-box").removeClass('blue-kanban');
                        $(".finish-box").removeClass('green-kanban');
                        $(".finish-box").addClass('red-kanban');
                    }

                    if(result.is_help == 0 && result.is_completed == 0) {
                        $(".finish-box").removeClass('green-kanban');
                        $(".finish-box").removeClass('red-kanban');
                        $(".finish-box").addClass('blue-kanban');
                    }

                    if(result.is_help == 0 && result.is_completed == 1) {
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
            $.ajax({
                url: "actions.php",
                method: "post",
                data: {
                    action: 'read_pick_list',
                    pick_date:pick_date,
                    status: 'pick'
                },
                dataType:'HTML',
            }).done(function (result) {
                $("#pick_list").html(result);
            });
        }

        //Check finish button
        function check_finish()
        {
            var pick_date = $("#pick_date").val();
            var status = $("#status").val();
            $.ajax({
                url: "actions.php",
                method: "post",
                data: {
                    action: 'check_pick_finish',
                    pick_date: pick_date,
                    status:status
                },
            }).done(function (result) {
                if(result == 'success') {
                    $("#btn_finish").attr('href', 'conveyance_delivery.php');
                    $("#btn_finish").removeClass('bg-blue');
                    $("#btn_finish").addClass('bg-green');
                }

                if(result == 'in_progress') {
                    $("#btn_finish").attr('href', '#');
                    $("#btn_finish").addClass('bg-blue');
                    $("#btn_finish").removeClass('bg-green');
                }

                if(result == 'in_help') {
                    $("#btn_finish").attr('href', '#');
                    $("#btn_finish").addClass('bg-blue');
                    $("#btn_finish").removeClass('bg-green');
                }
            });
        }

        $('#pick_date').on('dp.change', function(e){
            read_kanban_box();
        });

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
                        status: 'pick'
                    },
                }).done(function (result) {
                    if(result == 'ok') {
                        $(".help-box").addClass('bg-red');
                        $("#btn_finish").addClass('bg-red');
                        $("#kanban_area").removeClass('blue-kanban');
                        $("#kanban_area").addClass('red-kanban');
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
            console.log("Here I am");
            console.log(e.keyCode);
            if (e.keyCode == 13) {
                var value = $(this).val().toUpperCase();
                $("#kanban_id").val(0);
                var kanban_no = $("#current_kanban").text();
                var address = $("#current_address").text();
                console.log("kanban_no");                
                console.log(kanban_no);
                console.log("address");
                console.log(address);
                if(kanban_no != '' || address != '') {
                    if(value == kanban_no || value == address) {
                        var kanban_id = $("#current_kanban_id").val();
                        $.ajax({
                            url: "actions.php",
                            method: "post",
                            data: {
                                kanban_id:kanban_id,
                                action:"conveyance_pick",
                            },
                        }).done(function (result) {
                            $("#kanban_input").val('');
                            $("#kanban_input").focus();
                            if(result == 'ok') {
                                read_kanban_box();
                            }
                            else {
                                alert('Incorrect kanban or address');
                            }
                        });
                    } else {
                        alert('Incorrect kanban or address');
                        $("#kanban_input").val('');
                        $("#kanban_input").focus();
                    }
                }
            }
        });

        $(document).on('click', '#btn_finish', function () {
            var href = $(this).attr('href');
            if(href == '#') {
                alert('You can not finish before complete all kanban');
                return false;
            }
        });

        $(document).on('click', '.select-kanban', function () {
            var kanban_id = $(this).attr('data-kanban');
            $("#kanban_id").val(kanban_id);
            $("#current_kanban_id").val(kanban_id);
            read_kanban_box();
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
                //$("#kanban_area").addClass('blue-kanban');
                $("#kanban_area").removeClass('red-kanban');
                $("#is_help").val('0');
                read_pick_list();
                check_finish();
            });
        });
    });
</script>
</body>
</html>
