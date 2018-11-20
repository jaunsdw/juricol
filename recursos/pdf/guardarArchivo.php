<?php

//var_dump($_FILES['archivos']);

//echo "aqui";
/*
$fileName = $_SERVER['DOCUMENT_ROOT']."/juricol/recursos/pdf/ESTADO.pdf";

if(move_uploaded_file($fileName, "prueba3/".$fileName)){
    echo "archivo movido";
}else{
    echo "falla al mover";
}
*/



$nombreArchivo = "prueba.txt";

file_put_contents($nombreArchivo, nl2br($output));

//rename($_SERVER['DOCUMENT_ROOT']."/juricol/recursos/prueba.txt", $_SERVER['DOCUMENT_ROOT']."/juricol/recursos/pdf/prueba/prueba.txt");



?>