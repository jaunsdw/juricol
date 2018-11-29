
<?php

  //  $fileName = $_SERVER["DOCUMENT_ROOT"]."/juricol/recursos/pdf/ESTADO6.pdf";

   $fileName = $_FILES['MiArchivo']["tmp_name"];
    $reader = new \Asika\Pdf2text;
    $datosConvertidos = $reader->decode($fileName);
    if ($miConexion->GetCodigoRespuesta() == 503 ){
        $respuesta->preparar(503,"Servicio No disponible BD");
        $respuesta->responder();
    }else{
        
        $diasEstados =  consultarEstados($miConexion);

        if(empty($diasEstados) || $diasEstados == NULL){
            $respuesta->preparar(200,"No hay estados registrados");
            $respuesta->responder();
        }else{

            $totalDemandas = obtenerDemandas($datosConvertidos);
            $demandasJuricol = cambiosDeEstado($totalDemandas,$miConexion,$diasEstados);
            

            if( empty($demandasJuricol) || $demandasJuricol == NULL){
                $respuesta->preparar(200,"No hay cambios en demandas");
                $respuesta->responder();
            }else {
                $respuesta->preparar(200,$demandasJuricol);
                $respuesta->responder();
            }
        }
    }

  



    function cambiosDeEstado($demandas,$miConexion,$diasEstados){

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
                $fechaCambio = str_replace('/','-',$demandas[$i]['FechaCambio']);

                $fechaInicio = new DateTime($fechaCambio);

                $result = calcularFechaLimite($fechaInicio->format('Y-m-d'),$demandas[$i]['NuevoEstado'],$miConexion,$diasEstados);

                    $demandasJuricol = array("IdDemanda"=>$juricol[0]['IdDemanda'],
                    "NumDemanda"=>$juricol[0]['NumDemanda'],
                    "Demandante"=>$demandas[$i]['Demandante'],
                    "Demandado"=>$demandas[$i]['Demandado'],
                    "Titular"=>$juricol[0]['Titular'],
                    "IdNuevoEstado"=> $result['IdEstado'],
                    "NuevoEstado"=>$demandas[$i]['NuevoEstado'],
                    "FechaCambio"=>$fechaInicio->format('Y-m-d'),
                    "FechaLimite"=>$result['FechaLimite'],
                    "EstadoProbable"=>$result["EstadoProbable"],
                    "Observacion"=>$result["Error"]);

                    array_push($total,$demandasJuricol);
                    
                    $i++;

            }
        }

        return $total;
        
    }

    function  consultarEstados($miConexion){
        
        $sql="SELECT   
                        Id,
                        Descripcion,
                        DiasLimite 
                    FROM estadosDemandas";

        $miConexion->EjecutarSQL($sql);        

        $resultado = $miConexion->GetResultados();

        if( empty($resultado) || $resultado == NULL){

            return NULL;

        }else {

            return $resultado;    
        }
    }

    function calcularFechaLimite($fechaInicio,$estado,$miConexion,$diasEstados){
        
        $result = array("EstadoProbable"=>NULL,"FechaLimite"=>NULL,"Error"=>NULL,"IdEstado"=>NULL);

        $fechaFin = new DateTime($fechaInicio);

        $num = count($diasEstados);
        $i = 0;

        while ($i < $num) {
            $descripcion = utf8_encode($diasEstados[$i]['Descripcion']);
            similar_text($descripcion, $estado, $porcentaje);
   
            if($porcentaje == 100){
                
                $fechaFin->add(new DateInterval('P'.$diasEstados[$i]['DiasLimite'].'D'));
                $result["FechaLimite"] = $fechaFin->format('Y-m-d');
                $result["IdEstado"] = $diasEstados[$i]['Id'];
                $result["Error"] = "Estado 100% complatible con el almacenamiento";
                $i++;

            }elseif($porcentaje >= 93){
                $fechaFin->add(new DateInterval('P'.$diasEstados[$i]['DiasLimite'].'D'));
                $result = array("EstadoProbable"=>$descripcion,"FechaLimite"=> $fechaFin->format('Y-m-d'),"IdEstado"=>$diasEstados[$i]['Id'],"Error"=>"El estado es $porcentaje % compatible con el almacenamiento");
                $i++;
            }else{
                $i++;
            }

        }

        if( $result["EstadoProbable"] == NULL && $result["FechaLimite"] == NULL){
            $result["Error"] = "Estado no encontrado: ".$estado;
        }

        return $result;   
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