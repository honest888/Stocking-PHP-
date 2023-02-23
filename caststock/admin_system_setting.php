<?php
require_once ("config.php");
require_once ("functions.php");
$page_name = "System Setting";
require_once ("assets.php");
?>
<link rel="stylesheet" href="assets/css/bootstrap-colorpicker.min.css" />
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
                    <div class="col-lg-6">
                        <div class="card">
                            <div class="card-header border-0">
                                <div class="d-flex justify-content-between">
                                    <h3 class="card-title">
                                        Renban No Prefix
                                    </h3>
                                </div>
                            </div>
                            <div class="card-body">
                                <input type="text" class="form-control" id="renban_no_prefix" name="renban_no_prefix"
                                       value="<?php echo get_setting('renban_no_prefix')?>" style="width: 200px; display: inline-block">
                                <button class="btn btn-success" id="save_renban_no_prefix">Save</button>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-6">
                        <div class="card">
                            <div class="card-header border-0">
                                <div class="d-flex justify-content-between">
                                    <h3 class="card-title">
                                        Import Conveyance pick list(csv)
                                    </h3>
                                </div>
                            </div>
                            <div class="card-body" style="padding-top: 5px;">
                                <label class="btn btn-primary" style="margin-top: 7px; font-weight: normal;">
                                    Choose CSV<input type="file" hidden id="file" name="file" required>
                                </label>
                                <button type="button" class="btn btn-success" id="import_conveyance_csv">Import</button>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-6">
                        <div class="card card-primary">
                            <div class="card-header border-0">
                                <div class="d-flex justify-content-between">
                                    <h3 class="card-title">
                                        Part to Kanban
                                    </h3>
                                </div>
                            </div>
                            <div class="card-body">
                                <div style="text-align: right;">
                                    <label class="btn btn-primary" style="margin-top: 7px; font-weight: normal;">
                                        Choose CSV<input type="file" hidden id="part2kanban_file" name="part2kanban_file" required>
                                    </label>
                                    <button type="button" class="btn btn-success" id="import_kanban_csv">Import</button>
                                </div>
                                <table class="table table-bordered table-bordered" id="part2kanban_table">
                                    <thead>
                                    <tr>
                                        <th>Kanban</th>
                                        <th>Part Number</th>
                                        <th></th>
                                    </tr>
                                    <tr id="tr_p2k_0">
                                        <th>
                                            <input type="text" class="form-control" name="kanban">
                                        </th>
                                        <th>
                                            <input type="text" class="form-control" name="part_number">
                                        </th>
                                        <th style="text-align: center;">
                                            <button type="button" class="btn btn-success save-part2kanban">Add</button>
                                        </th>
                                    </tr>
                                    </thead>
                                    <tbody></tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-6">
                        <div class="card card-primary">
                            <div class="card-header border-0">
                                <div class="d-flex justify-content-between">
                                    <h3 class="card-title">
                                        Dolly Setting
                                    </h3>
                                </div>
                            </div>
                            <div class="card-body">
                                <table class="table table-bordered table-bordered" id="dolly_table">
                                    <thead>
                                    <tr>
                                        <th>Dolly Name</th>
                                        <th>Color</th>
                                        <th></th>
                                    </tr>
                                    <tr id="tr_dolly_0">
                                        <th>
                                            <input type="text" class="form-control" name="dolly_name">
                                        </th>
                                        <th>
                                            <div class="input-group dolly-colorpicker colorpicker-element" id="dolly_color_0">
                                                <input type="text" class="form-control" name="dolly_color" id="input_dolly_color_0" value="" data-original-title="" title="">
                                                <div class="input-group-append">
                                                    <span class="input-group-text"><i class="fas fa-square"></i></span>
                                                </div>
                                            </div>
                                        </th>
                                        <th style="text-align: center;">
                                            <button type="button" class="btn btn-success add-dolly">Add</button>
                                        </th>
                                    </tr>
                                    </thead>
                                    <tbody>
                                    <?php
                                    $dolly = get_all_dolly();
                                    foreach ($dolly as $item) {
                                        echo '<tr id="tr_dolly_'.$item->id.'">';
                                        echo '<td><input type="text" class="form-control dolly-name" name="dolly_name" value="'.$item->name.'"></td>';
                                        echo '<td>';
                                        echo '<div class="input-group dolly-colorpicker colorpicker-element" id="dolly_color_'.$item->id.'">
                                                <input type="text" class="form-control" name="dolly_color" id="input_dolly_color_'.$item->id.'" value="'.$item->color.'" data-original-title="" title="">
                                                <div class="input-group-append">
                                                    <span class="input-group-text"><i class="fas fa-square" style="color: '.$item->color.'"></i></span>
                                                </div>
                                            </div>';
                                        echo '</td>';
                                        echo '<td style="text-align: center;"><button type="button" class="btn btn-danger delete-dolly" value="'.$item->id.'">Delete</button></td>';
                                        echo '</tr>';
                                    }
                                    ?>
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

<!-- REQUIRED SCRIPTS -->

<!-- jQuery -->
<script src="plugins/jquery/jquery.min.js"></script>
<!-- Bootstrap 4 -->
<script src="plugins/bootstrap/js/bootstrap.bundle.min.js"></script>
<!-- AdminLTE App -->
<script src="assets/js/adminlte.min.js"></script>
<script src="assets/js/bootstrap-colorpicker.min.js"></script>
<script src="assets/js/custom.js"></script>
<script>
    $(document).ready(function() {
        $("#save_renban_no_prefix").on('click', function () {
            if($("#renban_no_prefix").val() == '') {
                $("#renban_no_prefix").focus();
                return false;
            }

            var set_value = $("#renban_no_prefix").val();

            $.ajax({
                url: "actions.php",
                method: "post",
                data: {
                    action: 'save_setting',
                    set_type: 'renban_no_prefix',
                    set_value: set_value,
                },
            }).done(function (result) {
                if(result == "Ok")
                    alert('Saved successfully');
                else
                    alert('Save failed');
            });
        });

        //Import pick list for conveyance
        $("#import_conveyance_csv").on('click', function () {
            if($("#file").val() == '') {
                alert('Please select csv file');
                return false;
            }
            var file_data = $("#file").prop('files')[0];
            var form_data = new FormData();
            form_data.append('file', file_data);
            $.ajax({
                url: 'conveyance_pick_import.php',
                cache: false,
                contentType: false,
                processData: false,
                data: form_data,
                type: 'post',
                success: function(result){
                    if(result == "Success")
                        alert('Imported successfully');
                    else
                        alert('Import failed');
                    $("#file").val("");
                }
            });
        });


        /*
        Dolly
         */
        $('.dolly-colorpicker').colorpicker();

        $(document).on('colorpickerChange', '.dolly-colorpicker', function (event) {
            $(this).find('.fa-square').css('color', event.color.toString());
            var color = event.color.toString();
            //Update color for column
            var dolly_id = $(this).attr('id').replace('dolly_color_', '');
            $("#input_dolly_color_" + dolly_id).val(color);
            if(dolly_id == 0)
                return false;
            //Update color for column
            update_dolly(dolly_id, 'color', color);
        });

        function update_dolly(dolly_id, field, value) {
            $.ajax({
                url: "actions.php",
                method: "post",
                data: {
                    action: 'update_dolly',
                    dolly_id: dolly_id,
                    field: field,
                    value: value,
                },
            }).done(function (result) {
                //console.log(result);
            });
        }

        $(document).on('click', '.add-dolly', function () {
            var tr = $(this).closest('tr');
            var dolly_id = tr.attr('id').replace('tr_dolly_', '');
            var dolly_name = tr.find('input[name="dolly_name"]').val();
            var color = tr.find('input[name="dolly_color"]').val();
            if(dolly_name == "") {
                tr.find('input[name="dolly_name"]').focus();
                return false;
            }
            $.ajax({
                url: "actions.php",
                method: "post",
                data: {
                    action: 'save_dolly',
                    dolly_id: dolly_id,
                    dolly_name: dolly_name,
                    color: color,
                },
            }).done(function (result) {
                if(dolly_id == 0) {
                    tr.find('input[name="dolly_name"]').val('');
                    tr.find('input[name="dolly_color"]').val('');
                    $("#dolly_table").find('tbody').append(result);
                }
            });
        });

        $(document).on('click', '.delete-dolly', function () {
            var tr = $(this).closest('tr');
            var dolly_id = $(this).val();
            $.ajax({
                url: "actions.php",
                method: "post",
                data: {
                    action: 'delete_dolly',
                    dolly_id: dolly_id,
                },
            }).done(function (result) {
                tr.remove();
            });
        });

        $(document).on('input', '.dolly-name', function () {
            var tr = $(this).closest('tr');
            var dolly_id = tr.attr('id').replace('tr_dolly_', '');
            var dolly_name = $(this).val();
            update_dolly(dolly_id, 'name', dolly_name);
        });

        /*
        Part to Kanban
         */
        read_part2kanban();

        $(document).on('click', '.save-part2kanban', function () {
            var tr = $(this).closest('tr');
            var item_id = tr.attr('id').replace('tr_p2k_', '');
            var kanban = tr.find('input[name="kanban"]').val();
            var part_number = tr.find('input[name="part_number"]').val();
            if(kanban == "") {
                tr.find('input[name="kanban"]').focus();
                return false;
            }
            if(part_number == "") {
                tr.find('input[name="part_number"]').focus();
                return false;
            }
            $.ajax({
                url: "actions.php",
                method: "post",
                data: {
                    action: 'save_part2kanban',
                    item_id: item_id,
                    kanban: kanban,
                    part_number: part_number,
                },
            }).done(function (result) {
                if(item_id == 0) {
                    tr.find('input[name="kanban"]').val('');
                    tr.find('input[name="part_number"]').val('');
                    $("#part2kanban_table").find('tbody').append(result);
                } else {
                    alert('Saved successfully');
                }
            });
        });

        $(document).on('click', '.delete-part2kanban', function () {
            var tr = $(this).closest('tr');
            var item_id = $(this).val();
            $.ajax({
                url: "actions.php",
                method: "post",
                data: {
                    action: 'delete_part2kanban',
                    item_id: item_id,
                },
            }).done(function (result) {
                tr.remove();
            });
        });

        //import csv for part to kanban
        $("#import_kanban_csv").on('click', function () {
            if($("#part2kanban_file").val() == '') {
                alert('Please select csv file');
                return false;
            }
            var file_data = $("#part2kanban_file").prop('files')[0];
            var form_data = new FormData();
            form_data.append('file', file_data);
            form_data.append('target', 'part2kanban');
            $.ajax({
                url: 'import_csv.php',
                cache: false,
                contentType: false,
                processData: false,
                data: form_data,
                type: 'post',
                success: function(result){
                    if(result == "Success") {
                        alert('Imported successfully');
                        read_part2kanban();
                    }
                    else
                        alert('Import failed');
                    $("#part2kanban_file").val("");
                }
            });
        });

        function read_part2kanban()
        {
            $.ajax({
                url: "actions.php",
                method: "post",
                data: {
                    action: 'read_part2kanban',
                },
                dataType:'HTML',
            }).done(function (result) {
                $("#part2kanban_table").find('tbody').html(result);
            });
        }
    });
</script>
</body>
</html>
