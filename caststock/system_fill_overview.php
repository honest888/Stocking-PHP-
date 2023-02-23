<?php
require_once ("config.php");
require_once ("functions.php");
$page_name = "L/P Overview";
require_once ("assets.php");
?>
<style>
    .has-details {
        position: relative;
        cursor: pointer;
    }

    .details {
        position: absolute;
        top: -110px;
        transform: translateY(70%) scale(0);
        transition: transform 0.1s ease-in;
        transform-origin: left;
        display: inline;
        background: white;
        z-index: 20;
        min-width: 100%;
        padding: 0.2rem;
        border: 1px solid black;
        color: #0a0a0a;
    }

    .has-details:hover span {
        transform: translateY(70%) scale(1);
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
            <div class="container-fluid" id="overview_screen">

            </div>
        </div>
    </div>
    <!-- /.content-wrapper -->
    <?php include ("footer.php"); ?>
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

        setInterval(function () {
            $.ajax({
                url: "actions.php",
                method: "post",
                data: {
                    action:"get_help_alarm"
                },
                dataType:'HTML',
            }).done(function (html) {
                if(html != 'NO HELP') {
                    $("#help_modal").find('.modal-body').html(html);
                    $("#help_modal").modal();
                }
            });
        }, 2000)

        overview_screen();
        setInterval(function () {
            overview_screen();
        }, 20000);

        function overview_screen()
        {
            $.ajax({
                url: "actions.php",
                method: "post",
                data: {
                    action:"get_overview_screen"
                },
                dataType:'HTML',
            }).done(function (html) {
                $("#overview_screen").html(html);
            });
        }

        $("#confirm_help").on('click', function () {
            $.ajax({
                url: "actions.php",
                method: "post",
                data: {
                    action:"confirm_help_alarm"
                },
            }).done(function (result) {

            });
        });
    });
</script>
</body>
</html>
