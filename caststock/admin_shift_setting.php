<?php
require_once ("config.php");
require_once ("functions.php");
$page_name = "Shift Setting";
require_once ("assets.php");
?>
<style>
    .bootstrap-datetimepicker-widget table td,
    .bootstrap-datetimepicker-widget table th {
        text-align: center;
        border: 0px;
        border-radius: 0px;
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
                <div class="row">
                    <?php
                    $shift_patterns = array('2 shifts', '3 shifts');
                    foreach ($shift_patterns as $shift_pattern) {
                        ?>
                        <div class="col-lg-6">
                            <div class="card">
                                <div class="card-header border-0">
                                    <div class="d-flex justify-content-between">
                                        <h3 class="card-title">
                                            <?php echo ($shift_pattern == '2 shifts')? '2 SHIFT SETTING':'3 SHIFT SETTING'; ?>
                                        </h3>
                                    </div>
                                </div>
                                <div class="card-body">
                                    <?php
                                    $shift_setting = get_setting($shift_pattern);
                                    if($shift_setting != '')
                                        $shifts = json_decode($shift_setting, true);
                                    else{
                                        $string = file_get_contents("./shift.json");
                                        $shifts = json_decode($string, true);
                                    }

                                    ?>
                                    <form method="post" id="shift_setting_form">
                                        <table class="table table-bordered ">
                                            <thead>
                                            <tr>
                                                <th style="width: 120px;"></th>
                                                <th colspan="2" style="text-align: center;">
                                                    SHIFT 1
                                                </th>
                                                <th colspan="2" style="text-align: center;">
                                                    SHIFT 2
                                                </th>
                                                <th colspan="2" style="text-align: center;">
                                                    <?php echo ($shift_pattern == '2 shifts')? 'Friday Shift':'Shift 3'; ?>
                                                </th>
                                            </tr>
                                            <tr>
                                                <th></th>
                                                <th style="text-align: center;">Start</th>
                                                <th style="text-align: center;">End</th>
                                                <th style="text-align: center;">Start</th>
                                                <th style="text-align: center;">End</th>
                                                <th style="text-align: center;">Start</th>
                                                <th style="text-align: center;">End</th>
                                            </tr>
                                            </thead>
                                            <tbody>
                                            <tr>
                                                <td style="text-align: center;">Time</td>
                                                <td style="text-align: center;">
                                                    <?php
                                                    echo '<div class="input-group bootstrap-timepicker timepicker" style="width: 100%">';
                                                    echo '<input type="text" class="time-picker form-control input-small" name="shift1_start" value="'.$shifts['shift1']['start'].'" style="min-width:70px;">';
                                                    echo '</div>';
                                                    ?>
                                                </td>
                                                <td style="text-align: center;">
                                                    <?php
                                                    echo '<div class="input-group bootstrap-timepicker timepicker" style="width: 100%">';
                                                    echo '<input type="text" class="time-picker form-control input-small" name="shift1_end" value="'.$shifts['shift1']['end'].'" style="min-width:70px;">';
                                                    echo '</div>';
                                                    ?>
                                                </td>
                                                <td style="text-align: center;">
                                                    <?php
                                                    echo '<div class="input-group bootstrap-timepicker timepicker" style="width: 100%">';
                                                    echo '<input type="text" class="time-picker form-control input-small" name="shift2_start" value="'.$shifts['shift2']['start'].'" style="min-width:70px;">';
                                                    echo '</div>';
                                                    ?>
                                                </td>
                                                <td style="text-align: center;">
                                                    <?php
                                                    echo '<div class="input-group bootstrap-timepicker timepicker" style="width: 100%">';
                                                    echo '<input type="text" class="time-picker form-control input-small" name="shift2_end" value="'.$shifts['shift2']['end'].'" style="min-width:70px;">';
                                                    echo '</div>';
                                                    ?>
                                                </td>
                                                <td style="text-align: center;">
                                                    <?php
                                                    echo '<div class="input-group bootstrap-timepicker timepicker" style="width: 100%">';
                                                    echo '<input type="text" class="time-picker form-control input-small" name="shift3_start" value="'.$shifts['shift3']['start'].'" style="min-width:70px;">';
                                                    echo '</div>';
                                                    ?>
                                                </td>
                                                <td style="text-align: center;">
                                                    <?php
                                                    echo '<div class="input-group bootstrap-timepicker timepicker"  style="width: 100%">';
                                                    echo '<input type="text" class="time-picker form-control input-small" name="shift3_end" value="'.$shifts['shift3']['end'].'" style="min-width:70px;">';
                                                    echo '</div>';
                                                    ?>
                                                </td>
                                            </tr>

                                            <?php
                                            for($i = 1; $i<4; $i++){
                                                echo "<tr>";
                                                echo "<td style=\"text-align: center;\">Break ".$i."</td>";
                                                foreach ($g_shifts as $key=>$shift) {
                                                    echo "<td>";
                                                    echo '<div class="input-group bootstrap-timepicker timepicker" style="width: 100%">';
                                                    echo '<input type="text" class="time-picker form-control input-small" name="'.$shift.'_break_start[]" value="'.$shifts[$shift]['breaks']['start'.$i].'" style="min-width:70px;">';
                                                    echo '</div>';
                                                    echo "</td>";

                                                    echo "<td>";
                                                    echo '<div class="input-group bootstrap-timepicker timepicker" style="width: 100%">';
                                                    echo '<input type="text" class="time-picker form-control input-small" name="'.$shift.'_break_end[]" value="'.$shifts[$shift]['breaks']['end'.$i].'" style="min-width:70px;">';
                                                    echo '</div>';
                                                    echo "</td>";

                                                }
                                                echo "<tr>";
                                            }
                                            ?>
                                            </tbody>
                                        </table>
                                        <input type="hidden" name="action" value="shift_setting">
                                        <input type="hidden" name="set_type" value="<?php echo $shift_pattern; ?>">
                                        <button type="button" class="btn btn-primary save_shift_time" style="margin-top: 10px; float: right;">Save Settings</button>
                                    </form>
                                </div>
                            </div>
                        </div>
                        <?php
                    }
                    ?>
                </div>

                <div class="row">
                    <div class="col-md-6">
                        <div class="card card-default">
                            <div class="card-header border-0">
                                <div class="d-flex justify-content-between">
                                    <h3 class="card-title">
                                        Shift Pattern Setting
                                    </h3>
                                </div>
                            </div>
                            <div class="card-body">
                                <?php
                                $shift_pattern = get_setting('Shift Pattern');
                                echo '<select class="form-control" name="shift_pattern" id="shift_pattern">';
                                if($shift_pattern == '2 shifts') {
                                    echo '<option value=""></option>';
                                    echo '<option value="2 shifts" selected>2 Shifts</option>';
                                    echo '<option value="3 shifts">3 Shifts</option>';
                                } else if($shift_pattern == '3 shifts') {
                                    echo '<option value=""></option>';
                                    echo '<option value="2 shifts">2 Shifts</option>';
                                    echo '<option value="3 shifts" selected>3 Shifts</option>';
                                } else {
                                    echo '<option value=""></option>';
                                    echo '<option value="2 shifts">2 Shifts</option>';
                                    echo '<option value="3 shifts">3 Shifts</option>';
                                }
                                echo '</select>';
                                ?>

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
        $(".time-picker").datetimepicker({
            format: 'HH:mm',
            icons: {
                up: 'fas fa-chevron-up',
                down: 'fas fa-chevron-down',
            }
        });

        $(document).on('click', '.save_shift_time', function () {
            var form = $(this).closest('form');
            $.ajax({
                url: "actions.php",
                method: "post",
                data: form.serialize()
            }).done(function (res) {
                console.log(res);
                if(res =="ok") {
                    alert("Saved successfully");
                } else {
                    alert("Save failed");
                }
            });
        });

        $(document).on('change', '#shift_pattern', function () {
            var set_value = $(this).val();
            if(set_value != '') {
                $.ajax({
                    url: "actions.php",
                    method: "post",
                    data: {
                        action: 'save_setting',
                        set_type: 'Shift Pattern',
                        set_value: set_value,
                    },
                }).done(function (result) {
                    if(result == "Ok")
                        alert('Saved successfully');
                    else
                        alert('Save failed');
                });
            }
        });

    });
</script>
</body>
</html>
