<?php
require_once ("config.php");
require_once ("functions.php");
$page_name = "Login";
require_once ("assets.php");
?>
<body class="hold-transition sidebar-collapse layout-top-nav" onload="startTime()">
<div class="wrapper">
    <?php include("header.php"); ?>
    <?php include("menu.php"); ?>
    <div class="content-wrapper login-page" style="justify-content: unset; padding-top: 150px;">
        <div class="login-box" style="width: 480px;">
            <!-- /.login-logo -->
            <div class="card card-outline card-primary">
                <div class="card-header text-center">
                    Please select a user to begin
                </div>
                <div class="card-body">
                    <form id="login_form" method="post" action="auth.php">
                        <div class="form-group">
                            <label>Select User</label>
                            <?php
                            $users = get_all_users();
                            echo '<select class="form-control" id="username" name="username">';
                            echo '<option></option>';
                            foreach ($users as $user){
                                echo '<option value="'.$user['username'].'">'.$user['username'].'</option>';
                            }
                            echo '</select>';
                            ?>
                        </div>
                        <div class="form-group">
                            <input type="text" name="member_no" id="member_no" class="form-control" placeholder="Select Member or Enter Member No">
                        </div>
                        <div class="row">
                            <div class="offset-8 col-4">
                                <button type="type" id="submit_login_form" class="btn btn-primary btn-block">Sign In</button>
                            </div>
                            <!-- /.col -->
                        </div>
                    </form>
                </div>
                <div class="card-footer" style="text-align: right;">
                    <img src="assets/img/Inspired-Powered-by-Logo.png" width="256" height="50" alt="inspired" longdesc="http://www.inspiredonline.co.uk">
                </div>
            </div>
            <!-- /.card -->
        </div>
    </div>
    <!-- /.content-wrapper -->
    <?php // include ("footer.php"); ?>
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
        $("#submit_login_form").on('click', function (e) {
            e.preventDefault();
            var user_name = $("#username").val();
            var member_no = $("#member_no").val();
            if(user_name == '' && member_no == '') {
                alert('Please select member or enter member no');
                return false;
            } else {
                $("#login_form").submit();
            }
        });

    });
</script>
</body>
</html>
