<?php
session_start();
$APP_TITLE = 'Cast Stock';
$DB_HOST = "localhost";
$DB_USER = "root";
$DB_PASSWORD = "";
$DB_NAME = "caststock";

//Table Name
$tblSettings = 'settings';
$tblUsers = 'users';

$tblContainerDevan = 'container_devan';
$tblStocking = 'stocking';
$tblHistory = 'histories';
$tblScanLog = 'scan_log';
$tblParts = 'parts';
$tblHelpAlarm = 'help_alarm';
$tblConveyancePicks = 'conveyance_picks';
$tblDolly = 'dolly';
$tblPart2Kanban = 'part_to_kanban';
$tblOverstock = 'overstock';
$tblStockingTotal = "stocking_total";
$db = new mysqli($DB_HOST,$DB_USER,$DB_PASSWORD,$DB_NAME);
// Check connection
if (mysqli_connect_errno())
{
    echo "Failed to connect to MySQL: " . mysqli_connect_error();
    exit;
}

$g_shifts = array('shift1', 'shift2', 'shift3');

$current    = date('Y-m-d H:i:s');
$today      = date('Y-m-d');
$tomorrow   = date('Y-m-d', strtotime("+1 days"));
$yesterday  = date('Y-m-d', strtotime("-1 days"));
$weekToday  = date('N');

$STOCKING_AREAS = array(
    'L/P',
    'H/P'
);
