<?php
require_once ("config.php");
require_once ("functions.php");
$page_name = "Home";
require_once ("assets.php");
?>
<style>
    .home-menu {
        height: 100%;
        color: #000;
    }

    .home-menu-div {
        padding: 20px;
        text-align: center;
    }

    .home-menu-div:hover {
        background-color: lightskyblue;
        color: #fff;
    }
</style>
<body class="hold-transition sidebar-collapse layout-top-nav" onload="startTime()">
<div class="wrapper">
    <?php include("header.php"); ?>
    <?php include("menu.php"); ?>
    <div class="content-wrapper">
        <div class="content">
            <div class="container-fluid">
                <div class="row">
                    <div class="col-md-12" style="padding-top: 30px;">
                        <div class="row">
                            <div class="col-md-12" style="text-align: center;">
                                <h1 style="color: #0c84ff">Welcome</h1>
                                <h4>Please select from the menu below</h4>
                            </div>
                        </div>
                        <div class="row" style="padding-top: 30px;">
                            <div class="offset-3 col-md-2 home-menu-div text-center">
                                <a href="container_devan_main.php" class="home-menu">
                                    <img src="assets/img/OVERVIEW.png" width="130" height="88"  href="overview.php" alt=""/><br/><br/>
                                    CONTAINER<br/>Devan
                                </a>
                            </div>

                            <div class="col-md-2 home-menu-div text-center">
                                <a href="stocking_overview.php" class="home-menu">
                                    <img src="assets/img/CAM.png" width="130" height="88"  href="overview.php" alt=""/><br/><br/>
                                    STOCKING
                                </a>
                            </div>

                            <div class="col-md-2 home-menu-div text-center">
                                <a href="system_fill_main.php" class="home-menu">
                                    <img src="assets/img/SYSTEM-FILL.png" width="130" height="88"  href="overview.php" alt=""/><br/><br/>
                                    SYSTEM FILL
                                </a>
                            </div>
                            <div class="col-md-2"></div>
                        </div>
                        <div class="row" style="padding-top: 30px;">
                            <div class="offset-3 col-md-2 home-menu-div text-center">
                                <a href="sequence_pick_list.php" class="home-menu">
                                    <img src="assets/img/CONVERYANCE.png" width="130" height="88"  href="overview.php" alt=""/><br/><br/>
                                    SEQUENCE PICK
                                </a>
                            </div>
                            <div class="col-md-2 home-menu-div">
                                <a href="conveyance_delivery.php" class="home-menu">
                                    <img src="assets/img/CASTING.png" width="130" height="88"  href="overview.php" alt=""/><br/><br/>
                                    CONVEYANCE DELIVERY
                                </a>
                            </div>
                            <div class="col-md-4"></div>
                        </div>
                        <div class="row" style="padding-top: 30px;">
                            <div class="offset-3 col-md-2 home-menu-div">
                                <a href="barcode_generator.php" class="home-menu">
                                    <img src="assets/img/REPORTING.png" width="130" height="88"  href="overview.php" alt=""/><br/><br/>
                                    BARCODE GENERATOR
                                </a>
                            </div>
                            <div class="col-md-2 home-menu-div">
                                <a href="admin_system_setting.php" class="home-menu">
                                    <img src="assets/img/ADMINSYS.png" width="130" height="88"  href="overview.php" alt=""/><br/><br/>
                                    ADMIN
                                </a>
                            </div>
                            <div class="col-md-6"></div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <?php include ("footer.php"); ?>
</div>
<script src="plugins/jquery/jquery.min.js"></script>
<script src="plugins/bootstrap/js/bootstrap.bundle.min.js"></script>
<script src="assets/js/adminlte.min.js"></script>
<script src="assets/js/custom.js"></script>
</body>
</html>
