<?php
require_once 'PHPExcel/PHPExcel.php';
require_once 'PHPExcel/PHPExcel/IOFactory.php';
require_once ("config.php");
require_once ("functions.php");
if ( 0 < $_FILES['file']['error'] ) {
    echo 'Error: ' . $_FILES['file']['error'] . '<br>';
}
else {
    $file = 'container_devan_data' . $_FILES['file']['name'];
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

            //  loop over the rows
            $start_row = 27;
            $records = $array = array(
                array(
                    'date',
                    'shift',
                    'time',
                    'inbound_renban_air_freight_case_number',
                    'shipping_line',
                    'container_number',
                    'pentalver_instructions',
                    'departure_inbound_renban',
                    'departure_shipping_line',
                    'departure_container_number',
                    'on_dock_inbound_renban',
                    'on_dock_shipping_line',
                    'on_doc_container_number',
                    'in_house_instructions',
                    'devan_inbound_renban_no_1',
                    'devan_shipping_line',
                    'in_house_container_number',
                    'expected_seal_no',
                    'deeside_yard_inbound_renban_no_1',
                    'deeside_yard_container_number_no_1',
                    'approved_by',
                    ),
            );
            $col = PHPExcel_Cell::columnIndexFromString('CL') - 1;
            $approved_by = $sheet->getCellByColumnAndRow($col, 1)->getValue();

            $cell = $sheet->getCellByColumnAndRow(0, $start_row);
            $val = $cell->getValue();
            $start_date = $stringDate = \PHPExcel_Style_NumberFormat::toFormattedString($val, 'YYYY-MM-DD');
            $index = 1;
            $need_column_index = array(0,1,3,4,7,15,18,19,22,30,31,34,42,47,51,54,62,63,65,76);
            for ($row = $start_row; $row <= $total_rows; $row++) {
                $cell = $sheet->getCellByColumnAndRow(0, $row);
                $date_val = $cell->getValue();
                if($date_val != null) {
                    $col_index = 0;
                    for ($col = 0; $col < $highestColumnIndex; ++ $col) {
                        if(in_array($col, $need_column_index)) {
                            $cell = $sheet->getCellByColumnAndRow($col, $row);
                            if($col == 0) {
                                $value = $cell->getFormattedValue();
                                $val = date('Y-m-d', strtotime($value));
                            }
                            else
                                $val = $cell->getValue();

                            if($col == 3 && round($val, 5) == 1462.85417 ) {
                                $val = '20.30';
                            }

                            $records[$index][$col_index] = $val;
                            $col_index ++;
                        }
                    }
                    $records[$index][$col_index] = $approved_by;

                    //Check exist old data and update
                    $date = $records[$index][0];
                    
                    $shift = $records[$index][1];
                    $chk_query = "SELECT id FROM {$tblContainerDevan} WHERE `date` = '{$date}' AND `shift` = '{$shift}'";
                    $chk_result = $db->query($chk_query);
                    if(mysqli_num_rows($chk_result) > 0) {
                        $line = mysqli_fetch_object($chk_result);
                        $old_id = $line->id;
                        foreach ($records[$index] as $key => $rowValue) {
                            $records[$index][$key] = $db->real_escape_string($rowValue);
                        }
                        $update_query = "UPDATE {$tblContainerDevan} SET `time` = '{$records[$index][2]}', 
                                            `inbound_renban_air_freight_case_number` = '{$records[$index][3]}',
                                            `shipping_line` = '{$records[$index][4]}',
                                            `container_number` = '{$records[$index][5]}',
                                            `pentalver_instructions` = '{$records[$index][6]}',
                                            `departure_inbound_renban` = '{$records[$index][7]}',
                                            `departure_shipping_line` = '{$records[$index][8]}',
                                            `departure_container_number` = '{$records[$index][9]}',
                                            `on_dock_inbound_renban` = '{$records[$index][10]}',
                                            `on_dock_shipping_line` = '{$records[$index][11]}',
                                            `on_doc_container_number` = '{$records[$index][12]}',
                                            `in_house_instructions` = '{$records[$index][13]}',
                                            `devan_inbound_renban_no_1` = '{$records[$index][14]}',
                                            `devan_shipping_line` = '{$records[$index][15]}',
                                            `in_house_container_number` = '{$records[$index][16]}',
                                            `expected_seal_no` = '{$records[$index][17]}',
                                            `deeside_yard_inbound_renban_no_1` = '{$records[$index][18]}',
                                            `deeside_yard_container_number_no_1` = '{$records[$index][19]}',
                                            `approved_by` = '{$records[$index][20]}' WHERE id = {$old_id}
                                            ";
                        $res = $db->query($update_query);
                    } else {
                        $index ++;
                    }
                }
            }

            //var_dump($records);exit();
            if(count($records) > 2) {
                $fields = "`".implode("`, `", array_shift($records))."`";
                $values = array();
                foreach ($records as $rowValues) {
                    foreach ($rowValues as $key => $rowValue) {
                        $rowValues[$key] = $db->real_escape_string($rowValue);
                    }
                    $values[] = "('" . implode("', '", $rowValues) . "')";
                }

                $query = "INSERT INTO {$tblContainerDevan} ($fields) VALUES " . implode (', ', $values);
                $result = $db->query($query);
            }
            echo 'Success';
        } catch (Exception $e) {
            die('Error loading file "' . pathinfo($file, PATHINFO_BASENAME). '": ' . $e->getMessage());
        }
    }
}
