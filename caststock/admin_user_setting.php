<?php
require_once ("config.php");
require_once ("functions.php");
$page_name = "User Setting";
require_once ("assets.php");
?>
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
                        <button class="btn btn-success float-right" type="button" id="add_user">Add User</button>
                    </div>
                </div>
            </div>
        </div>
        <div class="content">
            <div class="container-fluid">
                <div class="row">
                    <div class="col-lg-12">
                        <div class="card">
                            <div class="card-body">
                                <table class="table table-bordered table-striped" id="user_table">
                                    <thead>
                                    <tr>
                                        <th>Name</th>
                                        <th>Staff ID</th>
                                        <th>Role</th>
                                        <th>Last Login</th>
                                        <th style="width: 120px;"></th>
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
    <!-- /.content-wrapper -->
    <?php include ("footer.php"); ?>
</div>
<div class="modal fade" id="user_modal">
    <div class="modal-dialog">
        <div class="modal-content">
            <form id="user_form">
                <div class="modal-header">
                    <h4 class="modal-title">Add New User</h4>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <div class="form-group">
                        <label for="username">Username</label>
                        <input type="text" class="form-control" id="username" name="username" placeholder="User Name" required>
                    </div>
                    <div class="form-group">
                        <label for="staff">Staff ID</label>
                        <input type="text" class="form-control" id="staff" name="staff" placeholder="Staff ID" required>
                    </div>
                    <div class="form-group">
                        <label for="user_type">User Type</label>
                        <select name="user_type" id="user_type" class="form-control">
                            <option value="0">User</option>
                            <option value="1">Administrator</option>
                        </select>
                    </div>
                    <input type="hidden" id="user_id" name="user_id" value="0">
                    <input type="hidden" id="action" name="action" value="save_user">
                </div>
                <div class="modal-footer justify-content-between">
                    <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                    <button type="submit" class="btn btn-primary" id="btn_save_user">Submit</button>
                </div>
            </form>
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
<!-- AdminLTE App -->
<script src="assets/js/adminlte.min.js"></script>
<script src="assets/js/custom.js"></script>
<script>
    $(document).ready(function() {
        read_users();
        //Add User
        $("#add_user").on('click', function () {
            $("#username").val('');
            $("#staff").val('');
            $("#user_type").val(0);
            $("#user_id").val('');
            $("#user_modal").find(".modal-title").text('Add New User');
            $("#user_modal").modal();
        });

        $("#user_form").on('submit', function (e) {
            e.preventDefault();
            $.ajax({
                url: "actions.php",
                method: "post",
                data: $("#user_form").serialize(),
            }).done(function (result) {
                if(result == 'Ok') {
                    read_users();
                    $("#user_modal").modal('hide');
                } else {
                    alert('Save failed');
                    return false;
                }
            });
        });

        //Edit User
        $(document).on('click', '.edit-user', function () {
            var user_id = $(this).val();
            $.ajax({
                url: "actions.php",
                method: "post",
                data: {
                    user_id:user_id,
                    action: 'read_user'
                },
                dataType:'JSON'
            }).done(function (result) {
                $("#username").val(result.username);
                $("#staff").val(result.staff);
                $("#user_type").val(result.type);
                $("#user_id").val(user_id);
                $("#user_modal").find(".modal-title").text('User Information');
                $("#user_modal").modal();
            });
        });

        //Delete User
        $(document).on('click', '.delete-user', function () {
            var user_id = $(this).val();
            if(confirm('Are you sure?')) {
                $.ajax({
                    url: "actions.php",
                    method: "post",
                    data: {
                        user_id:user_id,
                        action: 'delete_user'
                    },
                }).done(function (result) {
                    if(result == 'Ok') {
                        read_users();
                    } else {
                        alert('Delete failed');
                    }
                });
            }

        });


        //Read Users
        function read_users() {
            $.ajax({
                url: "actions.php",
                method: "post",
                data: {
                    action: 'read_users'
                },
                dataType:'HTML',
            }).done(function (html) {
                $("#user_table tbody").html(html);
            });
        }

    });
</script>
</body>
</html>
