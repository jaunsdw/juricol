<?php 

require_once '../../vendor/autoload.php';
use Spipu\Html2Pdf\Html2Pdf;

$html2pdf = new Html2Pdf();
$link =  $_SERVER["DOCUMENT_ROOT"]."/juricol/reportes/RdemandasDeEmpleados.php";
$html2pdf->writeHTML( );
$html2pdf->output();


?>

