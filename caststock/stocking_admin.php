<?php
require_once("config.php");
require_once("functions.php");
$page_name = "Stocking Admin";
require_once("assets.php");
?>
<style>
    .nav-tabs .nav-link.active,
    .nav-tabs .nav-item.show .nav-link {
        color: #ffffff;
        background-color: #10468E;
        border-color: #10468E #10468E #10468E;
    }

    .tab-pane {
        padding-top: 20px;
    }

    .table thead>tr>th {
        text-align: center;
    }
</style>
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
                        <div class="col-md-6">
                            <ul class="nav nav-tabs" id="custom-content-below-tab" role="tablist">
                                <?php
                                foreach ($STOCKING_AREAS as $index => $area) {
                                ?>
                                    <li class="nav-item">
                                        <a class="nav-link <?php echo ($index == 0) ? 'active' : ''; ?>" id="area-tab<?php echo $index; ?>" data-toggle="pill" href="#area-content<?php echo $index; ?>" role="tab" aria-controls="area-content<?php echo $index; ?>" aria-selected="<?php echo ($index == 0) ? 'true' : 'false'; ?>">
                                            <?php echo $area; ?>
                                        </a>
                                    </li>
                                <?php
                                }
                                ?>
                            </ul>
                            <div class="tab-content" id="custom-content-below-tabContent">
                                <?php
                                foreach ($STOCKING_AREAS as $index => $area) {
                                ?>
                                    <div class="tab-pane fade <?php echo ($index == 0) ? 'active show' : ''; ?>" id="area-content<?php echo $index; ?>" role="tabpanel">
                                        <div class="row">
                                            <div class="col-md-12">
                                                <button type="button" class="btn btn-success float-right add-lane" style="width: 100px;" value="<?php echo $index; ?>">Add Lane</button>
                                            </div>
                                            <div class="col-md-12 lanes_list" id="lane_table<?php echo $index; ?>" style="padding-top: 10px;"></div>
                                        </div>
                                    </div>
                                <?php
                                }
                                ?>
                            </div>
                        </div>
                        <div class="col-md-6">
                            <h3>Part Management</h3>
                            <div class="row">
                                <div class="col-md-12">
                                    <button type="button" class="btn btn-success float-right add-part" style="width: 100px;">Add Part</button>
                                </div>
                                <div class="col-md-12 part_list" id="part_table" style="padding-top: 10px;">

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
   

    <div class="modal fade" id="lane_modal" aria-hidden="true">
        <div class="modal-dialog">
            <form id="lane_modal_form" method="post">
                <div class="modal-content">
                    <div class="modal-header">
                        <h4 class="modal-title">Lane</h4>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">×</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        <input type="hidden" id="area_index" name="area_index" value="0">
                        <input type="hidden" id="lane_id" name="lane_id" value="0">
                        <input type="hidden" id="action" name="action" value="save_lane">
                        <div class="form-group">
                            <label for="lead_column_name">Lane No</label>
                            <input type="text" class="form-control" id="lane_no" name="lane_no" required>
                        </div>
                        <div class="form-group">
                            <label for="edit_lead_column_value">Barcode</label>
                            <input type="text" class="form-control" autocomplete="off" name="barcode_in" required>
                        </div>
                        <!--
                    <div class="form-group">
                        <label for="edit_lead_column_value">Barcode OUT</label>
                        <input type="text" class="form-control" autocomplete="off" name="barcode_out" required>
                    </div>-->
                        <div class="form-group">
                            <label for="lead_column_name">Allocation</label>
                            <input type="number" class="form-control" name="allocation" required>
                        </div>
                        <div class="form-group">
                            <label for="lead_column_name">Height</label>
                            <input type="number" class="form-control" name="height" required>
                        </div>
                    </div>
                    <div class="modal-footer justify-content-between">
                        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                        <button type="submit" class="btn btn-primary" id="field_form_submit">Save</button>
                    </div>
                </div>
            </form>
            <!-- /.modal-content -->
            <input type="hidden" id="tmp_db_field_name" value="">
        </div>
        <!-- /.modal-dialog -->
    </div>

    <div class="modal fade" id="part_modal" aria-hidden="true">
        <div class="modal-dialog">
            <form id="part_modal_form" method="post">
                <div class="modal-content">
                    <div class="modal-header">
                        <h4 class="modal-title">Part</h4>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">×</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        <input type="hidden" id="part_id" name="part_id" value="0">
                        <input type="hidden" id="action" name="action" value="save_part">
                        <div class="form-group">
                            <label for="part_no">Part No</label>
                            <input type="text" class="form-control" id="part_no" name="part_no" required>
                        </div>
                        <div class="form-group">
                            <label for="part_name">Part Name</label>
                            <input type="text" class="form-control" autocomplete="off" name="part_name" required>
                        </div>
                        <div class="form-group">
                            <label for="amount">Amount</label>
                            <input type="number" class="form-control" autocomplete="off" name="amount" required>
                        </div>
                        <div class="form-group">
                            <label for="amount">Lock</label>
                            <div class="checkbox">
                                <label class="checkbox-inline"><input style="margin-right: 3px;" type="checkbox" name="sf_check" id="sf_check" checked value="">L/P</label>
                                <label style="margin-left: 20px;" class="checkbox-inline"><input style="margin-right: 3px;" type="checkbox" name="ps_check" id="ps_check" checked value="">H/P</label>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="amount">Color</label>
                            <div class="input-group dolly-colorpicker colorpicker-element" id="dolly_color_0">
                                <input type="text" class="form-control" name="dolly_color" id="input_dolly_color_0" value="" data-original-title="" title="">
                                <div class="input-group-append">
                                    <span class="input-group-text"><i class="fas fa-square"></i></span>
                                </div>
                            </div>
                            <!-- <input type="number" class="form-control" autocomplete="off" name="amount" required> -->
                        </div>
                    </div>
                    <div class="modal-footer justify-content-between">
                        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                        <button type="submit" class="btn btn-primary" id="field_form_submit">Save</button>
                    </div>
                </div>

            </form>
            <!-- /.modal-content -->
            <input type="hidden" id="tmp_db_field_name" value="">
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
    <script src="assets/js/bootstrap-colorpicker.min.js"></script>
    <script src="assets/js/custom.js"></script>
    
    <script>
        $(document).ready(function() {

            /*
            Lane Management
             */

            $(".lanes_list").each(function() {
                var area_index = $(this).attr('id').replace('lane_table', '');
                read_lane_table(area_index);
            });


            $(document).on('click', '.add-lane', function() {
                $("#lane_modal_form").find('input').val('');
                $("#lane_modal_form").find('input[name="action"]').val('save_lane');
                var area_index = $(this).val();
                $("#area_index").val(area_index);
                $("#lane_modal").modal();
            });

            $(document).on('submit', '#lane_modal_form', function(e) {
                e.preventDefault();
                var area_index = $("#area_index").val();
                $.ajax({
                    url: 'actions.php',
                    type: "POST",
                    data: $("#lane_modal_form").serialize(),
                    success: function(result) {
                        if (result == 'Ok')
                            read_lane_table(area_index);
                        $("#lane_modal").modal('hide');
                    },
                });
            });

            function read_lane_table(area_index) {
                $.ajax({
                    url: 'actions.php',
                    type: "POST",
                    data: {
                        action: 'read_lanes',
                        area_index: area_index
                    },
                    dataType: 'HTML',
                    success: function(result) {
                        $("#lane_table" + area_index).html(result);
                    },
                });
            }

            $(document).on('click', '.edit-lane', function() {
                var lane_id = $(this).val();
                var area_index = $(this).closest('div').attr('id').replace('lane_table', '');
                $.ajax({
                    url: 'actions.php',
                    type: "POST",
                    data: {
                        lane_id: lane_id,
                        action: 'get_lane'
                    },
                    dataType: 'JSON',
                    success: function(result) {
                        var form = $("#lane_modal_form");
                        form.find('input[name="lane_id"]').val(result.id);
                        form.find('input[name="area_index"]').val(area_index);
                        form.find('input[name="lane_no"]').val(result.lane_no);
                        form.find('input[name="barcode_in"]').val(result.barcode_in);
                        form.find('input[name="barcode_out"]').val(result.barcode_out);
                        form.find('input[name="allocation"]').val(result.allocation);
                        form.find('input[name="height"]').val(result.height);
                        $("#lane_modal").modal();
                    },
                });
            });

            $(document).on('click', '.delete-lane', function() {
                var lane_id = $(this).val();
                var area_index = $(this).closest('div').attr('id').replace('lane_table', '');

                if (confirm("Are you sure?")) {
                    $.ajax({
                        url: 'actions.php',
                        type: "POST",
                        data: {
                            'lane_id': lane_id,
                            'action': 'delete_lane',
                        },
                        success: function(result) {
                            read_lane_table(area_index);
                        },
                    });
                }

            });

            /*
            Part Management
             */

            read_part_table();

            function read_part_table() {
                $.ajax({
                    url: 'actions.php',
                    type: "POST",
                    data: {
                        action: 'read_parts',
                    },
                    dataType: 'HTML',
                    success: function(result) {
                        $("#part_table").html(result);
                    },
                });
            }

            //Add Part
            $(document).on('click', '.add-part', function() {
                $("#part_modal_form").find('input').val('');
                $("#part_modal_form").find('input[name="action"]').val('save_part');
                $("#part_modal").modal();
            });

            $(document).on('submit', '#part_modal_form', function(e) {
                
                e.preventDefault();
                $.ajax({
                    url: 'actions.php',
                    type: "POST",
                    data: {
                        part_id: $('input[name="part_id"]').val(),
                        action: "save_part",
                        part_no: $('input[name="part_no"]').val(),
                        part_name: $('input[name="part_name"]').val(),
                        amount: $('input[name="amount"]').val(),
                        sf_check: $('input[name="sf_check"]').is(':checked'),
                        ps_check: $('input[name="ps_check"]').is(':checked'),
                        fl_check: $('input[name="fl_check"]').is(':checked'),
                        color: $('input[name="dolly_color"]').val(),
                    },
                    success: function(result) {
                        console.log(result);
                        if (result == 'Ok')
                            read_part_table();
                        $("#part_modal").modal('hide');
                    },
                });
            });

            $(document).on('click', '.edit-part', function() {
                var part_id = $(this).val();
                $.ajax({
                    url: 'actions.php',
                    type: "POST",
                    data: {
                        part_id: part_id,
                        action: 'get_part'
                    },
                    dataType: 'JSON',
                    success: function(result) {
                        var form = $("#part_modal_form");
                        form.find('input[name="part_id"]').val(result.id);
                        form.find('input[name="part_no"]').val(result.part_no);
                        form.find('input[name="amount"]').val(result.amount);
                        form.find('input[name="part_name"]').val(result.part_name);
                        $('#sf_check').prop("checked", result.sf == "1" ? true : false);
                        $('#ps_check').prop("checked", result.ps == "1" ? true : false);
                        $('#fl_check').prop("checked", result.fl == "1" ? true : false);
                        $("#part_modal").modal();
                    },
                });
            });

            $(document).on('click', '.delete-part', function() {
                var part_id = $(this).val();
                if (confirm("Are you sure?")) {
                    $.ajax({
                        url: 'actions.php',
                        type: "POST",
                        data: {
                            'part_id': part_id,
                            'action': 'delete_part',
                        },
                        success: function(result) {
                            read_part_table();
                        },
                    });
                }
            });

            /* color setting */
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
        });
    </script>
</body>

</html>