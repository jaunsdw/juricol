<?php

if ($miConexion->GetCodigoRespuesta() == 503 ){
        $respuesta->preparar(503,"Servicio No disponible BD");
    }else{

        if(isset($Movimientos)){
            $i = 0;
           $num = count($Movimientos);
            $inserciones = array();
            // echo "<pre>";
            // var_dump($Movimientos);
            // echo "</pre>";
       
           while($i < $num){

                $IdDemanda = $Movimientos[$i]['IdDemanda'];
                $IdEstadoDemanda = $Movimientos[$i]['IdEstadoDemanda'];
                $FechaMovimiento = $Movimientos[$i]['FechaMovimiento'];
                $Descripcion = $Movimientos[$i]['Descripcion'];
                $FechaLimite = $Movimientos[$i]['FechaLimite'];

                $sql="INSERT INTO movimientos ( Demandas_id,
                                                EstadosDemandas_id,
                                                FechaMovimiento,
                                                Descripcion,
                                                FechaLimite)
                                            VALUES ($IdDemanda,
                                                    $IdEstadoDemanda,
                                                    '$FechaMovimiento',
                                                    '$Descripcion',
                                                    '$FechaLimite')";
                                        
                $miConexion->EjecutarSQL($sql);

                if ($miConexion->GetCodigoRespuesta() == 400){
                    $error = $miConexion->GetError();
                    $respuesta->preparar(400, "Error al consultar ($sql)".$error);
                    $respuesta->responder();  
                }else{
                    $resultado = $miConexion->ConsultarIdInsertado();
                    $inserciones[$i] = "Id insertado ".$resultado;
                }

                $i++;
           }

           unset($Movimientos);

           $respuesta->preparar(200,"Inserciones correctas");
           $respuesta->responder();  

        }else {
      
            $sql="INSERT INTO movimientos ( Demandas_id,
                                EstadosDemandas_id,
                                FechaMovimiento,
                                Descripcion,
                                FechaLimite)
                        VALUES ($IdDemanda,
                                $IdEstadoDemanda,
                                '$FechaMovimiento',
                                '$Descripcion',
                                '$FechaLimite')";

            $miConexion->EjecutarSQL($sql);
                    
            if ($miConexion->GetCodigoRespuesta() == 400){
                $error = $miConexion->GetError();
                $respuesta->preparar(400, "Error al consultar ($sql)".$error);
            }else{

                $resultado = $miConexion->ConsultarIdInsertado();
                $respuesta->preparar(200,"Id insertado ".$resultado);

            }

            $respuesta->responder();  
        }
    }

             

 ?>                     