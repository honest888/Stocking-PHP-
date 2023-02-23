<?php
//Login check
function login_check()
{
    if (!isset($_SESSION['user'])) {
        header('Location: login.php');
        exit;
    }
}

function convert_seconds_to_minutes($input_seconds)
{
    $seconds = $input_seconds % 60;
    $minutes = ($input_seconds - $seconds) / 60;
    if ($minutes < 10)
        $minutes = '0' . $minutes;
    if ($seconds < 10)
        $seconds = '0' . $seconds;
    return $minutes . ":" . $seconds;
}

function make_time_string($time)
{
    if (strlen($time) < 5) {
        $time = "0" . $time;
    }
    return $time;
}

function convert_date_string($date)
{
    $string = explode("/", $date);
    return $string[2] . '-' . $string[1] . '-' . $string[0];
}

/*
 * Settings
 */

function get_setting($set_type)
{
    global $db, $tblSettings;
    $query = "SELECT * FROM {$tblSettings} WHERE set_type = '{$set_type}' limit 1";
    $result = $db->query($query);
    if ($result && mysqli_num_rows($result) > 0) {
        $setting = mysqli_fetch_object($result);
        return $setting->set_value;
    } else {
        return '';
    }
}

function update_setting($set_type, $set_value)
{
    global $db, $tblSettings;
    $old_setting = get_setting($set_type);
    if ($old_setting != '')
        $sql = "UPDATE {$tblSettings} SET set_value = '{$set_value}' WHERE set_type = '{$set_type}'";
    else
        $sql = "INSERT INTO {$tblSettings} (set_value, set_type) VALUES ('{$set_value}', '{$set_type}')";

    return $db->query($sql);
}

function save_setting($post_data)
{
    $set_type = $post_data['set_type'];
    $set_value = $post_data['set_value'];
    $result = update_setting($set_type, $set_value);
    if ($result)
        echo 'Ok';
    else
        echo 'Failed';
}


/*
 * Shift Setting & get shift information
 */
function shift_setting($post_data)
{
    $settings['shift1']['start'] = make_time_string($post_data['shift1_start']) . ":00";
    $settings['shift1']['end'] = make_time_string($post_data['shift1_end']) . ":00";

    $settings['shift2']['start'] = make_time_string($post_data['shift2_start']) . ":00";
    $settings['shift2']['end'] = make_time_string($post_data['shift2_end']) . ":00";

    $settings['shift3']['start'] = make_time_string($post_data['shift3_start']) . ":00";
    $settings['shift3']['end'] = make_time_string($post_data['shift3_end']) . ":00";

    for ($i = 0; $i < 3; $i++) {
        $index = $i + 1;
        $settings['shift1']['breaks']['start' . $index] = make_time_string($post_data['shift1_break_start'][$i]) . ":00";
        $settings['shift1']['breaks']['end' . $index] = make_time_string($post_data['shift1_break_end'][$i]) . ":00";

        $settings['shift2']['breaks']['start' . $index] = make_time_string($post_data['shift2_break_start'][$i]) . ":00";
        $settings['shift2']['breaks']['end' . $index] = make_time_string($post_data['shift2_break_end'][$i]) . ":00";

        $settings['shift3']['breaks']['start' . $index] = make_time_string($post_data['shift3_break_start'][$i]) . ":00";
        $settings['shift3']['breaks']['end' . $index] = make_time_string($post_data['shift3_break_end'][$i]) . ":00";
    }

    $shift_setting = json_encode($settings, true);

    $set_type = $post_data['set_type'];
    $result = update_setting($set_type, $shift_setting);

    if ($result)
        echo "ok";
    else
        echo "fail";
    exit;
}

function get_current_shift()
{
    global $current;
    $datetime = $current;
    $shift_pattern = get_setting('Shift Pattern');
    $datetime_arr = explode(" ", $datetime);
    $date = $datetime_arr[0];
    $week_day = date('N', strtotime($date));
    $next_date = date("Y-m-d", strtotime("+1 days", strtotime($date)));
    $pre_date = date("Y-m-d", strtotime("-1 days", strtotime($date)));

    $shift_settings = get_setting($shift_pattern);

    if ($shift_settings != '')
        $shifts = json_decode($shift_settings, true);
    else {
        $string = file_get_contents("./shift.json");
        $shifts = json_decode($string, true);
    }

    if ($shift_pattern == '2 shifts') {
        if ($week_day == 5) { //Friday
            if ($datetime < $date . " " . $shifts['shift1']['start']) {
                $shift['shift'] = "shift2";
                $shift['date'] = $pre_date;
                $shift['start'] = $pre_date . " " . $shifts['shift3']['start'];
                $shift['end'] = $date . " " . $shifts['shift3']['end'];
            } else if ($datetime >= $date . " " . $shifts['shift1']['start'] && $datetime < $date . " " . $shifts['shift3']['start']) {
                $shift['shift'] = "shift1";
                $shift['date'] = $date;
                $shift['start'] = $date . " " . $shifts['shift1']['start'];
                $shift['end'] = $date . " " . $shifts['shift1']['end'];
            } else {
                $shift['shift'] = "shift2";
                $shift['date'] = $date;
                $shift['start'] = $date . " " . $shifts['shift3']['start'];
                $shift['end'] = $next_date . " " . $shifts['shift3']['end'];
            }
        } else {
            if ($datetime < $date . " " . $shifts['shift1']['start']) {
                $shift['shift'] = "shift2";
                $shift['date'] = $pre_date;
                $shift['start'] = $pre_date . " " . $shifts['shift2']['start'];
                $shift['end'] = $date . " " . $shifts['shift2']['end'];
            } else if ($datetime >= $date . " " . $shifts['shift1']['start'] && $datetime < $date . " " . $shifts['shift2']['start']) {
                $shift['shift'] = "shift1";
                $shift['date'] = $date;
                $shift['start'] = $date . " " . $shifts['shift1']['start'];
                $shift['end'] = $date . " " . $shifts['shift1']['end'];
            } else {
                $shift['shift'] = "shift2";
                $shift['date'] = $date;
                $shift['start'] = $date . " " . $shifts['shift2']['start'];
                $shift['end'] = $next_date . " " . $shifts['shift2']['end'];
            }
        }
    } else {
        if ($datetime < $date . " " . $shifts['shift1']['start']) {
            $shift['shift'] = "shift3";
            $shift['date'] = $pre_date;
            $shift['start'] = $pre_date . " " . $shifts['shift3']['start'];
            $shift['end'] = $date . " " . $shifts['shift3']['end'];
        } else if ($datetime >= $date . " " . $shifts['shift1']['start'] && $datetime < $date . " " . $shifts['shift2']['start']) {
            $shift['shift'] = "shift1";
            $shift['date'] = $date;
            $shift['start'] = $date . " " . $shifts['shift1']['start'];
            $shift['end'] = $date . " " . $shifts['shift1']['end'];
        } else if ($datetime >= $date . " " . $shifts['shift2']['start'] && $datetime < $date . " " . $shifts['shift3']['start']) {
            $shift['shift'] = "shift2";
            $shift['date'] = $date;
            $shift['start'] = $date . " " . $shifts['shift2']['start'];
            $shift['end'] = $date . " " . $shifts['shift2']['end'];
        } else {
            $shift['shift'] = "shift3";
            $shift['date'] = $date;
            $shift['start'] = $date . " " . $shifts['shift3']['start'];
            $shift['end'] = $next_date . " " . $shifts['shift3']['end'];
        }
    }

    return $shift;
}

function get_star_end_by_date_shift($date, $shift, $area)
{
    $shift_pattern = get_setting($area . ' Shift Pattern');
    $week_day = date('N', strtotime($date));
    $shift_settings = get_setting($shift_pattern);
    if ($shift_settings != '')
        $shifts = json_decode($shift_settings, true);
    else {
        $string = file_get_contents("./shift.json");
        $shifts = json_decode($string, true);
    }

    if ($week_day == 5) { //Friday
        if ($shift == 'shift2') {
            $start = $shifts['shift3']['start'];
            $end = $shifts['shift3']['end'];
        } else {
            $start = $shifts[$shift]['start'];
            $end = $shifts[$shift]['end'];
        }
    } else {
        $start = $shifts[$shift]['start'];
        $end = $shifts[$shift]['end'];
    }

    $data['start'] = $start;
    $data['end'] = $end;
    return $data;
}

/*
 * User
 */
function get_all_users()
{
    global $db, $tblUsers;
    $query = "SELECT * FROM {$tblUsers}";
    $result = $db->query($query);
    $users = array();
    while ($user = mysqli_fetch_object($result)) {
        array_push($users, array(
            'user_id' => $user->ID,
            'username' => $user->username,
            'staff' => $user->staff,
            'type' => $user->type,
            'last_login' => $user->last_login,
        ));
    }

    return $users;
}

function read_users()
{
    $users = get_all_users();
    foreach ($users as $user) {
        echo '<tr>';
        echo '<td>' . $user['username'] . '</td>';
        echo '<td>' . $user['staff'] . '</td>';
        if ($user['type'] == 1)
            echo '<td><span style="color: red;">Administrator</span></td>';
        else
            echo '<td><span style="color: green;">User</span></td>';

        if (!empty($user['last_login']))
            echo '<td>' . date('d/m/Y H:i:s', strtotime($user['last_login'])) . '</td>';
        else
            echo '<td></td>';
        echo '<td style="text-align: center;">';
        echo '<button class="btn btn-primary btn-sm edit-user" value="' . $user['user_id'] . '" type="button"><i class="fas fa-edit"></i></button>&nbsp;';
        echo '<button class="btn btn-danger btn-sm delete-user" type="button" value="' . $user['user_id'] . '"><i class="fas fa-trash"></i></button>';
        echo '</td>';
        echo '</tr>';
    }
}

function get_user_info($user_id)
{
    global $db, $tblUsers;
    $query = "SELECT * FROM {$tblUsers} WHERE `ID` = {$user_id}";
    $result = $db->query($query);
    return mysqli_fetch_object($result);
}

function read_user($post_data)
{
    $user_id = $post_data['user_id'];
    $user = get_user_info($user_id);
    echo json_encode($user, true);
}

function save_user($post_data)
{
    global $db, $tblUsers;
    $user_id = $post_data['user_id'];
    $username = $post_data['username'];
    $staff = $post_data['staff'];
    $user_type = $post_data['user_type'];
    if ($user_id == 0) {
        $query = "INSERT INTO {$tblUsers}  (`username`, `staff`, `type`) value ('{$username}', '{$staff}', '{$user_type}')";
    } else {
        $query = "UPDATE {$tblUsers} SET `username` = '{$username}', `staff` = '{$staff}', `type` = '{$user_type}' WHERE `ID` = {$user_id}";
    }

    $result = $db->query($query);
    if ($result)
        echo 'Ok';
    else
        echo 'Fail';
}

function delete_user($post_data)
{
    global $db, $tblUsers;
    $user_id = $post_data['user_id'];
    $query = "DELETE FROM {$tblUsers} WHERE `ID` = {$user_id}";
    $result = $db->query($query);
    if ($result)
        echo 'Ok';
    else
        echo 'Fail';
}

function get_user_names($user_ids)
{
    $user_names = array();
    if (!empty($user_ids)) {
        $user_ids = explode(",", $user_ids);
        foreach ($user_ids as $user_id) {
            $user = get_user_info($user_id);
            array_push($user_names, $user->username);
        }
    }
    return implode(", ", $user_names);
}

/*
 * Stocking Lane Management
 */

function save_lane($post_data)
{
    global $db, $tblStocking, $STOCKING_AREAS;
    $area_index = $post_data['area_index'];
    $lane_id = $post_data['lane_id'];
    $lane_no = $post_data['lane_no'];
    $barcode_in = $post_data['barcode_in'];
    //$barcode_out = $post_data['barcode_out'];
    $barcode_out = '';
    $allocation = $post_data['allocation'];
    $height = $post_data['height'];
    $area = $STOCKING_AREAS[$area_index];
    if ($lane_id == 0) {
        $query = "INSERT INTO {$tblStocking}  (`lane_no`, `barcode_in`, `barcode_out`, `allocation`, `height`, `area`)
                    value ('{$lane_no}', '{$barcode_in}', '{$barcode_out}', '{$allocation}', '{$height}', '{$area}')";
    } else {
        $query = "UPDATE {$tblStocking} SET `lane_no` = '{$lane_no}', `barcode_in` = '{$barcode_in}', `barcode_out` = '{$barcode_out}',
                    `allocation` = '{$allocation}', `height` = '{$height}' WHERE `id` = {$lane_id}";
    }
    $result = $db->query($query);
    if ($result)
        echo 'Ok';
    else
        echo 'Fail';
}
function get_max_lane_rows()
{
    global $db, $tblStocking;
    $query = "SELECT MAX(allocation/height) AS maxrow FROM {$tblStocking}";
    $res = mysqli_fetch_object($db->query($query));
    return intval($res->maxrow);
}
function get_all_lanes($area, $order = null)
{
    global $db, $tblStocking;
    if ($order == null)
        $query = "SELECT * FROM {$tblStocking} WHERE `area` = '{$area}'";
    else
        $query = "SELECT * FROM {$tblStocking} WHERE `area` = '{$area}' " . $order;
    $result = $db->query($query);
    $lanes = array();
    while ($lane = mysqli_fetch_object($result)) {
        array_push($lanes, $lane);
    }

    return $lanes;
}

function read_lanes($post_data)
{
    global $STOCKING_AREAS;
    $area_index = $post_data['area_index'];
    $area = $STOCKING_AREAS[$area_index];
    $lanes = get_all_lanes($area);
    echo '<table class="table table-bordered table-striped">';
    echo '<thead>';
    echo '<tr><th>Lane No.</th><th>Barcode</th><th>Allocation</th><th>Height</th><th></th></tr>';
    echo '</thead>';
    if (count($lanes) > 0) {
        foreach ($lanes as $lane) {
            echo '<tr>';
            echo '<td style="text-align: center;">' . $lane->lane_no . '</td>';
            echo '<td style="text-align: center;">' . $lane->barcode_in . '</td>';
            //echo '<td style="text-align: center;">'.$lane->barcode_out.'</td>';
            echo '<td style="text-align: center;">' . $lane->allocation . '</td>';
            echo '<td style="text-align: center;">' . $lane->height . '</td>';
            echo '<td style="text-align: center;">';
            echo '<button class="btn btn-primary btn-sm edit-lane" value="' . $lane->id . '" type="button"><i class="fas fa-edit"></i></button>&nbsp;';
            echo '<button class="btn btn-danger btn-sm delete-lane" type="button" value="' . $lane->id . '"><i class="fas fa-trash"></i></button>';
            echo '</td>';
            echo '</tr>';
        }
    } else {
        echo '<tr><td colspan="5" style="text-align: center;">There is no lane yet.</td></tr>';
    }
}

function get_lane_by_id($lane_id)
{
    global $db, $tblStocking;
    $query = "SELECT * FROM {$tblStocking} WHERE `id` = {$lane_id}";
    $result = $db->query($query);
    return mysqli_fetch_object($result);
}

function get_lane($post_data)
{
    $lane_id = $post_data['lane_id'];
    $lane = get_lane_by_id($lane_id);
    echo json_encode($lane, true);
}

function delete_lane($post_data)
{
    global $db, $tblStocking;
    $lane_id = $post_data['lane_id'];
    $query = "DELETE FROM {$tblStocking} WHERE `id` = {$lane_id}";
    $result = $db->query($query);
    if ($result)
        echo 'Ok';
    else
        echo 'Fail';
}

function set_stocking_action($post_data)
{
    $stocking_action = $post_data['stocking_action'];
    $_SESSION['stocking_action'] = $stocking_action;
    echo 'Success';
}
/*
 * Part Management
 */
function get_all_parts()
{
    global $db, $tblParts;
    $query = "SELECT * FROM {$tblParts} ORDER BY `part_no`";
    $result = $db->query($query);
    $parts = array();
    while ($part = mysqli_fetch_object($result)) {
        array_push($parts, $part);
    }
    return $parts;
}

function read_parts()
{
    $parts = get_all_parts();
    echo '<table class="table table-bordered table-striped">';
    echo '<thead>';
    echo '<tr><th>Part No.</th><th>Part Name</th><th>Amount</th><th>Lock</th><th></th></tr>';
    echo '</thead>';
    if (count($parts) > 0) {
        foreach ($parts as $part) {
            $ar = [];
            if ($part->sf)
                $ar[] = "L/P";
            if ($part->ps)
                $ar[] = "H/P";

            echo '<tr>';
            echo '<td style="text-align: center;">' . $part->part_no . '</td>';
            echo '<td style="text-align: center;">' . $part->part_name . '</td>';
            echo '<td style="text-align: center;">' . $part->amount . '</td>';
            echo '<td style="text-align: center;">' . implode(",", $ar) . '</td>';
            echo '<td style="text-align: center;">';
            echo '<button class="btn btn-primary btn-sm edit-part" value="' . $part->id . '" type="button"><i class="fas fa-edit"></i></button>&nbsp;';
            echo '<button class="btn btn-danger btn-sm delete-part" type="button" value="' . $part->id . '"><i class="fas fa-trash"></i></button>';
            echo '</td>';
            echo '</tr>';
        }
    } else {
        echo '<tr><td colspan="6" style="text-align: center;">There is no part yet.</td></tr>';
    }
}

function save_part($post_data)
{
    global $db, $tblParts;
    $part_id = $post_data['part_id'] ? $post_data['part_id'] : 0;
    $part_no = $post_data['part_no'];
    $part_name = $post_data['part_name'];
    $amount = $post_data['amount'];
    $sf = $post_data['sf_check'] == 'true' ? 1 : 0;
    $ps = $post_data['ps_check'] == 'true' ? 1 : 0;
    $fl = $post_data['fl_check'] == 'true' ? 1 : 0;
    if ($part_id == 0) {
        $query = "INSERT INTO {$tblParts}  (`part_no`, `part_name`, `amount`, `sf`, `ps`, `fl`)
                    value ('{$part_no}', '{$part_name}', '{$amount}', ${sf}, ${ps}, ${fl})";
    } else {
        $query = "UPDATE {$tblParts} SET `part_no` = '{$part_no}', `part_name` = '{$part_name}', `amount` = '{$amount}', `sf` = '{$sf}', `ps` = '{$ps}', `fl` = '{$fl}' WHERE `id` = {$part_id}";
    }
    $result = $db->query($query);
    if ($result)
        echo 'Ok';
    else
        echo 'Fail';
}

function get_part_by_id($id)
{
    global $db, $tblParts;
    $query = "SELECT * FROM {$tblParts} WHERE `id` = {$id}";
    $result = $db->query($query);
    return mysqli_fetch_object($result);
}

function get_part_by_no($no)
{
    global $db, $tblParts;
    $query = "SELECT * FROM {$tblParts} WHERE `part_no` = '{$no}' LIMIT 1";
    $result = $db->query($query);
    return mysqli_fetch_array($result);
}

function get_part($post_data)
{
    $part_id = $post_data['part_id'];
    $part = get_part_by_id($part_id);
    echo json_encode($part, true);
}

function delete_part($post_data)
{
    global $db, $tblParts;
    $part_id = $post_data['part_id'];
    $query = "DELETE FROM {$tblParts} WHERE `id` = {$part_id}";
    $result = $db->query($query);
    if ($result)
        echo 'Ok';
    else
        echo 'Fail';
}

/*
 * Stocking Input
 */
function read_barcode($post_data)
{
    global $db, $tblStocking, $tblScanLog, $_SESSION;

    $shift_id = $post_data['shift_id'];
    $shift_date = $post_data['shift_date'];
    $page = $post_data['page'];
    $user_id = $_SESSION['user']['user_id'];

    $part_barcodes = explode(",", $_POST['part']);
    $lane_barcodes = explode(",", $_POST['lane']);
    $data['error'] = '';
    $data['success'] = '';
    $row = [];
    foreach ($part_barcodes as $index => $part_barcode) {
        $lane_barcode = $lane_barcodes[$index];
        $part = get_part_by_no($part_barcode);
        if ($part) {
            //Get Lane Information
            $query = "SELECT * FROM {$tblStocking} WHERE `barcode_in` = '{$lane_barcode}' LIMIT 1";
            $result = $db->query($query);
            if (mysqli_num_rows($result) > 0) {
                $row = mysqli_fetch_array($result);
                if (($row['area'] == 'L/P') && ($part['sf'] == 0) || ($row['area'] == 'H/P') && ($part['ps'] == 0))
                    $data['error'] = "Part is locked for lane";
                else {
                    $lane_id = $row['id'];
                    $allocation = $row['allocation'];
                    //Get left allocation
                    $query = "SELECT * FROM {$tblScanLog} WHERE `lane_id` = '{$lane_id}' AND `booked_in` = 1 AND `booked_out` = 0";
                    $result = $db->query($query);
                    $allocated = mysqli_num_rows($result);
                    $left_allocation = $allocation - $allocated;
                    $stocking_action = $_SESSION['stocking_action'];
                    if ($stocking_action == 'in') {
                        if ($left_allocation > 0) {
                            $now = date("Y-m-d H:i:s");
                            upsert_total("in", $now, $part['part_no']);
                            // $query = "INSERT INTO {$tblScanLog}  (`part`, `lane_id`, `booked_in`, `booked_out`, `page`, `shift`, `shift_date`, `user_id`, `booked_in_time`)
                            //         value ('{$part_barcode}', '{$lane_id}', 1, 0, '{$page}', '{$shift_id}', '{$shift_date}', {$user_id}, '{$now}')";
                            // $db->query($query);
                        } else {
                            $data['error'] = 'Lane allocation already was 0.';
                        }
                    } else {
                        $query = "SELECT * FROM {$tblScanLog} WHERE `part` = '{$part_barcode}' AND `lane_id` = '{$lane_id}' AND `booked_in` = 1 AND `booked_out` = 0";
                        $result = $db->query($query);
                        $chk = mysqli_num_rows($result);
                        if ($chk > 0) {
                            $now = date("Y-m-d H:i:s");
                            upsert_total("out", $now, $part['part_no']);
                            // $scanned = mysqli_fetch_object($result);
                            // $update = "UPDATE {$tblScanLog} SET `booked_out` = 1, `out_user_id` = {$user_id}, `booked_out_time` = '{$now}' WHERE id = {$scanned->id}";
                            // $db->query($update);
                        } else {
                            $data['error'] = 'There is no scanned in lane';
                        }
                    }
                }
            } else {
                $data['error'] = 'Lane No is incorrect.';
            }
        } else {
            $data['error'] = 'Part No is incorrect.';
        }
        if ($data['error'] == '') {
            if ($_SESSION['stocking_action'] == "out")
                $data['success'] = 'Part : ' . $part['part_no'] . '(' . $part['part_no'] . ') has been scanned out ' . $row['area'] . ', Lane' . $row['lane_no'];
            else
                $data['success'] = 'Part : ' . $part['part_no'] . '(' . $part['part_no'] . ') has been scanned to ' . $row['area'] . ', Lane' . $row['lane_no'];
        }
    }

    $booked_in_out = get_booked_in_out($page, $shift_id, $shift_date);
    $data['booked_in'] = $booked_in_out['booked_in'];
    $data['booked_out'] = $booked_in_out['booked_out'];
    echo json_encode($data, true);
}

function upsert_total($in_out, $action_time, $part_no)
{
    global $db, $tblStockingTotal;
    $action_date = date("Y-m-d", strtotime($action_time));
    $query = "SELECT * FROM {$tblStockingTotal} WHERE action_date='{$action_date}' AND part='{$part_no}'";
    $result = $db->query($query);
    if (mysqli_num_rows($result)) {
        $res = mysqli_fetch_array($result, MYSQLI_ASSOC);

        if ($in_out == 'in')
            $total = $res['total'] + 1;
        else
            $total = $res['total'] - 1;

        $query = "UPDATE {$tblStockingTotal} SET total={$total} WHERE id={$res['id']}";
        $db->query($query);
    } else {
        $query = "SELECT total FROM {$tblStockingTotal} WHERE part='{$part_no}' ORDER BY action_date DESC LIMIT 1";
        $result = $db->query($query);

        if (mysqli_num_rows($result)) {
            $res = mysqli_fetch_array($result, MYSQLI_ASSOC);
            if ($in_out == 'in')
                $total = $res['total'] + 1;
            else
                $total = $res['total'] - 1;
        } else {
            if ($in_out == 'in')
                $total = 1;
            else
                $total = -1;
        }
        $query = "INSERT INTO {$tblStockingTotal} (action_date, total, part) VALUES ('{$action_date}', {$total}, '{$part_no}')";
        $db->query($query);
    }
}
function get_booked_in_out($page, $shift_id, $shift_date)
{
    global $db, $tblScanLog, $_SESSION;
    $query = "SELECT * FROM {$tblScanLog} WHERE `page` = '{$page}' AND `shift` = '{$shift_id}' AND `shift_date` = '{$shift_date}' AND `booked_in` = 1";
    $result = $db->query($query);
    $data['booked_in'] = mysqli_num_rows($result);
    $query = "SELECT * FROM {$tblScanLog} WHERE `page` = '{$page}' AND `shift` = '{$shift_id}' AND `shift_date` = '{$shift_date}' AND `booked_out` = 1";
    $result = $db->query($query);
    $data['booked_out'] = mysqli_num_rows($result);
    return $data;
}

function get_filled_lane($lane_id)
{
    global $db, $tblScanLog;
    $query = "SELECT * FROM {$tblScanLog} WHERE `lane_id` = {$lane_id} AND `booked_in` = 1 AND `booked_out` = 0";
    $result = $db->query($query);
    $filled = array();
    while ($row = mysqli_fetch_object($result)) {
        $date_in = date('d/m/Y H:i:s', strtotime($row->booked_in_time));
        $user = get_user_info($row->user_id);
        array_push($filled, array(
            'part_no' => $row->part,
            'date_in' => $date_in,
            'member' => $user->username
        ));
    }
    return $filled;
}

function read_scan_table($post_data)
{
    global $db, $tblScanLog;
    $shift_id = $post_data['shift_id'];
    $shift_date = $post_data['shift_date'];
    $page = $post_data['page'];
    $query = "SELECT * FROM {$tblScanLog} WHERE `page` = '{$page}' AND `shift` = '{$shift_id}' AND `shift_date` = '{$shift_date}' ORDER BY `booked_in_time` ASC";
    $result = $db->query($query);
    while ($row = mysqli_fetch_object($result)) {
        echo '<tr>';
        echo '<td>' . $row->part . '</td>';
        $lane = get_lane_by_id($row->lane_id);
        echo '<td>' . $lane->area . '</td>';
        echo '<td>Lane ' . $lane->lane_no . '</td>';
        echo '<td style="color: green;">IN</td>';
        echo '<td>' . date('d/m/Y H:i:s', strtotime($row->booked_in_time)) . '</td>';
        $user = get_user_info($row->user_id);
        echo '<td>' . $user->username . '</td>';
        echo '</tr>';

        if ($row->booked_out == 1) {
            echo '<tr>';
            echo '<td>' . $row->part . '</td>';
            echo '<td>' . $lane->area . '</td>';
            echo '<td>Lane ' . $lane->lane_no . '</td>';
            echo '<td style="color: red;">OUT</td>';
            echo '<td>' . date('d/m/Y H:i:s', strtotime($row->booked_out_time)) . '</td>';
            $user = get_user_info($row->out_user_id);
            echo '<td>' . $user->username . '</td>';
            echo '</tr>';
        }
    }
}

function set_help_alarm($post_data)
{
    global $db, $tblHelpAlarm, $_SESSION;
    $page = $post_data['page'];
    $user_id = $_SESSION['user']['user_id'];
    $query = "SELECT * FROM {$tblHelpAlarm} WHERE `is_confirm` = 0 AND `page` = '{$page}' LIMIT 1";
    $result = $db->query($query);
    if (mysqli_num_rows($result) > 0) {
        $row = mysqli_fetch_object($result);
        $sql = "UPDATE {$tblHelpAlarm} SET `clicked_time` = NOW() WHERE id = {$row->id}";
        $db->query($sql);
        $help_id = $row->id;
    } else {
        $sql = "INSERT INTO {$tblHelpAlarm}  (`user_id`, `clicked_time`, `is_confirm`, `page`) value ('{$user_id}', NOW(), 0, '{$page}') ";
        $db->query($sql);
        $help_id = $db->insert_id;
    }

    if ($page == 'Container Devan') {
        $username = $_SESSION['user']['username'];
        echo '<h3>MEMBER: ' . $username . '</h3>';
        echo '<h3>TIME/DATE: ' . date('H:i d/m/y') . '</h3>';
        echo '<input type="hidden" id="help_alarm_id" value="' . $help_id . '">';
    }
}

function get_help_alarm($post_data)
{
    global $db, $tblHelpAlarm;
    $page = $post_data['page'];
    // $query = "SELECT * FROM {$tblHelpAlarm} WHERE `is_confirm` = 0 AND page ='{$page}' LIMIT 1";
    $query = "SELECT * FROM {$tblHelpAlarm} WHERE `is_confirm` = 0 LIMIT 1";
    $result = $db->query($query);
    if (mysqli_num_rows($result) > 0) {
        $row = mysqli_fetch_object($result);
        $user = get_user_info($row->user_id);
        echo '<h3>ANDON HELP</h3>';
        echo '<h3>MEMBER: ' . $user->username . '</h3>';
        echo '<h3>TIME: ' . date('d/m/Y H:i:s', strtotime($row->clicked_time)) . '</h3>';
        echo '<input type="hidden" id="confirm_help_alarm_id" value="' . $row->id . '">';
    } else {
        echo 'NO HELP';
    }
}

function confirm_help_alarm($post_data)
{
    global $db, $tblHelpAlarm, $_SESSION;
    $alarm_id = $post_data['alarm_id'];
    if (isset($post_data['confirm_user_id']))
        $user_id = $post_data['confirm_user_id'];
    else
        $user_id = $_SESSION['user']['user_id'];

    $query = "UPDATE {$tblHelpAlarm} SET is_confirm = 1, confirm_user_id = '{$user_id}', confirm_time = NOW() WHERE id = {$alarm_id}";
    $db->query($query);
}

function get_overview_screen()
{
    global $STOCKING_AREAS;
    foreach ($STOCKING_AREAS as $index => $area) {
        echo '<div class="row">';
        echo '<div class="col-md-12">';
        if ($index == 0) {
            echo '<div class="card card-primary">';
            $cell_bg = '#007bff';
        } else if ($index == 1) {
            echo '<div class="card card-success">';
            $cell_bg = '#28a745';
        } else {
            echo '<div class="card card-warning">';
            $cell_bg = '#ffc107';
        }

        echo '<div class="card-header">';
        echo '<h3 class="card-title">' . $area . '</h3>';
        echo '</div>';

        echo '<div class="card-body">';
        echo '<div style="overflow-x: auto; white-space: nowrap;">';
        $lanes = get_all_lanes($area);
        foreach ($lanes as $lane) {
            $allocation = $lane->allocation;
            $height = $lane->height;

            if ($allocation % $height != 0) {
                $remainder = $height - ($allocation % $height);
                $rows = (int) ($allocation / $height) + 1;
            } else {
                $remainder = 0;
                $rows = (int) ($allocation / $height);
            }
            $height_px = (int) 140 / $height;
            $total_width = $rows * $height_px;

            $filled = get_filled_lane($lane->id);
            echo '<div style="width: auto; display: inline-block;">';
            echo '<h5 style="font-size:16px; text-align: center;">Lane' . $lane->lane_no . ' Filled. ' . count($filled) . '/' . $lane->allocation . '</h5>';
            echo '<table style="width: auto; margin: 10px;" class="float-left">';
            for ($i = 1; $i <= $height; $i++) {
                echo '<tr>';
                for ($c = 1; $c <= $rows; $c++) {
                    $td_index = $height * ($c - 1) + ($height - $i);
                    if ($remainder >= $i && $c == $rows) {
                        echo '<td style="background-color: #FFFFFF; border: 0; width: 50px; height: 50px;">&nbsp;</td>';
                    } else {
                        if (isset($filled[$td_index])) {
                            echo '<td class="has-details" style="background-color: ' . $cell_bg . '; border: 1px solid #a5a3a3; width: 50px; height: 50px;">';
                            echo '<span>&nbsp;</span>';
                            echo '<span class="details" style="width: 300px;">';
                            echo 'Part No: ' . $filled[$td_index]['part_no'] . '<br/>';
                            echo 'Location: ' . $lane->barcode_in . '<br/>';
                            echo 'Date IN: ' . $filled[$td_index]['date_in'] . '<br/>';
                            echo 'Member: ' . $filled[$td_index]['member'];
                            echo '</span>';
                        } else {
                            echo '<td style="background-color: #FFFFFF; border: 1px solid #a5a3a3; width: 50px; height: 50px;">';
                            echo '&nbsp;';
                            echo '</td>';
                        }
                    }
                }
                echo '</tr>';
            }
            echo '</table>';
            echo '</div>';
        }
        echo '</div>';
        echo '</div>'; // card body

        echo '</div>'; // card
        echo '</div>'; // col-md-12
        echo '</div>'; // row
    }
}

function read_history($post_data)
{
    global $db, $tblScanLog;
    $from_date = convert_date_string($post_data['from_date']);
    $start = $from_date . " 00:00:00";
    $to_date = convert_date_string($post_data['to_date']);
    $end = $to_date . " 23:59:59";

    $query = "SELECT * FROM {$tblScanLog} WHERE booked_in_time BETWEEN '{$start}' AND  '{$end}' ORDER BY `booked_in_time` ASC";
    $result = $db->query($query);
    echo '<table id="history_table" class="table table-bordered table-striped dataTable dtr-inline">';
    echo '<thead>';
    echo '<th>Location</th>';
    echo '<th>Lane</th>';
    echo '<th>Part number</th>';
    echo '<th>Timestamp</th>';
    echo '<th>Member</th>';
    echo '</thead>';
    echo '<tbody>';
    while ($row = mysqli_fetch_object($result)) {
        $lane = get_lane_by_id($row->lane_id);
        $user = get_user_info($row->user_id);
        echo '<tr>';
        echo '<td>' . $lane->barcode_in . '</td>';
        echo '<td>Lane ' . $lane->lane_no . '</td>';
        echo '<td>' . $row->part . '</td>';
        echo '<td><span style="display: none;">' . $row->booked_in_time . '</span>' . date('d/m/Y H:i:s', strtotime($row->booked_in_time)) . '</td>';
        echo '<td>' . $user->username . '</td>';
        echo '</tr>';
    }
    echo '</tbody>';
    echo '</table>';
}


/*
 * Container Devan
 */

function get_container_devan($start, $end)
{
    global $db, $tblContainerDevan;
    $query = "SELECT * FROM {$tblContainerDevan} WHERE `date` BETWEEN  '{$start}' AND '{$end}' ORDER BY `date` ASC";
    $result = $db->query($query);
    $items = array();
    while ($row = mysqli_fetch_array($result)) {
        array_push($items, $row);
    }
    return $items;
}

function update_container_devan($post_data)
{
    global $db, $tblContainerDevan;
    $value = $post_data['value'];
    $field = $post_data['field'];
    $row_id = $post_data['row_id'];
    $update_query = "UPDATE {$tblContainerDevan} SET `{$field}` = '{$value}' WHERE id = {$row_id}";
    $result = $db->query($update_query);
    if ($result)
        echo 'Success';
    else
        echo 'Failed';
}

function complete_container_devan($post_data)
{
    global $db, $tblContainerDevan, $_SESSION;

    $row_id = $post_data['row_id'];
    $user_id = $_SESSION['user']['user_id'];
    $revan_state = $post_data['renban'];

    $query1 = "SELECT * FROM {$tblContainerDevan} WHERE id = {$row_id}";
    $r1 = $db->query($query1);
    $row1 = mysqli_fetch_array($r1);

    if ($revan_state == 'revan')
        $update_query = "UPDATE {$tblContainerDevan} SET `revan_state` = '{$revan_state}' WHERE id = {$row_id}";
    else
        $update_query = "UPDATE {$tblContainerDevan} SET `is_completed` = 1, `completed_at` = NOW(), `completed_by` = '{$user_id}', `revan_state` = 'completed' WHERE id = {$row_id}";
    $result = $db->query($update_query);

    if ($result) {
        $query = "SELECT * FROM {$tblContainerDevan} WHERE id = {$row_id}";
        $r = $db->query($query);
        $row = mysqli_fetch_array($r);
        $pre_fix = get_setting('renban_no_prefix');

        if ($row1['revan_state'] == 'scheduled') {
            $str_pre_fix = strval($pre_fix);
            $ind_no = -1;
            foreach (str_split($str_pre_fix) as $ind => $cha) {
                if (is_numeric($cha)) {
                    $ind_no = $ind;
                    break;
                }
            }
            $new_pre_fix_str = substr($str_pre_fix, 0, $ind_no + 1);
            $new_pre_fix_num = intval(substr($str_pre_fix, $ind_no));
            $new_pre_fix = $new_pre_fix_str . strval($new_pre_fix_num + 1);
            update_setting("renban_no_prefix", $new_pre_fix);
            echo $new_pre_fix;
        } else {
            echo $pre_fix;
        }
    } else
        echo 'Failed';
}

function read_container_devan($post_data)
{
    $year_month = explode("/", $post_data['year_month']);
    $this_month_start = $year_month[1] . '-' . $year_month[0] . '-01';
    $start_date = date('Y-m-d', strtotime('previous sunday', strtotime($this_month_start)));
    $this_month_end = date("Y-m-t", strtotime($this_month_start));
    $end_date = date('Y-m-d', strtotime('next monday', strtotime($this_month_end)));

    $container_devan = get_container_devan($start_date, $end_date);
    $pre_date = '';
    if (count($container_devan) > 0) {
        foreach ($container_devan as $index => $row) {
            $date = $row['date'];
            $week_day = date('l', strtotime($date));
            if ($pre_date != $date) {
                if ($week_day == 'Monday') {
                    echo '<tr>';
                    echo '<td colspan="38" style="height: 20px; background-color: #d5d5d5;"></td>';
                    echo '</tr>';
                } else {
                    echo '<tr>';
                    echo '<td colspan="38" style="height: 20px; background-color: white;"></td>';
                    echo '</tr>';
                }
            }

            echo '<tr class="devan-row" data-row="' . $row['id'] . '" data-container="' . $row['in_house_container_number'] . '" data-schedule_date="' . $date . '">';
            if ($row['revan_state'] == 'scheduled')
                $style = 'background-color:red;color:white;';
            else if ($row['revan_state'] == 'revan' || $row['revan_state'] == 'completed')
                $style = 'background-color:#CCFFCC;';
            else
                $style = '';
            echo '<!--------Delivery Management------->';
            echo '<th style="font-weight: bold;">' . date('d-M D', strtotime($date)) . '</th>';
            echo '<th style="font-weight: bold;">' . $row['shift'] . '</th>';
            echo '<th style="font-weight: bold; border-right: 1px solid #878787;">' . $row['time'] . '</th>';

            echo '<td style="' . $style . '"><input type="text" name="inbound_renban_air_freight_case_number" class="form-control input-value" value="' . $row['inbound_renban_air_freight_case_number'] . '"></td>';
            echo '<td style="' . $style . '"><input type="text" name="shipping_line" class="form-control input-value" value="' . $row['shipping_line'] . '"></td>';
            echo '<td style="' . $style . '"><input type="text" name="number_of_zr_modules" class="form-control input-value" value="' . $row['number_of_zr_modules'] . '"></td>';
            echo '<td style="' . $style . '"><input type="text" name="container_number" class="form-control input-value" style="width: 180px;" value="' . $row['container_number'] . '"></td>';
            echo '<td style="' . $style . '">' . $row['pentalver_instructions'] . '</td>';

            echo '<td style="' . $style . '"><input type="text" name="departure_inbound_renban" class="form-control input-value" value="' . $row['departure_inbound_renban'] . '"></td>';
            echo '<td style="' . $style . '"><input type="text" name="departure_export_load_reference" class="form-control input-value" value="' . $row['departure_export_load_reference'] . '"></td>';
            echo '<td style="' . $style . '"><input type="text" name="departure_shipping_line" class="form-control input-value" value="' . $row['departure_shipping_line'] . '"></td>';
            echo '<td style="' . $style . '"><input type="text" name="departure_container_number" class="form-control input-value" style="width: 180px;" value="' . $row['departure_container_number'] . '"></td>';

            echo '<td style="' . $style . '"><input type="text" name="on_dock_inbound_renban" class="form-control input-value" value="' . $row['on_dock_inbound_renban'] . '"></td>';
            echo '<td style="' . $style . '"><input type="text" name="on_dock_shipping_line" class="form-control input-value" value="' . $row['on_dock_shipping_line'] . '"></td>';
            echo '<td style="' . $style . '"><input type="text" name="on_doc_container_number" class="form-control input-value" style="width: 180px;" value="' . $row['on_doc_container_number'] . '"></td>';

            echo '<!--------In House Management-------->';
            echo '<td style="' . $style . '"></td>';
            echo '<td style="' . $style . '">' . $row['in_house_instructions'] . '</td>';
            echo '<td style="' . $style . '"><input type="text" name="confirm_gl_tl_instructions_print_name" class="form-control input-value" value="' . $row['confirm_gl_tl_instructions_print_name'] . '"></td>';
            echo '<td style="' . $style . '"><input type="text" name="confirm_gl_customs_check_print_name" class="form-control input-value" value="' . $row['confirm_gl_customs_check_print_name'] . '"></td>';
            echo '<td style="' . $style . '"><input type="text" name="confirm_module_condition_quantity" class="form-control input-value" value="' . $row['confirm_module_condition_quantity'] . '"></td>';

            echo '<td style="' . $style . '"><input type="text" name="devan_inbound_renban_no_1" class="form-control input-value" value="' . $row['devan_inbound_renban_no_1'] . '"></td>';
            echo '<td style="' . $style . '"><input type="text" name="devan_export_renban" class="form-control input-value" value="' . $row['devan_export_renban'] . '"></td>';
            echo '<td style="' . $style . '"><input type="text" name="devan_shipping_line" class="form-control input-value" value="' . $row['devan_shipping_line'] . '"></td>';
            echo '<td style="' . $style . '"><input type="text" name="devan_zr" class="form-control input-value" style="width: 120px;" value="' . $row['devan_zr'] . '"></td>';
            echo '<td style="' . $style . '"><input type="text" name="pipcont_pipseal" class="form-control input-value" value="' . $row['pipcont_pipseal'] . '"></td>';

            echo '<td style="' . $style . '"><input type="text" name="in_house_container_number" class="form-control input-value" style="width: 180px;" value="' . $row['in_house_container_number'] . '"></td>';
            echo '<td style="' . $style . '"><input type="text" name="expected_seal_no" class="form-control input-value" value="' . $row['expected_seal_no'] . '"></td>';

            echo '<td style="' . $style . '"></td>';

            echo '<td style="' . $style . '"><input type="text" name="deeside_yard_inbound_renban_no_1" class="form-control input-value" value="' . $row['deeside_yard_inbound_renban_no_1'] . '"></td>';
            echo '<td style="' . $style . '"><input type="text" name="deeside_yard_tapped_modules_no_1" class="form-control input-value" value="' . $row['deeside_yard_tapped_modules_no_1'] . '"></td>';
            echo '<td style="' . $style . '"><input type="text" name="deeside_yard_container_number_no_1" class="form-control input-value" style="width: 180px;" value="' . $row['deeside_yard_container_number_no_1'] . '"></td>';
            echo '<td style="' . $style . '"><input type="text" name="deeside_yard_inbound_renban_no_2" class="form-control input-value" value="' . $row['deeside_yard_inbound_renban_no_2'] . '"></td>';
            echo '<td style="' . $style . '"><input type="text" name="deeside_yard_tapped_modules_no_2" class="form-control input-value" value="' . $row['deeside_yard_tapped_modules_no_2'] . '"></td>';
            echo '<td style="' . $style . '"><input type="text" name="deeside_yard_container_number_no_2" class="form-control input-value" style="width: 180px;" value="' . $row['deeside_yard_container_number_no_2'] . '"></td>';
            echo '<td style="' . $style . '"><input type="text" name="deeside_yard_inbound_renban_no_3" class="form-control input-value" value="' . $row['deeside_yard_inbound_renban_no_3'] . '"></td>';
            echo '<td style="' . $style . '"><input type="text" name="deeside_yard_tapped_modules_no_3" class="form-control input-value" value="' . $row['deeside_yard_tapped_modules_no_3'] . '"></td>';
            echo '<td style="' . $style . '"><input type="text" name="deeside_yard_container_number_no_3" class="form-control input-value" style="width: 180px;" value="' . $row['deeside_yard_container_number_no_3'] . '"></td>';
            echo '</tr>';
            $pre_date = $date;
        }
    } else {
        echo 'there is no data yet';
    }
}

function read_container_devan_member_screen($post_data)
{
    global $db, $tblContainerDevan, $today;
    if ($post_data['date'] == 'today') {
        //$query = "SELECT * FROM {$tblContainerDevan} WHERE `revan_state` = 'scheduled' ORDER BY `date` ASC LIMIT 1";
        $query = "SELECT * FROM {$tblContainerDevan} WHERE `date` >= '{$today}' AND `is_completed` = 0 AND `inbound_renban_air_freight_case_number`!='' ORDER BY `date` ASC LIMIT 1";
    } else {
        $date = convert_date_string($post_data['date']);
        $query = "SELECT * FROM {$tblContainerDevan} WHERE `date` >= '{$date}' AND `is_completed` = 0  AND `inbound_renban_air_freight_case_number`!='' ORDER BY `date` ASC LIMIT 1";
    }

    $result = $db->query($query);
    if (mysqli_num_rows($result) > 0) {
        $devan = mysqli_fetch_array($result);
        //var_dump($devan);exit();
        //Update Renban No
        $renban_no = get_setting('renban_no_prefix');
        //$renban_no = update_renban_no($devan['id']);

        echo '<div class="row" style="background-color: #1797FF; color: #FFF;">';
        echo '<div class="offset-md-2 col-md-7" style="padding: 50px 10px; min-width: 650px;">';
        if ($devan['shift'] == 'D')
            $shift = 'Days';
        else
            $shift = 'Night';

        //if north america member plan, we show it at the top
        $devan_plan = $devan['inbound_renban_air_freight_case_number'];
        $devan_plan_flag = false;
        $complete_btn_disabled = "disabled";
        if (strpos(strtolower($devan_plan), "devan") !== false || strpos(strtolower($devan_plan), "america") !== false) {
            $devan_plan_flag = true;
        }

        //if north america member plan
        if ($devan_plan_flag) {
            $devan_plan_value = rtrim(explode("-", $devan_plan)[0]);
            echo '<h1 style="font-size: 48px;text-align: center;">' . $devan_plan_value . '</h1>';
            $complete_btn_disabled = "";
        }

        //Date, Shift and Time
        echo '<h1 style="font-size: 48px;"><span style="margin-right: 148px;">' . date('d/m/Y', strtotime($devan['date'])) . '</span><span style="margin-right: 60px;">' . $shift . '</span><span>' . $devan['time'] . '</span></h1>';
        //Container Renban
        //if north america member dose not need to confirm container number to press finish
        if (!strpos(strtolower($devan_plan), "devan") && !strpos(strtolower($devan_plan), "america")) {
            echo '<label style="font-size: 48px; font-weight: normal">Container Renban:</label>';
            echo '<input type="text" id="container_renban" name="container_renban" class="form-control" style="width: 420px; display: inline-block; height: 60px; font-size: 48px;">';
            echo '<button class="btn btn-primary" data-revan="' . $devan['revan_state'] . '" id="btn_chk_container_renban" style="height: 60px; margin-left: 20px; width: 160px; margin-top: -20px; font-size: 32px;" value="' . $devan['on_dock_inbound_renban'] . '">CHECK</button>';
        }

        //Container No
        echo '<h1 style="font-size: 48px;">Container No: <span style="color: white;">' . $devan['on_doc_container_number'] . '</span></h1>';

        //Reban
        echo '<h1 style="font-size: 48px;">';
        echo 'Renban No: <span id="renban_no">' . $renban_no . '</span>';
        echo '</h1>';

        //Reban
        echo '<div style="width: 100%; text-align: center;" >';
        echo '<button class="btn btn-success" id="btn_complete" style="width: 240px; font-size:36px; margin:0;" ' . $complete_btn_disabled . ' value="' . $devan['id'] . '" data-renban="check">Complete</button>';
        echo '</div>';
        echo '</div>';
        echo '<div class="col-md-3" style="display: flex; align-items: center;">';
        echo '<button class="btn bg-yellow devan-help" style="font-size: 36px; border-radius: 100px; width: 200px; height: 200px;">Help <br/>Andon</button>';
        echo '</div>';
        echo '</div>';
    } else {
        echo '<p style="text-align: center; padding: 30px; font-size: 30px;">There is no scheduled job yet</p>';
    }
}

function update_renban_no($devan_id)
{
    global $db, $tblContainerDevan;
    $pre_fix = get_setting('renban_no_prefix');
    //$query = "SELECT * FROM {$tblContainerDevan} WHERE id < '{$devan_id}' AND is_completed = 1 ORDER BY `departure_inbound_renban` DESC LIMIT 1";
    $query = "SELECT * FROM {$tblContainerDevan} WHERE is_completed = 1 ORDER BY `departure_inbound_renban` DESC LIMIT 1";
    $result = $db->query($query);
    if (mysqli_num_rows($result) > 0) {
        $devan = mysqli_fetch_array($result);
        $old_inbound_renban = $devan['departure_inbound_renban'];
        $new_reban_no = (int) $old_inbound_renban + 1;
        if ($new_reban_no < 10)
            $renban_no = $pre_fix . '0000' . $new_reban_no;
        else if ($new_reban_no >= 10 && $new_reban_no < 100)
            $renban_no = $pre_fix . '000' . $new_reban_no;
        else if ($new_reban_no >= 100 && $new_reban_no < 1000)
            $renban_no = $pre_fix . '00' . $new_reban_no;
        else if ($new_reban_no >= 1000 && $new_reban_no < 10000)
            $renban_no = $pre_fix . '0' . $new_reban_no;
        else
            $renban_no = $pre_fix . $new_reban_no;
        $update_query = "UPDATE {$tblContainerDevan} SET `departure_inbound_renban` = '{$new_reban_no}' WHERE id = {$devan_id}";
    } else {
        $update_query = "UPDATE {$tblContainerDevan} SET `departure_inbound_renban` = '1' WHERE id = {$devan_id}";
        $renban_no = $pre_fix . '00001';
    }
    $result = $db->query($update_query);
    return $renban_no;
}

function update_revan_state($post_data)
{
    global $db, $tblContainerDevan;
    $container_number = $post_data['container_number'];
    $today = date('Y-m-d');
    $query = "UPDATE {$tblContainerDevan} SET revan_state = 'scheduled' WHERE in_house_container_number = '{$container_number}' AND `date` >= '{$today}'";
    $result = $db->query($query);
    if ($result)
        echo $today;
    else
        echo 'Failed';
}


/*
 * Stocking Page
 */

function read_area_lane_status($post_data, $direction = NULL)
{
    global $db, $tblScanLog, $STOCKING_AREAS, $tblParts;
    $part_no = $post_data['part_no'];
    $page = $post_data['page'];
    if (!isset($direction))
        $direction = $_SESSION['stocking_action'];
    else
        $direction = $post_data['direction'];
    if (empty($part_no))
        $query = "SELECT * FROM {$tblScanLog} WHERE `page` = '{$page}' AND `booked_in` = 1 AND `booked_out` = 0";
    else
        $query = "SELECT * FROM {$tblScanLog} WHERE `page` = '{$page}' AND `booked_in` = 1 AND `booked_out` = 0 AND `part` = '{$part_no}'";
    $result = $db->query($query);
    $rows = mysqli_num_rows($result);
    $filled_lanes = array();
    if ($rows > 0) {
        while ($row = mysqli_fetch_object($result)) {
            if (!in_array($row->lane_id, $filled_lanes))
                array_push($filled_lanes, $row->lane_id);
        }
    } else {
        $part_no = '';
    }
    $query = "SELECT * FROM {$tblParts} WHERE part_no='" . $part_no . "'";
    $this_part = mysqli_fetch_array($db->query($query));

    $areas = array();

    $lanes;
    $areas_name = $STOCKING_AREAS;
    if (!intval($this_part['sf']))
        unset($areas_name[array_search('L/P', $areas_name)]);
    if (!intval($this_part['ps']))
        unset($areas_name[array_search('H/P', $areas_name)]);
    foreach ($areas_name as $index => $area) {
        $lanes = get_all_lanes($area);
        foreach ($lanes as $lane) {
            $allocation = $lane->allocation;
            $query = "SELECT * FROM {$tblScanLog} WHERE `page` = '{$page}' AND `booked_in` = 1 AND `booked_out` = 0 AND `lane_id` = {$lane->id}";
            $result = $db->query($query);
            $filled_allocations = mysqli_num_rows($result);
            $left_allocations = $allocation - $filled_allocations;
            if (!empty($part_no)) {
                if ($filled_allocations == 0 || in_array($lane->id, $filled_lanes)) {
                    $areas[$area][] = array(
                        'lane' => 'Lane ' . $lane->lane_no,
                        'allocation' => $allocation,
                        'filled_allocation' => $filled_allocations,
                    );
                }
            } else {
                if ($filled_allocations == 0) {
                    $areas[$area][] = array(
                        'lane' => 'Lane ' . $lane->lane_no,
                        'allocation' => $allocation,
                        'filled_allocation' => $filled_allocations,
                    );
                }
            }
        }
    }

    $return_html = '<div class="row">';
    $all_lanes;
    $stock_available_lanes = array();
    $lanes_html = "";
    $lanes_count = array(); //to get the location/area which has the most number of available lanes
    $lanes_have_most_stock = ""; //to get the lane which has the most stocks > 0
    $area_have_most_stock = "";
    $default_lane_stock;

    foreach ($areas as $area => $lanes) {
        $all_lanes = $lanes;
        $default_lane_stock = (isset($lanes) && !empty($lanes)) ? $lanes[0]["filled_allocation"] : 0;
        break;
    }

    foreach ($areas as $area => $lanes) {
        $all_lanes = $lanes;

        $lanes_html .= '<div class="col-sm-4">';
        $lanes_html .= '<h1>' . $area . '</h1>';
        $lanes_html .= '<table class="table table-bordered table-striped">';
        if (!empty($part_no)) {
            $lanes_html .= '<tr><th>Part</th><th>' . $part_no . '</th></tr>';
        }

        $lanes_html .= '<tr><td colspan="2" style="text-align: left;">Lanes Available</td></tr>';

        foreach ($lanes as $lane) {
            if ($lane["filled_allocation"] >= $default_lane_stock && $lane["filled_allocation"] <= $lane["allocation"]) {
                $area_have_most_stock = $area;
                $lanes_have_most_stock = $lane['lane'];
            }

            $lanes_html .= '<tr class="cursor_pointed lane_row" data-lane="' . $lane["lane"] . '" style="cursor: pointer;">';
            $lanes_html .= '<td>' . $lane['lane'] . '</td>';
            $lanes_html .= '<td>' . $lane['filled_allocation'] . '/' . $lane['allocation'] . '</td>';
            $lanes_html .= '</tr>';

            //show scan in/out lane info with available stocks > 0
            array_push($stock_available_lanes, explode(" ", $lane['lane'])[1]);
        }

        //array_push($lanes_count, count($lanes));
        $lanes_html .= '</table>';
        $lanes_html .= '</div>';
    }
    $lanes_html .= '</div>';

    //set default values
    if (empty($lanes_have_most_stock) && empty($area_have_most_stock)) {
        foreach ($areas as $area => $lanes) {
            $area_have_most_stock = $area;
            foreach ($lanes as $lane) {
                $lanes_have_most_stock = $lane['lane'];
                break;
            }
        }
    }

    //for scan in case
    /*$most_have_lanes_index = array_search(max($lanes_count), $lanes_count);
    $area_code = $STOCKING_AREAS[$most_have_lanes_index];*/

    //oldest scaned in/out lanes html on the top of the table
    $oldest_scanned_lanes_html = get_oldest_lanes_scanned($stock_available_lanes, $post_data, $direction, $area_have_most_stock, $lanes_have_most_stock);

    $return_html = $return_html . $oldest_scanned_lanes_html . $lanes_html;
    echo $return_html;
}

//get oldest scan in/out lane info
function get_oldest_lanes_scanned($stock_available_lanes, $post_data, $direction, $area_code, $lean_name)
{ // direction : in/out
    global $db, $tblScanLog, $tblStocking;
    $part_no = $post_data["part_no"];
    $return_html = '';

    //if direction out-> the one with the oldest part scanned in
    if ($direction == "out") {
        if ($stock_available_lanes)
            $sort_query = "SELECT id, part, page, lane_id, lane_id_fl FROM {$tblScanLog} WHERE `lane_id` IN (" . implode(',', $stock_available_lanes) . ")" . " AND `part`='" . $part_no . "'ORDER BY booked_in_time ASC LIMIT 1";
        else
            return $return_html;

        $sort_result = $db->query($sort_query);
        if ($sort_result->num_rows > 0) {
            while ($row = mysqli_fetch_object($sort_result)) {
                $part_no = $row->part;

                if ($row->lane_id_fl) {
                    $query = "SELECT * FROM {$tblStocking} WHERE id = {$row->lane_id}";

                    $res = mysqli_fetch_object($db->query($query));

                    $ind_no = -1;
                    foreach (str_split($res->barcode_in) as $ind => $cha) {
                        if (is_numeric($cha)) {
                            $ind_no = $ind;
                            break;
                        }
                    }
                    $new_pre_fix_str = substr($res->barcode_in, 0, $ind_no);
                    $new_pre_fix = $new_pre_fix_str . strval($row->lane_id_fl);
                    $lean_name = $new_pre_fix;
                } else {
                    $tem = mysqli_fetch_object($db->query("SELECT * FROM {$tblStocking} WHERE id={$row->lane_id}"));
                    $lean_name = "Lane " . $tem->lane_no;
                    $area_code = $tem->area;
                }
            }
        }
    }

    $return_html = '
        <div class="col-sm-4 oldest_info_div" style="color: white;text-align: center;">
            <h1>Part: ' . strtoupper($part_no) . '</h1>
        </div>
        <div class="col-sm-4 oldest_info_div" style="color: yellow;text-align: center;">
            <h1>Area: ' . $area_code . '</h1>
        </div>
        <div class="col-sm-4 oldest_info_div" style="color: red;text-align: center;">
            <h1>Lane: ' . $lean_name . '</h1>
        </div>
    ';

    return $return_html;
}

function get_filled_lanes_by_part($post_data)
{
    global $db, $tblScanLog;
    $part_no = $post_data['part_no'];
    $page = $post_data['page'];
    $query = "SELECT * FROM {$tblScanLog} WHERE `page` = '{$page}' AND `booked_in` = 1 AND `booked_out` = 0 AND `part` = '{$part_no}'";
    $result = $db->query($query);
    $rows = mysqli_num_rows($result);
    $filled_lanes = array();
    if ($rows > 0) {
        while ($row = mysqli_fetch_object($result)) {
            if (!in_array($row->lane_id, $filled_lanes)) {
                array_push($filled_lanes, $row->lane_id);
            }
        }
    }
    $part = get_part_by_no($part_no);
    $data['part'] = $part;
    $amount = 0;
    $lanes = array();
    var_dump($filled_lanes);
    exit;
    foreach ($filled_lanes as $lane_id) {
        $query = "SELECT * FROM {$tblScanLog} WHERE `page` = '{$page}' AND `booked_in` = 1 AND `booked_out` = 0 AND `lane_id` = {$lane_id}";
        $result = $db->query($query);
        $lane_inf = get_lane_by_id($lane_id);
        $location_index = $lane_inf->allocation;
        $locations = array();
        while ($row = mysqli_fetch_object($result)) {
            if ($row->part == $part['part_no']) {
                array_push($locations, $location_index);
                $amount += $part['amount'];
            }
            $location_index--;
        }
        array_push($lanes, array(
            'lane_id' => $lane_inf->id,
            'lane_no' => $lane_inf->lane_no,
            'area' => $lane_inf->area,
            'locations' => implode(", ", $locations)
        ));
    }
    $data['lanes'] = $lanes;
    $data['amount'] = $amount;
    echo json_encode($data, true);
}

function load_overview_screen($post_data)
{
    global $db, $tblScanLog, $STOCKING_AREAS;
    $page = $post_data['page'];
    $td_data = array();
    foreach ($STOCKING_AREAS as $index => $area) {
        $lanes = get_all_lanes($area);
        foreach ($lanes as $lane) {
            $query = "SELECT * FROM {$tblScanLog} WHERE `page` = '{$page}' AND `booked_in` = 1 AND `booked_out` = 0 AND `lane_id` = {$lane->id}";
            $result = $db->query($query);
            $filled_allocations = mysqli_num_rows($result);
            $allocations = $lane->allocation;
            $height = $lane->height;

            if ($filled_allocations) {
                $tmp = mysqli_fetch_array($result);
                array_push($td_data, array(
                    'id' => 'td_' . $lane->id . '_0',
                    'td_class' => $tmp['part'] . "-color"
                ));
            }


            if ($area == 'H/P') {
                $index = ceil($allocations / $height);
                if ($allocations % $height != 0)
                    $index++;

                for ($i = $height; $i <= $allocations; $i += $height) {
                    $td_class = '';
                    $box_size = $index * $height;
                    if ($filled_allocations >= $box_size)
                        $td_class = 'full-td';
                    else {
                        $diff = $box_size - $filled_allocations;
                        $reminder = $filled_allocations % $height;
                        if ($diff < $height) {
                            if ($reminder < 2)
                                $td_class = 'l-full-td';
                            else
                                $td_class = 'm-full-td';
                        }
                    }

                    if ($td_class != '')
                        array_push($td_data, array(
                            'id' => 'td_' . $lane->id . '_' . $i,
                            'td_class' => $td_class
                        ));

                    $index--;
                }

                if ($allocations < $i && $allocations > ($i - $height)) {
                    if ($filled_allocations >= $height)
                        $td_class = 'full-td';
                    else if ($filled_allocations <= $height - 1)
                        $td_class = 'm-full-td';
                    else if ($filled_allocations <= $height - 1)
                        $td_class = 'l-full-td';
                    else
                        $td_class = '';

                    if ($td_class != '')
                        array_push($td_data, array(
                            'id' => 'td_' . $lane->id . '_' . $i,
                            'td_class' => $td_class
                        ));
                }
            }

            if ($area == 'L/P') {
                if ($allocations % $height == 0)
                    $start = $allocations;
                else
                    $start = $allocations + ($height - $allocations % $height);
                $index = 1;
                for ($i = $start; $i >= $height; $i -= $height) {
                    $td_class = '';
                    $box_size = $index * $height;
                    if ($filled_allocations >= $box_size)
                        $td_class = 'full-td';
                    else {
                        $diff = $box_size - $filled_allocations;
                        $reminder = $filled_allocations % $height;
                        if ($diff < $height) {
                            if ($reminder < 2)
                                $td_class = 'l-full-td';
                            else
                                $td_class = 'm-full-td';
                        }
                    }
                    if ($td_class != '')
                        array_push($td_data, array(
                            'id' => 'td_' . $lane->id . '_' . $i,
                            'td_class' => $td_class
                        ));
                    $index++;
                }
            }
        }
    }

    echo json_encode($td_data, true);
}

function get_box_data($post_data)
{
    global $db, $tblScanLog;
    $lane_id = $post_data['lane_id'];
    $page = $post_data['page'];
    $box_index = $post_data['box_index'];
    $lane = get_lane_by_id($lane_id);
    $area = $lane->area;
    $height = $lane->height;
    $allocations = $lane->allocation;

    $start = $height * $box_index;
    $end = $height;

    echo '<table class="table">';
    echo '<tr>';

    echo '<td colspan="2">Area: ' . $area . '</td>';
    $colspan = $height - 1;
    echo '<td colspan="' . $colspan . '">Lane: ' . $lane->lane_no . '</td>';
    echo '</tr>';

    echo '<tr>';
    echo '<td style="">Location: </td>';

    $s = $allocations - $box_index * $height;
    $e = $s - $height;
    for ($i = $s; $i > $e; $i--) {
        echo '<td style="">' . $i . '</td>';
    }
    echo '</tr>';

    $query = "SELECT * FROM {$tblScanLog} WHERE `page` = '{$page}' AND `booked_in` = 1 AND `booked_out` = 0 AND `lane_id` = {$lane->id}
                ORDER BY `booked_in_time` ASC LIMIT {$start}, {$end}";
    $result = $db->query($query);
    if (mysqli_num_rows($result)) {
        $data = array();
        while ($row = mysqli_fetch_object($result)) {
            if (!empty($row->user_id)) {
                $user = get_user_info($row->user_id);
                $user_name = $user->username;
            } else {
                $user_name = '';
            }

            $part = get_part_by_no($row->part);
            if ($part)
                $amount = $part['amount'];
            else
                $amount = '';

            array_push($data, array(
                'date' => date('d/m/Y', strtotime($row->booked_in_time)),
                'member' => $user_name,
                'part_no' => $row->part,
                'amount' => $amount,
            ));
        }
    } else {
        $left = $allocations - $box_index;
        $query = "SELECT * FROM {$tblScanLog} WHERE `page` = '{$page}' AND `booked_in` = 1 AND `booked_out` = 0 AND `lane_id` = {$lane->id} AND `lane_id_fl` = {$left}
        ORDER BY `booked_in_time` ASC LIMIT 1";
        $result = $db->query($query);
        $data = array();
        while ($row = mysqli_fetch_object($result)) {
            if (!empty($row->user_id)) {
                $user = get_user_info($row->user_id);
                $user_name = $user->username;
            } else {
                $user_name = '';
            }

            $part = get_part_by_no($row->part);
            if ($part)
                $amount = $part['amount'];
            else
                $amount = '';

            array_push($data, array(
                'date' => date('d/m/Y', strtotime($row->booked_in_time)),
                'member' => $user_name,
                'part_no' => $row->part,
                'amount' => $amount,
            ));
        }
    }


    echo '<tr>';
    echo '<td>Date IN: </td>';
    $cols = 1;
    foreach ($data as $item) {
        echo '<td>' . $item['date'] . '</td>';
        $cols++;
    }
    if ($height > 1)
        for ($i = 0; $i < $height - $cols + 1; $i++) {
            echo '<td></td>';
        }
    echo '</tr>';

    //Member
    echo '<tr>';
    echo '<td>Member: </td>';
    $cols = 1;
    foreach ($data as $item) {
        echo '<td>' . $item['member'] . '</td>';
        $cols++;
    }
    if ($height > 1)
        for ($i = 0; $i < $height - $cols + 1; $i++) {
            echo '<td></td>';
        }
    echo '</tr>';

    echo '<tr>';
    echo '<td>Part No: </td>';
    $cols = 1;
    foreach ($data as $item) {
        echo '<td>' . $item['part_no'] . '</td>';
        $cols++;
    }
    if ($height > 1)
        for ($i = 0; $i < $height - $cols + 1; $i++) {
            echo '<td></td>';
        }
    echo '</tr>';

    echo '<tr>';
    echo '<td>Amount: </td>';
    $cols = 1;
    foreach ($data as $item) {
        echo '<td>' . $item['amount'] . '</td>';
        $cols++;
    }
    if ($height > 1)
        for ($i = 0; $i < $height - $cols + 1; $i++) {
            echo '<td></td>';
        }
    echo '</tr>';
    echo '</tr>';


    echo '</table>';
}

function go_to_overstock($post_data)
{
    global $db, $tblOverstock;
    $part = $post_data['part'];
    $page = $post_data['page'];
    $stock_action = $_SESSION['stocking_action'];
    if ($stock_action == 'in') {
        $query = "INSERT INTO {$tblOverstock}  (`part`, `page`, `created_at`) value ('{$part}', '{$page}', NOW())";
        $db->query($query);
    } else {
        $query = "SELECT * FROM {$tblOverstock} WHERE part='{$part}' AND page ='{$page}' LIMIT 1";
        $result = $db->query($query);
        $row = mysqli_fetch_object($result);
        if ($row) {
            $id = $row->id;
            $query = "DELETE FROM {$tblOverstock} WHERE id = {$id}";
            $db->query($query);
        }
    }
    echo 'Success';
}

function overstock_view()
{
    global $db, $tblOverstock;
    $query = "SELECT part, COUNT(part) as 'quantity' FROM {$tblOverstock} GROUP BY part";
    $result = $db->query($query);
    echo '<table class="table table-bordered">';
    echo '<thead>';
    echo '<tr><th>Part</th><th>Quantity</th></tr>';
    echo '</thead>';
    while ($row = mysqli_fetch_assoc($result)) {
        echo '<tr>';
        echo '<td>' . $row['part'] . '</td>';
        echo '<td>X' . $row['quantity'] . '</td>';
        echo '</tr>';
    }
    echo "</table>";
}

/*get barcode in from lane number*/
function get_barcodein_from_laneno()
{
    $lane_no = $_POST["lane_id"];
    global $db, $tblStocking;
    $query = "SELECT barcode_in as 'barcode' FROM {$tblStocking} where `lane_no` ='" . $lane_no . "'";
    $result = $db->query($query);

    $row = mysqli_fetch_object($result);
    if ($row) {
        echo $row->barcode;
    } else
        echo "failure";
}

/*
 * Conveyance
 */
function read_kanban_box($post_data)
{
    global $db, $tblConveyancePicks;
    $pick_date = convert_date_string($post_data['pick_date']);
    $kanban_id = $post_data['kanban_id'];
    $status = $post_data['status'];
    $error = '';

    if ($status == 'pick') {
        //Get total unpicked kanban
        $query = "SELECT * FROM {$tblConveyancePicks} WHERE is_delivered = 0 AND kanban_date = '{$pick_date}'";
        $result = $db->query($query);
        $total_unpicked = mysqli_num_rows($result);

        //Get picked kanban
        $query = "SELECT * FROM {$tblConveyancePicks} WHERE is_completed = 1 AND kanban_date = '{$pick_date}'";
        $result = $db->query($query);
        $total_picked = mysqli_num_rows($result);
        $data['pick_status'] = $total_picked . '/' . $total_unpicked;
    } else {
        //Get total unpicked kanban
        $query = "SELECT * FROM {$tblConveyancePicks} WHERE is_completed = 1 AND kanban_date = '{$pick_date}'";
        $result = $db->query($query);
        $total_unpicked = mysqli_num_rows($result);

        //Get picked kanban
        $query = "SELECT * FROM {$tblConveyancePicks} WHERE is_delivered = 1 AND kanban_date = '{$pick_date}'";
        $result = $db->query($query);
        $total_picked = mysqli_num_rows($result);
        $data['pick_status'] = $total_picked . '/' . $total_unpicked;
    }

    if ($kanban_id == 0) {
        if ($status == 'pick') {
            $query = "SELECT * FROM {$tblConveyancePicks} WHERE is_completed = 0 AND kanban_date = '{$pick_date}' ORDER BY `imported_at` ASC LIMIT 1";
            $result = $db->query($query);
            $num_rows = mysqli_num_rows($result);
            if ($num_rows == 0) {
                $query = "SELECT * FROM {$tblConveyancePicks} WHERE kanban_date = '{$pick_date}' ORDER BY `imported_at` ASC LIMIT 1";
                $result = $db->query($query);
                $num_rows = mysqli_num_rows($result);
                if ($num_rows == 0) {
                    $error = 'There is no kanban';
                }
            }
        } else {
            $query = "SELECT * FROM {$tblConveyancePicks} WHERE is_completed = 1 AND is_delivered = 0 AND kanban_date = '{$pick_date}' ORDER BY `imported_at` ASC LIMIT 1";
            $result = $db->query($query);
            $num_rows = mysqli_num_rows($result);
            $error = '';
            if ($num_rows == 0) {
                $query = "SELECT * FROM {$tblConveyancePicks} WHERE kanban_date = '{$pick_date}' ORDER BY `imported_at` ASC LIMIT 1";
                $result = $db->query($query);
                $num_rows = mysqli_num_rows($result);
                if ($num_rows == 0) {
                    $error = 'There is no kanban';
                }
            }
        }
    } else {
        $query = "SELECT * FROM {$tblConveyancePicks} WHERE id = {$kanban_id}";
        $result = $db->query($query);
        $num_rows = mysqli_num_rows($result);
    }

    if ($num_rows > 0) {
        $kanban = mysqli_fetch_object($result);
        $data['kanban_id'] = $kanban->id;
        $data['kanban'] = $kanban->kanban;
        $data['part_number'] = get_part_number_by_kanban($kanban->kanban);
        $data['address'] = $kanban->address;
        $data['is_completed'] = $kanban->is_completed;
        $data['is_delivered'] = $kanban->is_delivered;
        $data['is_help'] = $kanban->is_help;
        $data['dolly_location'] = $kanban->dolly_location;
        $data['delivery_address'] = $kanban->delivery_address;
        //Get dolly color
        $dolly = get_dolly_by_name($kanban->dolly);
        if ($dolly)
            $data['color'] = $dolly->color;
        else
            $data['color'] = '#3B23A7';
    }
    $data['error'] = $error;
    echo json_encode($data, true);
}

function get_part_number_by_kanban($kanban)
{
    global $tblPart2Kanban, $db;
    $query = "SELECT * FROM {$tblPart2Kanban} WHERE kanban = '{$kanban}'";
    $result = $db->query($query);
    $k = mysqli_fetch_object($result);
    if ($k) {
        return $k->part_number;
    } else {
        return '';
    }
}

function read_pick_list($post_data)
{
    global $db, $tblConveyancePicks;
    $pick_date = convert_date_string($post_data['pick_date']);
    $status = $post_data['status'];
    $query = "SELECT * FROM {$tblConveyancePicks} WHERE kanban_date = '{$pick_date}' ORDER BY `imported_at` ASC";
    $result = $db->query($query);
    $num_rows = mysqli_num_rows($result);
    $n = intval(floor($num_rows / 2)) + 1;
    $picks = array();
    while ($pick = mysqli_fetch_object($result)) {
        $dolly = get_dolly_by_name($pick->dolly);
        $dolly_name = '';
        $dolly_color = '';
        if ($dolly) {
            $dolly_name = $dolly->name;
            $dolly_color = $dolly->color;
        }
        array_push($picks, array(
            'id' => $pick->id,
            'kanban' => $pick->kanban,
            'address' => $pick->address,
            'dolly' => $dolly_name,
            'dolly_location' => $pick->dolly_location,
            'color' => $dolly_color,
            'is_completed' => $pick->is_completed,
            'is_help' => $pick->is_help,
            'is_delivered' => $pick->is_delivered,
            'delivery_address' => $pick->delivery_address,
        ));
    }

    echo '<div class="col-md-6" style="min-height: 360px;">';
    if ($num_rows > 0) {
        echo '<table class="table table-bordered">';
        for ($i = 0; $i < $n; $i++) {
            make_pick_list_tr($picks[$i], $status);
        }
        echo '</table>';
    }
    echo '</div>';

    echo '<div class="col-md-6"  style="min-height: 360px;">';
    if ($num_rows > 0) {
        echo '<table class="table table-bordered">';
        for ($i = $n; $i < $num_rows; $i++) {
            make_pick_list_tr($picks[$i], $status);
        }
        echo '</table>';
    }
    echo '</div>';
}

function make_pick_list_tr($pick, $status)
{
    if ($status == 'pick') {
        if ($pick['is_completed'] == 1)
            $class = 'completed-kanban';
        else if ($pick['is_help'] == 1)
            $class = 'helped-kanban';
        else
            $class = 'uncompleted-kanban';
    } else {
        if ($pick['is_delivered'] == 1)
            $class = 'completed-kanban';
        else if ($pick['is_help'] == 1)
            $class = 'helped-kanban';
        else
            $class = 'uncompleted-kanban';
    }

    echo '<tr data-kanban="' . $pick['id'] . '">';
    echo '<td style="text-align: center;">';
    echo '<span>kanban</span><br/>';
    echo '<span class="' . $class . ' select-kanban" data-kanban="' . $pick['id'] . '">' . $pick['kanban'] . '</span>';
    echo '</td>';
    echo '<td style="text-align: center;">';
    echo '<span>Address</span><br/>';
    if ($status == 'pick')
        echo '<span class="' . $class . '  select-kanban" data-kanban="' . $pick['id'] . '">' . $pick['address'] . '</span>';
    else
        echo '<span class="' . $class . '  select-kanban" data-kanban="' . $pick['id'] . '">' . $pick['delivery_address'] . '</span>';
    echo '</td>';
    echo '<td style="text-align: center;">';
    echo '<span>' . $pick['dolly_location'] . '</span><br/>';
    echo '<button class="btn  select-kanban" style="width: 70px; height: 30px; background-color: ' . $pick['color'] . '"  data-kanban="' . $pick['id'] . '"></button>';
    echo '</td>';
    echo '</tr>';
}

function conveyance_pick($post_data)
{
    global $tblConveyancePicks, $db, $current;
    $kanban_id = $post_data['kanban_id'];
    if ($kanban_id) {
        $query = "UPDATE {$tblConveyancePicks} SET is_completed = 1, picked_at ='{$current}' WHERE id = {$kanban_id}";
        $result = $db->query($query);
        if ($result)
            echo 'ok';
        else
            echo 'failed';
    } else {
        echo 'failed';
    }
}

function check_pick_finish($post_data)
{
    global $tblConveyancePicks, $db;
    $pick_date = convert_date_string($post_data['pick_date']);
    $status = $post_data['status'];
    if ($status == 'pick') {
        $query = "SELECT * FROM {$tblConveyancePicks} WHERE is_completed = 0 AND kanban_date = '{$pick_date}'";
        $result = $db->query($query);
        $num = mysqli_num_rows($result);
        if ($num == 0)
            echo 'success';
        else {
            $query = "SELECT * FROM {$tblConveyancePicks} WHERE is_completed = 0 AND is_help = 1 AND kanban_date = '{$pick_date}'";
            $result = $db->query($query);
            $num = mysqli_num_rows($result);
            if ($num == 0)
                echo 'in_progress';
            else
                echo 'in_help';
        }
    } else {
        $query = "SELECT * FROM {$tblConveyancePicks} WHERE is_delivered = 0";
        $result = $db->query($query);
        $num = mysqli_num_rows($result);
        if ($num == 0)
            echo 'success';
        else {
            $query = "SELECT * FROM {$tblConveyancePicks} WHERE is_completed = 1 AND is_delivered = 0 AND is_help = 1";
            $result = $db->query($query);
            $num = mysqli_num_rows($result);
            if ($num == 0)
                echo 'in_progress';
            else
                echo 'in_help';
        }
    }
}

function conveyance_andon_help($post_data)
{
    global $tblConveyancePicks, $db;
    $kanban_id = $post_data['kanban_id'];
    $status = $post_data['status'];
    if ($kanban_id) {
        if ($status == 'pick')
            $query = "UPDATE {$tblConveyancePicks} SET is_completed = 0, is_help = 1 WHERE id = {$kanban_id}";
        else
            $query = "UPDATE {$tblConveyancePicks} SET is_delivered = 0, is_help = 1 WHERE id = {$kanban_id}";
        $result = $db->query($query);
        if ($result)
            echo 'ok';
        else
            echo 'failed';
    } else {
        echo 'failed';
    }
}

function confirm_conveyance_andon_help($post_data)
{
    global $tblConveyancePicks, $db;
    $kanban_id = $post_data['kanban_id'];
    $helped_user = $post_data['confirm_user_id'];
    if ($kanban_id) {
        $query = "UPDATE {$tblConveyancePicks} SET is_help = 0, helped_user = {$helped_user} WHERE id = {$kanban_id}";
        $result = $db->query($query);
        if ($result)
            echo 'ok';
        else
            echo 'failed';
    } else {
        echo 'failed';
    }
}

function read_delivery_kanban_boxes($post_data)
{
    global $db, $tblConveyancePicks;
    $kanban_id = $post_data['kanban_id'];
    $direction = $post_data['direction'];

    if ($direction == 'prev') {
        if (empty($kanban_id))
            $query = "SELECT * FROM {$tblConveyancePicks} WHERE is_completed =1 ORDER BY `imported_at` ASC LIMIT 3";
        else {
            $max = $kanban_id + 1;
            $min = $kanban_id - 2;
            if ($min < 0)
                $min = 0;
            $query = "SELECT * FROM {$tblConveyancePicks} WHERE is_completed = 1 AND id <= {$max} AND id > {$min} ORDER BY `imported_at` ASC LIMIT 3";
        }
    } else {
        if (empty($kanban_id))
            $query = "SELECT * FROM {$tblConveyancePicks} WHERE is_completed = 1 ORDER BY `imported_at` ASC LIMIT 3";
        else {
            $max = $kanban_id + 1;
            $min = $kanban_id - 2;
            $query = "SELECT * FROM {$tblConveyancePicks} WHERE is_completed = 1 AND id <= {$max} AND id > {$min} ORDER BY `imported_at` ASC LIMIT 3";
        }
    }
    $result = $db->query($query);
    $num_rows = mysqli_num_rows($result);
    if ($num_rows == 0) {
        for ($i = 1; $i <= 3; $i++) {
            make_d_kanban_box($i);
        }
    } else {
        $rows = array();
        if (empty($kanban_id)) {
            array_push($rows, null);
        }
        while ($row = mysqli_fetch_array($result)) {
            array_push($rows, array(
                'id' => $row['id'],
                'kanban' => $row['kanban'],
                'location' => $row['location'],
                'is_delivered' => $row['is_delivered'],
                'is_help' => $row['is_help'],
            ));
        }
        if (empty($kanban_id) && count($rows) > 3) {
            unset($rows[count($rows) - 1]);
        }

        if ($direction == 'prev') {
            if (count($rows) == 2) {
                array_unshift($rows, null);
            }
            if (count($rows) == 1) {
                array_unshift($rows, null);
                array_unshift($rows, null);
            }
        } else {
            if (count($rows) == 2) {
                array_push($rows, null);
            }

            if (count($rows) == 1) {
                array_push($rows, null);
                array_push($rows, null);
            }
        }
        foreach ($rows as $index => $row) {
            $i = $index + 1;
            make_d_kanban_box($i, $row);
        }
    }
}

function make_d_kanban_box($index, $row = null)
{
    global $tblConveyancePicks, $db, $today;
    if ($row == null) {
        $kanban = '';
        $location = '';
        $kanban_id = '';
        $is_delivered = 0;
        $is_help = 0;
    } else {
        $kanban = $row['kanban'];
        $location = $row['location'];
        $kanban_id = $row['id'];
        $is_delivered = $row['is_delivered'];
        $is_help = $row['is_help'];
    }

    if ($index == 2)
        $bg_class = 'blue-kanban';
    else
        $bg_class = 'grey-kanban';

    if ($is_delivered == 1)
        $bg_class = 'green-kanban';
    if ($is_help == 1)
        $bg_class = 'red-kanban';

    if ($index == 1) {
        echo '<div class="col-md-3 m-0 p-0">';
        echo '<div class="d-flex flex-column align-items-center kanban ' . $bg_class . '">';

        echo '<div class="item-div">';
        echo '<span>Prev.</span>';
        echo '</div>';

        echo '<div class="item-div" id="input_div">';
        echo '<input type="text" class="form-control kanban_input" id="kanban_input" name="kanban_input" autofocus placeholder="Kanban">';
        echo '<input type="hidden" id="input_type" name="input_type" value="kanban">';
        echo '</div>';

        echo '<div class="item-div">';
        echo '<h2>Kanban</h2>';
        echo '<h1>' . $kanban . '</h1>';
        echo '</div>';

        echo '<div class="item-div">';
        echo '<a style="cursor: pointer;" id="go_prev_kanban"><img src="assets/img/prev.png" style="width: 15%; height: auto;"></a>';
        echo '</div>';

        echo '<div class="item-div">';
        echo '<h2>Location</h2>';
        echo '<h1>' . $location . '</h1>';
        echo '</div>';

        echo '<input type="hidden" id="prev_id" value="' . $kanban_id . '">';
        echo '</div>';
        echo '</div>';
    }

    if ($index == 2) {
        //Get total unpicked kanban
        $query = "SELECT * FROM {$tblConveyancePicks} WHERE is_completed = 1";
        $result = $db->query($query);
        $total_unpicked = mysqli_num_rows($result);

        //Get picked kanban
        $today_start = $today . " 00:00:00";
        $query = "SELECT * FROM {$tblConveyancePicks} WHERE is_delivered = 1 AND deliveried_at > '{$today_start}'";
        $result = $db->query($query);
        $total_picked = mysqli_num_rows($result);

        echo '<div class="col-md-6 m-0 p-0">';
        echo '<div class="d-flex flex-column kanban ' . $bg_class . '" id="current_kanban_area">';

        echo '<div class="item-div">';
        echo '<span>current</span>';
        echo '</div>';

        echo '<div class="item-div">';
        echo '<span class="date-string m-2">' . date('d/m/Y', strtotime($today)) . '</span>';
        echo '<span class="date-string m-2">Delivery List</span>';
        echo '<span class="pick-list  m-2">' . $total_picked . '/' . $total_unpicked . '</span>';
        echo '</div>';

        echo '<div class="item-div">';
        echo '<h2 style="color: #b8b7b7;">Kanban: </h2>';
        echo '<h1>' . $kanban . '</h1>';
        echo '</div>';

        echo '<div class="item-div">';
        echo '<h2 style="color: #b8b7b7;">Address: </h2>';
        echo '<h1>' . $location . '</h1>';
        echo '</div>';
        echo '<input type="hidden" id="current_kanban_no" value="' . $kanban . '">';
        echo '<input type="hidden" id="current_kanban_location" value="' . $location . '">';
        echo '<input type="hidden" id="current_kanban_id" value="' . $kanban_id . '">';
        if ($is_help == 1)
            echo '<input type="hidden" id="chk_is_help" value="1">';
        else
            echo '<input type="hidden" id="chk_is_help" value="0">';
        echo '</div>';
        echo '</div>';
    }

    if ($index == 3) {
        echo '<div class="col-md-3 m-0 p-0">';
        echo '<div class="d-flex flex-column align-items-center kanban ' . $bg_class . '">';

        echo '<div class="item-div">';
        echo '<span>Next</span>';
        echo '</div>';

        echo '<div class="item-div">';
        echo '<h2>Kanban</h2>';
        echo '<h1>' . $kanban . '</h1>';
        echo '</div>';

        echo '<div class="item-div">';
        echo '<a style="cursor: pointer;" id="go_next_kanban"><img src="assets/img/next.png" style="width: 15%; height: auto;"></a>';
        echo '</div>';

        echo '<div class="item-div">';
        echo '<h2>Address</h2>';
        echo '<h1>' . $location . '</h1>';
        echo '</div>';

        echo '<input type="hidden" id="next_id" value="' . $kanban_id . '">';
        echo '</div>';
        echo '</div>';
    }
}

function conveyance_delivery($post_data)
{
    global $tblConveyancePicks, $db, $current;
    $kanban_id = $post_data['kanban_id'];
    if ($kanban_id) {
        $query = "UPDATE {$tblConveyancePicks} SET is_delivered = 1, deliveried_at ='{$current}' WHERE id = {$kanban_id}";
        $result = $db->query($query);
        if ($result)
            echo 'ok';
        else
            echo 'failed';
    } else {
        echo 'failed';
    }
}

/*
 * Dolly Admin
 */
function get_all_dolly()
{
    global $db, $tblDolly;
    $query = "SELECT * FROM {$tblDolly} ORDER BY `name`";
    $result = $db->query($query);
    $dolly = array();
    while ($item = mysqli_fetch_object($result)) {
        array_push($dolly, $item);
    }
    return $dolly;
}

function get_dolly_by_name($name)
{
    global $db, $tblDolly;
    $query = "SELECT * FROM {$tblDolly} WHERE name = '{$name}' LIMIT 1";
    $result = $db->query($query);
    $dolly = mysqli_fetch_object($result);
    return $dolly;
}

function save_dolly($post_data)
{
    global $db, $tblDolly;
    $dolly_id = $post_data['dolly_id'];
    $dolly_name = $post_data['dolly_name'];
    $color = $post_data['color'];
    if ($dolly_id == 0) {
        $query = "INSERT INTO {$tblDolly}  (`name`, `color`)
                    value ('{$dolly_name}', '{$color}')";
        $result = $db->query($query);
        $insert_id = $db->insert_id;
        echo '<tr id="tr_dolly_' . $insert_id . '">';
        echo '<td><input type="text" class="form-control dolly-name" name="dolly_name" value="' . $dolly_name . '"></td>';
        echo '<td>';
        echo '<div class="input-group dolly-colorpicker colorpicker-element" id="dolly_color_' . $insert_id . '">
                    <input type="text" class="form-control" name="dolly_color" id="input_dolly_color_' . $insert_id . '" value="' . $color . '" data-original-title="" title="">
                    <div class="input-group-append">
                        <span class="input-group-text"><i class="fas fa-square" style="color: ' . $color . '"></i></span>
                    </div>
                </div>';
        echo '</td>';
        echo '<td style="text-align: center;"><button type="button" class="btn btn-danger delete-dolly" value="' . $insert_id . '">Delete</button></td>';
        echo '</tr>';
    } else {
        $query = "UPDATE {$tblDolly} SET `name` = '{$dolly_name}', `color` = '{$color}' WHERE `id` = {$dolly_id}";
        $result = $db->query($query);
        if ($result)
            echo 'Ok';
        else
            echo 'Fail';
    }
}

function update_dolly($post_data)
{
    global $db, $tblDolly;
    $dolly_id = $post_data['dolly_id'];
    $field = $post_data['field'];
    $value = $post_data['value'];
    $update_query = "UPDATE {$tblDolly} SET `{$field}` = '{$value}' WHERE id = {$dolly_id}";
    $result = $db->query($update_query);
    if ($result)
        echo 'Success';
    else
        echo 'Failed';
}

function delete_dolly($post_data)
{
    global $db, $tblDolly;
    $dolly_id = $post_data['dolly_id'];
    $query = "DELETE FROM {$tblDolly} WHERE `id` = {$dolly_id}";
    $result = $db->query($query);
    if ($result)
        echo 'Ok';
    else
        echo 'Fail';
}

/*
 * Part to Kanban
 */

function get_all_part2kanban()
{
    global $db, $tblPart2Kanban;
    $query = "SELECT * FROM {$tblPart2Kanban} ORDER BY `kanban`";
    $result = $db->query($query);
    $kanban = array();
    while ($item = mysqli_fetch_object($result)) {
        array_push($kanban, $item);
    }
    return $kanban;
}

function save_part2kanban($post_data)
{
    global $db, $tblPart2Kanban;
    $item_id = $post_data['item_id'];
    $kanban = $post_data['kanban'];
    $part_number = $post_data['part_number'];
    if ($item_id == 0) {
        $query = "INSERT INTO {$tblPart2Kanban}  (`kanban`, `part_number`)
                    value ('{$kanban}', '{$part_number}')";
        $db->query($query);
        $insert_id = $db->insert_id;
        echo '<tr id="tr_p2k_' . $insert_id . '">';
        echo '<td><input type="text" class="form-control kanban" name="kanban" value="' . $kanban . '"></td>';
        echo '<td>';
        echo '<input type="text" class="form-control part_number" name="part_number" value="' . $part_number . '">';
        echo '</td>';
        echo '<td style="text-align: center;">';
        echo '<button type="button" class="btn btn-primary btn-sm save-part2kanban" value="' . $insert_id . '">Save</button>&nbsp;';
        echo '<button type="button" class="btn btn-danger btn-sm delete-part2kanban" value="' . $insert_id . '">Delete</button>';
        echo '</td>';
        echo '</tr>';
    } else {
        $query = "UPDATE {$tblPart2Kanban} SET `kanban` = '{$kanban}', `part_number` = '{$part_number}' WHERE `id` = {$item_id}";
        $result = $db->query($query);
        if ($result)
            echo 'Ok';
        else
            echo 'Fail';
    }
}

function delete_part2kanban($post_data)
{
    global $db, $tblPart2Kanban;
    $item_id = $post_data['item_id'];
    $query = "DELETE FROM {$tblPart2Kanban} WHERE `id` = {$item_id}";
    $result = $db->query($query);
    if ($result)
        echo 'Ok';
    else
        echo 'Fail';
}

function read_part2kanban()
{
    $dolly = get_all_part2kanban();
    foreach ($dolly as $item) {
        echo '<tr id="tr_p2k_' . $item->id . '">';
        echo '<td><input type="text" class="form-control kanban" name="kanban" value="' . $item->kanban . '"></td>';
        echo '<td>';
        echo '<input type="text" class="form-control part_number" name="part_number" value="' . $item->part_number . '">';
        echo '</td>';
        echo '<td style="text-align: center;">';
        echo '<button type="button" class="btn btn-primary btn-sm save-part2kanban" value="' . $item->id . '">Save</button>&nbsp;';
        echo '<button type="button" class="btn btn-danger btn-sm delete-part2kanban" value="' . $item->id . '">Delete</button>';
        echo '</td>';
        echo '</tr>';
    }
}

function read_graph_week($post_data)
{
    global $tblScanLog, $tblStockingTotal, $db;
    $part = $post_data['part'];
    if ($part == 'lp') {
        $part_str = "'ZRC', 'ZRKC'";
        $vals = ['ZRC', 'ZRKC'];
    } else {
        $part_str = "'ZRB', 'ZRKB'";
        $vals = ['ZRB', 'ZRKB'];
    }

    $temp = explode("-W", $post_data['week']);
    $first_day = date('Y-m-d', strtotime($temp[0] . "W" . $temp[1] . "1"));
    $last_day = date('Y-m-d', strtotime($temp[0] . "W" . $temp[1] . "7"));

    $period =  new DatePeriod(
        new DateTime($first_day),
        new DateInterval('P1D'),
        new DateTime($last_day)
    );
    $xaxis = array();
    foreach ($period as $key => $value) {
        array_push($xaxis, $value->format('Y-m-d'));
    }

    $in_count_array = array();
    $query = "SELECT COUNT(id) AS count, DATE(booked_in_time) AS in_date FROM {$tblScanLog} WHERE DATE(booked_in_time)>= '{$first_day}' AND DATE(booked_in_time) <= '{$last_day}' AND part IN ({$part_str}) GROUP BY in_date ORDER BY in_date";

    $result = mysqli_fetch_all($db->query($query), MYSQLI_ASSOC);
    foreach ($xaxis as $each) {
        $in_count_array[$each] = 0;
    }
    foreach ($result as $each) {
        $in_count_array[$each['in_date']] = $each['count'];
    }

    $out_count_array = array();
    $query = "SELECT COUNT(id) AS count, DATE(booked_out_time) AS out_date FROM {$tblScanLog} WHERE DATE(booked_out_time)>= '{$first_day}' AND DATE(booked_out_time) <= '{$last_day}' AND part IN ({$part_str}) GROUP BY out_date ORDER BY out_date";
    $result = mysqli_fetch_all($db->query($query), MYSQLI_ASSOC);

    foreach ($xaxis as $each) {
        $out_count_array[$each] = 0;
    }
    foreach ($result as $each) {
        $out_count_array[$each['out_date']] = $each['count'];
    }

    $val1 = array();
    $val2 = array();
    foreach ($vals as $index => $each_val) {
        $query = "SELECT * FROM {$tblStockingTotal} WHERE DATE(action_date)>= '{$first_day}' AND DATE(action_date) <= '{$last_day}' AND part = '{$each_val}'";

        $result = mysqli_fetch_all($db->query($query), MYSQLI_ASSOC);
        foreach ($xaxis as $each) {
            ${"val" . ($index + 1)}[$each] = 0;
        }
        foreach ($result as $each) {
            ${"val" . ($index + 1)}[$each['action_date']] = $each['total'];
        }
    }


    $return = [
        'xaxis' => $xaxis,
        'in_count_array' => array_values($in_count_array),
        'out_count_array' => array_values($out_count_array),
        'val1' => array_values($val1),
        'val2' => array_values($val2)
    ];

    echo json_encode($return);
}

function read_graph_month($post_data)
{
    global $tblScanLog, $db, $tblStockingTotal;
    $part = $post_data['part'];
    if ($part == 'lp') {
        $part_str = "'ZRC', 'ZRKC'";
        $vals = ['ZRC', 'ZRKC'];
    } else {
        $part_str = "'ZRB', 'ZRKB'";
        $vals = ['ZRB', 'ZRKB'];
    }

    $first_day = $post_data['month'] . "-01";
    $last_day = date("Y-m-t", strtotime($first_day));

    $period =  new DatePeriod(
        new DateTime($first_day),
        new DateInterval('P1D'),
        new DateTime($last_day)
    );
    $xaxis = array();
    foreach ($period as $key => $value) {
        array_push($xaxis, $value->format('Y-m-d'));
    }

    $in_count_array = array();
    $query = "SELECT COUNT(id) AS count, DATE(booked_in_time) AS in_date FROM {$tblScanLog} WHERE DATE(booked_in_time)>= '{$first_day}' AND DATE(booked_in_time) <= '{$last_day}' AND part IN ({$part_str}) GROUP BY in_date ORDER BY in_date";

    $result = mysqli_fetch_all($db->query($query), MYSQLI_ASSOC);
    foreach ($xaxis as $each) {
        $in_count_array[$each] = 0;
    }
    foreach ($result as $each) {
        $in_count_array[$each['in_date']] = $each['count'];
    }

    $out_count_array = array();
    $query = "SELECT COUNT(id) AS count, DATE(booked_out_time) AS out_date FROM {$tblScanLog} WHERE DATE(booked_out_time)>= '{$first_day}' AND DATE(booked_out_time) <= '{$last_day}' AND part IN ({$part_str}) GROUP BY out_date ORDER BY out_date";
    $result = mysqli_fetch_all($db->query($query), MYSQLI_ASSOC);

    foreach ($xaxis as $each) {
        $out_count_array[$each] = 0;
    }
    foreach ($result as $each) {
        $out_count_array[$each['out_date']] = $each['count'];
    }

    $val1 = array();
    $val2 = array();
    foreach ($vals as $index => $each_val) {
        $query = "SELECT * FROM {$tblStockingTotal} WHERE DATE(action_date)>= '{$first_day}' AND DATE(action_date) <= '{$last_day}' AND part = '{$each_val}'";

        $result = mysqli_fetch_all($db->query($query), MYSQLI_ASSOC);
        foreach ($xaxis as $each) {
            ${"val" . ($index + 1)}[$each] = 0;
        }
        foreach ($result as $each) {
            ${"val" . ($index + 1)}[$each['action_date']] = $each['total'];
        }
    }


    $return = [
        'xaxis' => $xaxis,
        'in_count_array' => array_values($in_count_array),
        'out_count_array' => array_values($out_count_array),
        'val1' => array_values($val1),
        'val2' => array_values($val2)
    ];

    echo json_encode($return);
}

function read_graph_year($post_data)
{
    global $tblScanLog, $db, $tblStockingTotal;
    $part = $post_data['part'];
    if ($part == 'lp') {
        $part_str = "'ZRC', 'ZRKC'";
        $vals = ['ZRC', 'ZRKC'];
    } else {
        $part_str = "'ZRB', 'ZRKB'";
        $vals = ['ZRB', 'ZRKB'];
    }
    $first_month = $post_data['year'] . "-01";
    $last_month = $post_data['year'] . "-12";

    $xaxis = array();
    for ($i = 1; $i <= 12; $i++) {
        if ($i < 10)
            array_push($xaxis, "{$post_data['year']}-0{$i}");
        else
            array_push($xaxis, $post_data['year'] . "-" . strval($i));
    }

    $in_count_array = array();
    $query = "SELECT COUNT(id) AS count, DATE_FORMAT(booked_in_time, '%Y-%m') AS in_month FROM {$tblScanLog} WHERE DATE_FORMAT(booked_in_time, '%Y-%m') >= '{$first_month}' AND DATE_FORMAT(booked_in_time, '%Y-%m') <= '{$last_month}' AND part IN ({$part_str}) GROUP BY in_month ORDER BY in_month";

    $result = mysqli_fetch_all($db->query($query), MYSQLI_ASSOC);
    foreach ($xaxis as $each) {
        $in_count_array[$each] = 0;
    }
    foreach ($result as $each) {
        $in_count_array[$each['in_month']] = $each['count'];
    }

    $out_count_array = array();
    $query = "SELECT COUNT(id) AS count, DATE_FORMAT(booked_out_time, '%Y-%m') AS out_month FROM {$tblScanLog} WHERE DATE_FORMAT(booked_out_time, '%Y-%m') >= '{$first_month}' AND DATE_FORMAT(booked_out_time, '%Y-%m') <= '{$last_month}' AND part IN ({$part_str}) GROUP BY out_month ORDER BY out_month";

    $result = mysqli_fetch_all($db->query($query), MYSQLI_ASSOC);
    foreach ($xaxis as $each) {
        $out_count_array[$each] = 0;
    }
    foreach ($result as $each) {
        $out_count_array[$each['out_month']] = $each['count'];
    }

    $val1 = array();
    $val2 = array();
    foreach ($vals as $index => $each_val) {
        $query = "SELECT SUM(total) AS total, DATE_FORMAT(action_date, '%Y-%m') AS action_month FROM {$tblStockingTotal} WHERE DATE_FORMAT(action_date, '%Y-%m') >= '{$first_month}' AND DATE_FORMAT(action_date, '%Y-%m') <= '{$last_month}' AND part = '{$each_val}'";

        $result = mysqli_fetch_all($db->query($query), MYSQLI_ASSOC);
        foreach ($xaxis as $each) {
            ${"val" . ($index + 1)}[$each] = 0;
        }
        foreach ($result as $each) {
            ${"val" . ($index + 1)}[$each['action_month']] = $each['total'];
        }
    }

    $return = [
        'xaxis' => $xaxis,
        'in_count_array' => array_values($in_count_array),
        'out_count_array' => array_values($out_count_array),
        'val1' => array_values($val1),
        'val2' => array_values($val2)
    ];


    echo json_encode($return);
}
