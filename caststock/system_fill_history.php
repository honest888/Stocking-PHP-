<?php
require_once ("config.php");
require_once ("functions.php");
$page_name = "L/P History";
require_once ("assets.php");
$week_start = date('Y-m-d', strtotime("this week"));
$week_end = date('Y-m-d', strtotime("+6 days", strtotime($week_start)));
?>
<link rel="stylesheet" href="assets/css/bootstrap-datetimepicker.min.css">
<!-- DataTables -->
<link rel="stylesheet" href="plugins/datatables-bs4/css/dataTables.bootstrap4.min.css">
<link rel="stylesheet" href="plugins/datatables-responsive/css/responsive.bootstrap4.min.css">
<link rel="stylesheet" href="plugins/datatables-buttons/css/buttons.bootstrap4.min.css">

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
                <div class="row">
                    <div class="col-md-12">
                        <div class="card card-default">
                            <div class="card-header">
                                <form id="history_form">
                                    <div class="form-group row" style="margin-bottom: 0">
                                        <label class="col-sm-1 col-form-label" style="text-align: right;">From</label>
                                        <div class="col-sm-2">
                                            <div class="input-group date" id="div_from_date">
                                                <input type="text" name="from_date" id="from_date"
                                                       class="form-control datepicker" value="<?php echo date('d/m/Y', strtotime($week_start)); ?>">
                                                <div class="input-group-addon input-group-append">
                                                    <div class="input-group-text">
                                                        <i class="glyphicon glyphicon-calendar fa fa-calendar"></i>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <label class="col-sm-1 col-form-label" style="text-align: right;">To</label>
                                        <div class="col-sm-2">
                                            <div class="input-group date" id="div_to_date">
                                                <input type="text" name="to_date" id="to_date"
                                                       class="form-control datepicker" value="<?php echo date('d/m/Y', strtotime($week_end)); ?>">
                                                <div class="input-group-addon input-group-append">
                                                    <div class="input-group-text">
                                                        <i class="glyphicon glyphicon-calendar fa fa-calendar"></i>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-sm-3">
                                            <button type="button" id="load_history" class="btn btn-primary" style="width: 100px;">Load Data</button>
                                            <button type="button" id="reset_history" class="btn btn-default" style="width: 100px;">Reset</button>
                                        </div>
                                    </div>
                                    <input type="hidden" id="default_from" value="<?php echo date('d/m/Y', strtotime($week_start)); ?>">
                                    <input type="hidden" id="default_to" value="<?php echo date('d/m/Y', strtotime($week_end));?>">
                                    <input type="hidden" name="action" value="read_history">
                                </form>
                            </div>
                            <!-- /.card-header -->
                            <div class="card-body">
                                <div class="row">
                                    <div class="col-md-12" id="history_list"></div>
                                </div>
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
<script src="plugins/moment/moment.min.js"></script>
<script src="assets/js/bootstrap-datetimepicker.min.js"></script>
<!-- DataTables  & Plugins -->
<script src="plugins/datatables/jquery.dataTables.min.js"></script>
<script src="plugins/datatables-bs4/js/dataTables.bootstrap4.min.js"></script>
<script src="plugins/datatables-responsive/js/dataTables.responsive.min.js"></script>
<script src="plugins/datatables-responsive/js/responsive.bootstrap4.min.js"></script>
<script src="plugins/datatables-buttons/js/dataTables.buttons.min.js"></script>
<script src="plugins/datatables-buttons/js/buttons.bootstrap4.min.js"></script>
<script src="plugins/jszip/jszip.min.js"></script>
<script src="plugins/pdfmake/pdfmake.min.js"></script>
<script src="plugins/pdfmake/vfs_fonts.js"></script>
<script src="plugins/datatables-buttons/js/buttons.html5.min.js"></script>
<script src="plugins/datatables-buttons/js/buttons.print.min.js"></script>
<script src="plugins/datatables-buttons/js/buttons.colVis.min.js"></script>
<!-- AdminLTE App -->
<script src="assets/js/adminlte.min.js"></script>
<script src="assets/js/custom.js"></script>
<script>
    $(document).ready(function() {
        $(".datepicker").datetimepicker({
            format: 'DD/MM/YYYY',
            icons: {
                previous: 'fas fa-angle-left',
                next: 'fas fa-angle-right',
            }
        });

        read_history();

        $("#reset_history").on('click', function () {
            var start = $("#default_from").val();
            $("#from_date").val(start);
            var end = $("#default_to").val();
            $("#to_date").val(end);
            read_history();
        });

        $("#load_history").on('click', function () {
            read_history();
        });

        function read_history() {
            $.ajax({
                url: "actions.php",
                method: "post",
                data: $("#history_form").serialize(),
                dataType:'HTML',
            }).done(function (html) {
                $("#history_list").html(html);
                $("#history_table").DataTable({
                    "responsive": true,
                    "lengthChange": false,
                    "autoWidth": false,
                    "buttons": ["copy", "csv", "excel", "pdf", "print"],
                }).buttons().container().appendTo('#history_table_wrapper .col-md-6:eq(0)');
            });
        }

    });
</script>
</body>
</html>
