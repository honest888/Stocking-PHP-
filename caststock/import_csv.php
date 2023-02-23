<?php
require_once 'PHPExcel/PHPExcel.php';
require_once 'PHPExcel/PHPExcel/IOFactory.php';
require_once ("config.php");
require_once ("functions.php");
if ( 0 < $_FILES['file']['error'] ) {
    echo 'Error: ' . $_FILES['file']['error'] . '<br>';
}
else {
    $target = $_POST['target'];
    $file = './csv/' . $_FILES['file']['name'];
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
            if($target == 'part2kanban') {
                foreach($records as $index => $row){
                    if($index > 1) {
                        $row_value = preg_split('/\s+/', $row[0], -1, PREG_SPLIT_NO_EMPTY); //to explode by space, explode does not work for some reason here. I instead used preg_split
                        $kanban = $row_value[0];
                        $part_number = $row_value[1];
                        $query = "SELECT * FROM {$tblPart2Kanban} WHERE kanban = '{$kanban}'";
                        $result = $db->query($query);
                        $k = mysqli_fetch_object($result);
                        if($k) {
                            $sql = "UPDATE {$tblPart2Kanban} SET $part_number = '{$part_number}' WHERE kanban = '{$kanban}'";
                        } else {
                            $sql = "INSERT INTO {$tblPart2Kanban} (kanban, part_number) 
								values('".$kanban."','".$part_number."')";
                        }
                        $db->query($sql);
                    }
                }
            }
            echo 'Success';
        } catch (Exception $e) {
            die('Error loading file "' . pathinfo($file, PATHINFO_BASENAME). '": ' . $e->getMessage());
        }
    }
}
