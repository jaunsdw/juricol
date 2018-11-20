
<?php

    require_once ('../../../vendor/autoload.php');
    $fileName = $_SERVER['DOCUMENT_ROOT']."/juricol/recursos/pdf/ESTADO1.pdf";
    $reader = new \Asika\Pdf2text;
    $datosConvertidos = $reader->decode($fileName);
    $totalDemandas = obtenerDemandas($datosConvertidos);

    print_r($totalDemandas);


    




    function obtenerDemandas($datosConvertidos){
        
        $data = explode("<br />", nl2br($datosConvertidos), -5);
        $i = 0;
        $total = array();
        $parte = array("NumeroRadicado"=>NULL,"Proceso"=>NULL,"Demandante"=>NULL,"Demandado"=>NULL,"NuevoEstado"=>NULL,"FechaCambio"=>NULL);
        $punto = 0;
        $num = count($data);
        while($i < $num){
            while ($punto <= 5) {
                $data[$i] = trim($data[$i]);
                $data[$i] = utf8_encode($data[$i]);

                switch ($punto) {
                    case '0':
                        if( (double)$data[$i]== 0){
                            $punto = 6;
                            $i = $i + 6;
                        }else{
                            $parte['NumeroRadicado'] = $data[$i];
                            $punto++;
                            $i++;
                        }
                        break;
                    case '1':
                        $parte['Proceso'] = $data[$i];
                        $punto++;
                        $i++;
                        break;
                    case '2':
                        $parte['Demandante'] = $data[$i];
                        $punto++;
                        $i++;
                        break;
                    case '3':
                        $parte['Demandado'] = $data[$i];
                        $punto++;
                        $i++;
                        break;
                    case '4':
                        $parte['NuevoEstado'] = $data[$i];
                        $punto++;
                        $i++;
                        break;
                    default:
                        $parte['FechaCambio'] = $data[$i];
                        $punto++;
                        $i++;
                        break;
                }

            }
            if($parte == array("NumeroRadicado"=>NULL,"Proceso"=>NULL,"Demandante"=>NULL,"Demandado"=>NULL,"NuevoEstado"=>NULL,"FechaCambio"=>NULL)){
                $punto = 0;
            }else{
                array_push($total, $parte);
                $parte = array("NumeroRadicado"=>NULL,"Proceso"=>NULL,"Demandante"=>NULL,"Demandado"=>NULL,"NuevoEstado"=>NULL,"FechaCambio"=>NULL);
                $punto = 0;
            }    
        }
        return $total;
    }



?>