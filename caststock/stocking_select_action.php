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
                    Please select an action
                </div>
                <div class="card-body">
                    <form id="login_form" method="post" action="stocking_action.php">
                        <div class="row">
                            <div class="col-md-6">
                                <button class="btn btn-primary" type="submit" name="stocking_action" value="in" style="width: 100%; height: 200px; font-size: 40px;">IN</button>
                            </div>
                            <div class="col-md-6">
                                <button class="btn btn-success" type="submit" name="stocking_action" value="out" style="width: 100%; height: 200px; font-size: 40px;">OUT</button>
                            </div>
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
