<?php
require_once 'PHPExcel/PHPExcel.php';
require_once 'config.php';
require_once 'functions.php';

global $db, $tblScanLog, $tblStocking, $tblParts, $tblUsers;

$objPHPExcel = new PHPExcel();
$objPHPExcel->setActiveSheetIndex(0);
$post_data = $_POST;
$export_target = $post_data['page'];
ini_set('memory_limit', '-1');

if($export_target == "stocking_overview") 
{    
    $fileName = $export_target . ".xlsx";
    //Make table headers
    $objPHPExcel->getActiveSheet()
        ->setCellValue('A1', 'Part')
        ->setCellValue('B1', 'Area')
        ->setCellValue('C1', 'Lane')
        ->setCellValue('D1', 'Date In')
        ->setCellValue('E1', 'Member')
        ->setCellValue('F1', 'Amount');

    $query = "SELECT UPPER(t5.part) AS part, t5.area, t5.barcode_in, t5.booked_in_time, t5.username, t6.amount FROM (SELECT t3.part, t3.area, t3.barcode_in, t3.booked_in_time, t4.username FROM (SELECT t1.part, t2.area, t2.barcode_in, t1.booked_in_time, t1.user_id FROM {$tblScanLog} AS t1 INNER JOIN {$tblStocking} AS t2 ON t1.lane_id = t2.id AND t1.`page` = 'Stocking' AND t1.`booked_in` = 1 AND t1.`booked_out` = 0) AS t3 INNER JOIN {$tblUsers} AS t4 ON t3.user_id = t4.ID) AS t5 INNER JOIN {$tblParts} AS t6 ON t5.part = t6.part_no ORDER BY t5.area, t5.part, t5.barcode_in";
    $res = $db->query($query);
    $row = 2;
    while($log = mysqli_fetch_object($res)){        
        $objPHPExcel->getActiveSheet()
            ->setCellValue('A' . $row, $log->part)
            ->setCellValue('B' . $row, $log->area)
            ->setCellValue('C' . $row, $log->barcode_in)
            ->setCellValue('D' . $row, $log->booked_in_time)
            ->setCellValue('E' . $row, $log->username)
            ->setCellValue('F' . $row, $log->amount);
        $row ++;

    }
    $objPHPExcel->getActiveSheet()->getColumnDimension('A')->setWidth(22);
    $objPHPExcel->getActiveSheet()->getColumnDimension('B')->setWidth(25);
    $objPHPExcel->getActiveSheet()->getColumnDimension('C')->setWidth(22);
    $objPHPExcel->getActiveSheet()->getColumnDimension('D')->setWidth(25);
    $objPHPExcel->getActiveSheet()->getColumnDimension('E')->setWidth(22);
    $objPHPExcel->getActiveSheet()->getColumnDimension('F')->setWidth(25);

    $objPHPExcel->getActiveSheet()->getStyle('A1:F1')->applyFromArray(
        array(
            'font' => array(
                'bold' => true
            )
        )
    );
}

$objPHPExcel->getActiveSheet()->setTitle($export_target);

header('Content-Type: application/vnd.openxmlformats-officedocument.spreadsheetml.sheet');
header('Content-Disposition: attachment;filename="'.$fileName.'"');
header('Cache-Control: max-age=0');

$objWriter = PHPExcel_IOFactory::createWriter($objPHPExcel, 'Excel2007');
$objWriter->save('php://output');