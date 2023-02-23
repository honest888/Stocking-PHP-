<?php
require_once("config.php");
require_once("functions.php");
$page_name = "Container Devan Member";
$_SESSION['page'] = 'container_devan_member.php';
login_check();
require_once("assets.php");
?>
<link rel="stylesheet" href="assets/css/bootstrap-datetimepicker.min.css">
<style>
    .bootstrap-datetimepicker-widget table thead th {
        background: #fff;
    }

    .bootstrap-datetimepicker-widget tbody tr:last-child th,
    .bootstrap-datetimepicker-widget tbody tr:last-child>td {
        border-bottom: 0;
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
                        <div class="col-sm-4">
                            <h1 class="m-0" style="display: inline"><?php echo $page_name; ?></h1>
                        </div>
                        <div class="col-sm-3">
                            <button class="btn btn-default" style="width: 250px;" id="renban_button">Revan</button>
                        </div>
                        <div class="col-sm-5" style="text-align: right;">
                            <button class="btn btn-default" style="min-width: 200px;"><?php echo $_SESSION['user']['username'] ?></button>
                            <a href="logout.php" class="btn btn-default" style="width: 150px;">LOGOUT</a>
                            <input class="form-control" type="text" id="date" name="date" style="display: inline-block; width: 200px;" value="<?php echo date('d/m/Y'); ?>">
                            <button class="btn btn-success" id="btn_load_data">Load Data</button>
                        </div>
                    </div>
                </div>
            </div>
            <div class="content">
                <div class="container-fluid">
                    <div class="row">
                        <div class="col-md-12" id="revan_label" style="background-color: black; color: yellow; display: none;">
                            <h2 style="text-align: center; padding: 15px;font-size: 3em;">REVAN</h2>
                        </div>
                        <div class="col-md-12">
                            <div class="card">
                                <div class="card-body" id="member_input_screen" style="padding: 0">

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
    <input type="hidden" id="session_user_name" value="<?php echo $_SESSION['user']['username']; ?>">

    <div class="modal fade" id="help_modal">
        <div class="modal-dialog">
            <div class="modal-content bg-danger">
                <div class="modal-header">
                    <h4 class="modal-title">ANDON HELP</h4>
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
                    foreach ($users as $user) {
                        if ($user['type'] == 1)
                            echo '<option value="' . $user['user_id'] . '">' . $user['username'] . '</option>';
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
            $("#date").datetimepicker({
                format: 'DD/MM/YYYY',
                icons: {
                    previous: 'fas fa-angle-left',
                    next: 'fas fa-angle-right',
                }
            });

            $("#renban_button").on('click', function() {
                $("#container_number_modal").modal();
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
                        $("#container_number").val('');
                        console.log(result);
                    }
                });

            });

            read_container_devan_member_screen('today');

            $("#btn_load_data").on('click', function() {
                var date = $("#date").val();
                if (date == '') {
                    $("#date").focus();
                    return false;
                }
                read_container_devan_member_screen(date);
            });

            function read_container_devan_member_screen(date) {
                $.ajax({
                    url: "actions.php",
                    method: "post",
                    data: {
                        'action': 'read_container_devan_member_screen',
                        'date': date
                    },
                    dataType: 'HTML',
                }).done(function(html) {
                    $("#member_input_screen").html(html);
                });
            }

            $(document).on('click', '#btn_chk_container_renban', function() {
                var expected_container_renban = $(this).val();
                var container_renban = $("#container_renban").val();
                if (container_renban == "") {
                    $("#container_renban").focus();
                    return false;
                }

                if (expected_container_renban.toLowerCase() == container_renban.toLowerCase()) {
                    $("#member_input_screen").find('.row').css('background-color', 'green');
                    $("#renban_button").removeClass('btn-default');
                    $("#renban_button").addClass('btn-success');
                    $("#btn_complete").prop('disabled', false);
                    $("#btn_complete").attr('data-renban', 'revan');
                } else {
                    $("#container_renban").focus();
                    alert('Container Renban is wrong!');
                    $("#member_input_screen").find('.row').css('background-color', 'red');
                    $("#renban_button").removeClass('btn-success');
                    $("#renban_button").addClass('btn-default');
                    $("#btn_complete").prop('disabled', true);
                    $("#btn_complete").attr('data-renban', 'check');
                }
            });

            $(document).on('click', '#btn_complete', function() {
                var row_id = $(this).val();
                var renban = $(this).attr('data-renban');
                $.ajax({
                    url: "actions.php",
                    method: "post",
                    data: {
                        'action': 'complete_container_devan',
                        'row_id': row_id,
                        'renban': renban,
                    },
                }).done(function(result) {
                    if (renban == 'revan') {
                        if ($("#btn_chk_container_renban").data("revan") == 'scheduled') {
                            $("#btn_chk_container_renban").data("revan", "")
                            $("#btn_complete").attr('data-renban', 'confirm');
                            $("#container_renban").prop('readonly', true);
                            $("#btn_chk_container_renban").prop('disabled', true);
                            $("#revan_label").show();
                            $("#renban_no").text(result);
                        } else {
                            $("#btn_chk_container_renban").data("revan", "")
                            $("#btn_complete").attr('data-renban', 'confirm');
                            $("#container_renban").prop('readonly', true);
                            $("#btn_chk_container_renban").prop('disabled', true);
                            $("#renban_no").text(result);
                            $.ajax({
                                url: "actions.php",
                                method: "post",
                                data: {
                                    'action': 'complete_container_devan',
                                    'row_id': row_id,
                                    'renban': "confirm"
                                },
                            }).done(function(result) {
                                var date = $("#date").val();
                                $("#revan_label").hide();
                                read_container_devan_member_screen(date);
                            })
                        }
                    } else {
                        var date = $("#date").val();
                        $("#revan_label").hide();
                        read_container_devan_member_screen(date);
                    }

                });
            });

            /*
            Help Button
             */
            $(document).on('click', '.devan-help', function() {
                $(this).removeClass('bg-yellow');
                $(this).addClass('bg-red');
                $.ajax({
                    url: "actions.php",
                    method: "post",
                    data: {
                        action: "set_help_alarm",
                        page: 'Container Devan'
                    },
                    dataType: 'HTML',
                }).done(function(html) {
                    $("#help_modal").find('.modal-body').html(html);
                    $("#help_modal").modal({
                        backdrop: 'static',
                        keyboard: false
                    });
                });

            });

            $("#confirm_help").on('click', function() {
                $("#confirm_help_alarm_id").val($("#help_alarm_id").val());
                $("#confirm_user_modal").modal({
                    backdrop: 'static',
                    keyboard: false
                })
            });

            $("#confirm_help_with_user").on('click', function() {
                if ($("#confirm_user_id").val() == '') {
                    $("#confirm_user_id").focus();
                    return false;
                }
                var confirm_user_id = $("#confirm_user_id").val();
                var alarm_id = $("#confirm_help_alarm_id").val();
                $.ajax({
                    url: "actions.php",
                    method: "post",
                    data: {
                        action: "confirm_help_alarm",
                        confirm_user_id: confirm_user_id,
                        alarm_id: alarm_id
                    },
                    dataType: 'HTML',
                }).done(function(html) {
                    $("#confirm_user_modal").modal('hide');
                    $(".devan-help").removeClass('bg-red');
                    $(".devan-help").addClass('bg-yellow');
                });
            });

        });
    </script>
</body>

</html>