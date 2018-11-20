
<?php
    
    $fileName = $_SERVER['DOCUMENT_ROOT']."/juricol/recursos/pdf/ESTADO3.pdf";
    $reader = new \Asika\Pdf2text;
    $datosConvertidos = $reader->decode($fileName);
    $totalDemandas = obtenerDemandas($datosConvertidos);

    $demandasJuricol = cambiosDeEstado($totalDemandas,$miConexion);

    echo json_encode($demandasJuricol);

    
    



    function cambiosDeEstado($demandas,$miConexion){
        $num = count($demandas);
        $i = 0;
        $demandasJuricol = array("IdDemanda"=>NULL,
                                "NumDemanda"=>NULL,
                                "Demandante"=>NULL,
                                "Demandado"=>NULL,
                                "Titular"=>NULL,
                                "NuevoEstado"=>NULL,
                                "FechaCambio"=>NULL,
                                "DiasRestantes"=>NULL);

        $total = array();
        $juricol = NULL;
        while ($i < $num) {

            $juricol = verificarExistencia($demandas[$i]['NumeroRadicado'],$miConexion);

            if($juricol == NULL || empty($juricol) ){

                $i++;
            }else{

                $demandasJuricol = array("IdDemanda"=>$juricol[0]['IdDemanda'],
                                        "NumDemanda"=>$juricol[0]['NumDemanda'],
                                        "Demandante"=>$demandas[$i]['Demandante'],
                                        "Demandado"=>$demandas[$i]['Demandado'],
                                        "Titular"=>$juricol[0]['Titular'],
                                        "NuevoEstado"=>$demandas[$i]['NuevoEstado'],
                                        "FechaCambio"=>$demandas[$i]['FechaCambio'],
                                        "DiasRestantes"=>NULL);

                array_push($total,$demandasJuricol);

                $i++;
            }
        }


        return $total;
        
    }

    function verificarExistencia($NumDemanda,$miConexion){

        $sql="SELECT 
                D.Id AS 'IdDemanda',
                D.NumDemanda AS 'NumDemanda',
                CONCAT(E.PrimerNombre,' ',E.SegundoNombre,' ',E.PrimerApellido,' ',E.SegundoApellido) AS 'Titular'
                FROM demandas AS D 
                    INNER JOIN empleados AS E
                        ON D.Titular_id = E.Id
                WHERE	D.NumDemanda = '$NumDemanda'";

        $miConexion->EjecutarSQL($sql);
                
        $resultado = $miConexion->GetResultados();

        if( empty($resultado) || $resultado == NULL){
            return NULL;
        }else {
            return $resultado;    
        }
        
    }


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