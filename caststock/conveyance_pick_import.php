<?php
require_once 'PHPExcel/PHPExcel.php';
require_once 'PHPExcel/PHPExcel/IOFactory.php';
require_once ("config.php");
require_once ("functions.php");
if ( 0 < $_FILES['file']['error'] ) {
    echo 'Error: ' . $_FILES['file']['error'] . '<br>';
}
else {
    $file = '' . $_FILES['file']['name'];
    $result = move_uploaded_file($_FILES['file']['tmp_name'], $file);
    if($result) {
        //Import Excel to DB
        $excel = new PHPExcel();
        try {
            // load uploaded file
            $objPHPExcel = PHPExcel_IOFactory::load($file);
            $sheet = $objPHPExcel->getSheet(0);
            $total_rows = $sheet->getHighestRow();
            $highestColumn      = $sheet->getHighestColumn();
            $highestColumnIndex = PHPExcel_Cell::columnIndexFromString($highestColumn);
            $records = array();
            for ($row = 1; $row <= $total_rows; ++ $row) {
                for ($col = 0; $col < $highestColumnIndex; ++ $col) {
                    $cell = $sheet->getCellByColumnAndRow($col, $row);
                    $val = $cell->getValue();
                    $records[$row][$col] = $val;
                }
            }
            foreach($records as $index => $row){
                if($index > 1) {
                    $kanban = $row[0];
                    $address = $row[1];
                    $location = $row[2];
                    $dolly = $row[3];
                    $dolly_location = $row[4];
                    $part_number = $row[5];
                    $delivery_address = $row[6];
                    $query = "INSERT INTO {$tblConveyancePicks} (kanban, address, location, dolly, kanban_date, imported_at, dolly_location, part_number, delivery_address) 
								values('".$kanban."','".$address."','".$location."','".$dolly."','".$today."', NOW(), '".$dolly_location."','".$part_number."','".$delivery_address."')";
                    $db->query($query);
                }
            }
            echo 'Success';
        } catch (Exception $e) {
            die('Error loading file "' . pathinfo($file, PATHINFO_BASENAME). '": ' . $e->getMessage());
        }
    }
}
