<?php
require_once ("config.php");
require_once ("functions.php");
$page_name = "Container Build and Plan";
require_once ("assets.php");
?>
<style>
    .breadcrumb-item+.breadcrumb-item::before {
        float: left;
        padding-right: 0.5rem;
        color: #6c757d;
        content: ":";
    }

    .table tr>td {
        text-align: center;
        vertical-align: middle;
        font-size: 14px;
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
                    <div class="col-sm-6">
                        <h1 class="m-0" style="display: inline"><?php // echo $page_name; ?> Deeside Devanning / Vanning Schedule</h1>
                    </div>
                    <div class="col-sm-6">
                        <ol class="breadcrumb float-sm-right">
                            <li class="breadcrumb-item"><a href="#">Approved By</a></li>
                            <li class="breadcrumb-item active">Josh Robb</li>
                        </ol>
                    </div>
                    <div class="col-sm-12" style="font-size: 13px; color: #6c757d">
                        All containers must arrive and depart as scheduled below. If there are any deviations to the Schedule when the Japan Specialist is unavailable then please notify the specialist AS SOON AS POSSIBLE. If there are any questions then always STOP-CALL-WAIT.
                    </div>
                </div>
            </div>
        </div>
        <div class="content">
            <div class="container-fluid">
                <div class="row">
                    <div class="col-md-12">
                        <div class="card">
                            <div class="card-body" style="width: 100%; height:600px; overflow: auto;">
                                <?php
                                $start_date = '2022-02-28';
                                $end_date = '2022-04-01';
                                ?>
                                <table class="table table-bordered">
                                    <tr>
                                        <th colspan="3"></th>
                                        <th colspan="12" style="text-align: center;">Delivery Management</th>
                                        <th rowspan="109"></th>
                                        <th colspan="21" style="text-align: center;">In House Management</th>
                                    </tr>
                                    <tr>
                                        <!--------Delivery Management------->
                                        <td colspan="3" rowspan="2"></td>
                                        <td colspan="4">Arrival</td>
                                        <td rowspan="5">PENTALVER <br/> Instructions</td>
                                        <td colspan="4">Departure</td>
                                        <td colspan="3">On Dock <br/> (before departure)</td>

                                        <!--------In House Management-------->
                                        <td rowspan="5">In House Instructions</td>
                                        <td colspan="3" style="background-color: red; color:#fff">Confirmation</td>
                                        <td colspan="6">Docked on to the Japan Bay</td>
                                        <td rowspan="2"></td>
                                        <td rowspan="5"></td>
                                        <td colspan="9" rowspan="2">
                                            Stored in the Deeside Yard<br/>
                                            (after all actions have been completed)
                                        </td>
                                    </tr>

                                    <tr>
                                        <!--------Delivery Management------->
                                        <td rowspan="4">Inbound Renban / Air Freight Case Number</td>
                                        <td rowspan="4">Shipping Line</td>
                                        <td rowspan="4">Number of ZR Modules</td>
                                        <td rowspan="4">Container Number</td>

                                        <td rowspan="4">Inbound Renban</td>
                                        <td rowspan="4">Export Load Reference</td>
                                        <td rowspan="4">Shipping Line</td>
                                        <td rowspan="4">Container Number</td>

                                        <td rowspan="4">Inbound Renban</td>
                                        <td rowspan="4">Shipping Line</td>
                                        <td rowspan="4">Container Number</td>

                                        <!--------In House Management-------->
                                        <td rowspan="3" style="background-color: red; color:#fff">
                                            GL / TL to confirm in house instructions were actioned correctly
                                        </td>
                                        <td rowspan="3" style="background-color: red; color:#fff">
                                            GL confirmation Customs check completed
                                        </td>
                                        <td rowspan="3" style="background-color: red; color:#fff">
                                            Module Condition Record number of damaged modules
                                        </td>
                                        <td colspan="6" style="background-color: #FF99CC">Devan and Customs Seal Info</td>
                                    </tr>

                                    <tr>
                                        <td rowspan="3" style="width: 120px;">Date</td>
                                        <td rowspan="3">Shift</td>
                                        <td rowspan="3">Time</td>

                                        <!--------In House Management-------->
                                        <td colspan="4" style="background-color: #6c757d;">Containers to be Devanned</td>
                                        <td rowspan="2" style="background-color: red; color: #FFF">
                                            To be filled in by the GL / TL record seal number removed from container.
                                        </td>
                                        <td rowspan="3" style="background-color: #6c757d;">
                                            Container Number
                                        </td>
                                        <td rowspan="2" style="background-color: red; color: #FFF">EXPECTED SEAL NO.</td>

                                        <td colspan="9"></td>
                                    </tr>

                                    <tr>
                                        <!--------In House Management-------->
                                        <td rowspan="2" style="background-color: #6c757d;">Inbound Renban<br/>(No. 1)</td>
                                        <td rowspan="2" style="background-color: #6c757d;">Export Renban</td>
                                        <td rowspan="2" style="background-color: #6c757d;">Shipping Line</td>
                                        <td rowspan="2" style="background-color: #6c757d;">ZR</td>

                                        <td rowspan="2">Inbound Renban<br/>(No. 1)</td>
                                        <td rowspan="2">Tapped Modules</td>
                                        <td rowspan="2">Container Number</td>
                                        <td rowspan="2">Inbound Renban<br/>(No. 2)</td>
                                        <td rowspan="2">Tapped Modules</td>
                                        <td rowspan="2">Container Number</td>
                                        <td rowspan="2">Inbound Renban<br/>(No. 3)</td>
                                        <td rowspan="2">Tapped Modules</td>
                                        <td rowspan="2">Container Number</td>
                                    </tr>
                                    <tr>
                                        <td style="background-color: red; color: #FFF">Print Name</td>
                                        <td style="background-color: red; color: #FFF">Print Name</td>
                                        <td style="background-color: red; color: #FFF">Quantity</td>
                                        <td style="background-color: red; color: #FFF">PIPCONT / PIPSEAL</td>
                                        <td style="background-color: red; color: #FFF">&nbsp;</td>
                                    </tr>
                                    <?php
                                    $p = 9739;
                                    while ($start_date <= $end_date) {
                                        $week_day = date('l', strtotime($start_date));
                                        if($week_day == 'Monday') {
                                            echo '<tr>';
                                            echo '<td colspan="15" style="height: 20px; background-color: #b4b4b4;"></td>';
                                            echo '<td colspan="21" style="height: 20px; background-color: #b4b4b4;"></td>';
                                            echo '</tr>';
                                        } else {
                                            echo '<tr>';
                                            echo '<td colspan="15" style="height: 20px; background-color: white;"></td>';
                                            echo '<td colspan="21" style="height: 20px; background-color: white;"></td>';
                                            echo '</tr>';
                                        }

                                        //Shift 1
                                        echo '<tr>';
                                        echo '<!--------Delivery Management------->';
                                        echo '<td style="font-weight: bold;">'.date('d-M D', strtotime($start_date)).'</td>';
                                        echo '<td style="font-weight: bold;">D</td>';
                                        echo '<td style="font-weight: bold;">7:30</td>';

                                        echo '<td>P'.$p.'</td>';
                                        echo '<td>MAERSK</td>';
                                        echo '<td></td>';
                                        echo '<td>TCKU7011440</td>';

                                        echo '<td style="background-color: #CCFFCC;">Exchange & Shunt</td>';

                                        echo '<td>P'.($p - 2).'</td>';
                                        echo '<td></td>';
                                        echo '<td>MAERSK</td>';
                                        echo '<td>MRSU3882716</td>';

                                        echo '<td>P'.($p - 1).'</td>';
                                        echo '<td>MAERSK</td>';
                                        echo '<td>MRSU3882716</td>';


                                        echo '<!--------In House Management-------->';
                                        echo '<td style="background-color: #CCFFCC;">Devan - Days</td>';
                                        echo '<td></td>';
                                        echo '<td></td>';
                                        echo '<td></td>';
                                        echo '<td>P'.($p - 1).'</td>';
                                        echo '<td></td>';
                                        echo '<td>MAERSK</td>';
                                        echo '<td></td>';
                                        echo '<td></td>';
                                        echo '<td>MRSU4049330</td>';
                                        echo '<td>MLJP3545072</td>';
                                        echo '<td></td>';
                                        echo '<td>P'.$p.'</td>';
                                        echo '<td></td>';
                                        echo '<td>TCKU7011440</td>';
                                        echo '<td></td>';
                                        echo '<td></td>';
                                        echo '<td></td>';
                                        echo '<td></td>';
                                        echo '<td></td>';
                                        echo '<td></td>';
                                        echo '</tr>';

                                        //Shift 2
                                        $p = $p + 1;
                                        echo '<tr>';
                                        echo '<!--------Delivery Management------->';
                                        echo '<td style="font-weight: bold;">'.date('d-M D', strtotime($start_date)).'</td>';
                                        echo '<td style="font-weight: bold;">N</td>';
                                        echo '<td style="font-weight: bold;">7:30</td>';

                                        echo '<td>P'.$p.'</td>';
                                        echo '<td>MAERSK</td>';
                                        echo '<td></td>';
                                        echo '<td>TCKU7011440</td>';

                                        echo '<td style="background-color: #CCFFCC;">Exchange & Shunt</td>';

                                        echo '<td>P'.($p - 2).'</td>';
                                        echo '<td></td>';
                                        echo '<td>MAERSK</td>';
                                        echo '<td>MRSU3882716</td>';

                                        echo '<td>P'.($p - 1).'</td>';
                                        echo '<td>MAERSK</td>';
                                        echo '<td>MRSU3882716</td>';


                                        echo '<!--------In House Management-------->';
                                        echo '<td style="background-color: #CCFFCC;">Devan - Night</td>';
                                        echo '<td></td>';
                                        echo '<td></td>';
                                        echo '<td></td>';
                                        echo '<td>P'.($p - 1).'</td>';
                                        echo '<td></td>';
                                        echo '<td>MAERSK</td>';
                                        echo '<td></td>';
                                        echo '<td></td>';
                                        echo '<td>MRSU4049330</td>';
                                        echo '<td>MLJP3545072</td>';
                                        echo '<td></td>';
                                        echo '<td>P'.$p.'</td>';
                                        echo '<td></td>';
                                        echo '<td>TCKU7011440</td>';
                                        echo '<td></td>';
                                        echo '<td></td>';
                                        echo '<td></td>';
                                        echo '<td></td>';
                                        echo '<td></td>';
                                        echo '<td></td>';
                                        echo '</tr>';





                                        $start_date = date('Y-m-d', strtotime("+1 days", strtotime($start_date)));
                                    }
                                    ?>
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
<script src="assets/js/custom.js"></script>
<script>
    $(document).ready(function() {


    });
</script>
</body>
</html>
