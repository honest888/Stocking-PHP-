<?php
require_once("config.php");
require_once("functions.php");

if (isset($_POST['action'])) {
    $action = $_POST['action'];
    unset($_POST['action']);
    $call = call_user_func($action, $_POST);
}