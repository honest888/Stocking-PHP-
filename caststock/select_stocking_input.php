<?php
require_once ("config.php");
require_once ("functions.php");
$page_name = "Select Stocking Input";
$_SESSION['page'] = 'select_stocking_input.php';
login_check();
require_once ("assets.php");
?>
<style>
    .part-type-btn{
        padding: 4.375rem 0.75rem;
    }
</style>
<body class="hold-transition sidebar-collapse layout-top-nav" onload="startTime()">
<div class="wrapper">
    <?php include("header.php"); ?>
    <?php include("menu.php"); ?>
    <div class="content-wrapper login-page" style="justify-content: unset; padding-top: 150px;">
        <div class="login-box" style="width: 480px;">
            <!-- /.login-logo -->
            <div class="card card-outline card-primary">
                <div class="card-header text-center">
                    Please select Part Type
                </div>
                <div class="card-body">
                    <div class="row mb-2">
                        <a href="stocking_input.php?type=in" type="button" class="btn btn-primary part-type-btn" aria-haspopup="true" aria-expanded="false" style="width:48%; margin-right:10px"><font size="18">In</font>
                        </a>
                        <a href="stocking_input.php?type=out" type="button" class="btn btn-success part-type-btn" aria-haspopup="true" aria-expanded="false" style="width:48%"><font size="18">Out</font>
                        </a>
                    </div>  
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

    });
</script>
</body>
</html>
