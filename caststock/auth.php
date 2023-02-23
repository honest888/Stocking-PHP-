<?php
require_once('./config.php');
$username = $_POST['username'];
$member_no = $_POST['member_no'];
if(!isset($_SESSION['page']))
    $_SESSION['page'] = 'index.php';

if(!$username && !$member_no){
    header('Location: login.php');
    exit();
}
$next_page = $_SESSION['page'];
$users = array();
if(!empty($username)){
    $query = "SELECT * FROM {$tblUsers} WHERE username = '{$username}'";
    $result = $db->query($query);
    $user = mysqli_num_rows($result);
    if($user) {
        $sql = "select username, ID, staff from {$tblUsers} where username = '{$username}'";
        $result =$db->query($sql);
        $res = mysqli_fetch_assoc($result);
        $user_info = array(
            'username' => $res['username'],
            'user_id' => $res['ID'],
            'staff' => $res['staff'],
        );
        $_SESSION['user'] = $user_info;
    }
} else {
    $query = "SELECT * FROM {$tblUsers} WHERE staff = '{$member_no}'";
    $result = $db->query($query);
    $user = mysqli_num_rows($result);
    if($user) {
        $sql = "select username, ID, staff from {$tblUsers} where staff = '{$member_no}'";
        $result =$db->query($sql);
        $res = mysqli_fetch_assoc($result);
        $user_info = array(
            'username' => $res['username'],
            'user_id' => $res['ID'],
            'staff' => $res['staff'],
        );
        $_SESSION['user'] = $user_info;
    }
}
if($next_page == 'stocking_input.php') {
    if(!isset($_SESSION['stocking_action']))
        header('Location: stocking_select_action.php');
    else
        header('Location: '.$next_page);
} else {
    header('Location: '.$next_page);
}
exit();
?>