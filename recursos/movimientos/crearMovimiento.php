<?php

if ($miConexion->GetCodigoRespuesta() == 503 ){
        $respuesta->preparar(503,"Servicio No disponible BD");
    }else{

        if(isset($Movimientos)){
            $i = 0;
           $num = count($Movimientos);
           while($i < $num){

                $IdDemanda = $Movimientos[$i]['IdDemanda'];
                $IdEstadoDemanda = $Movimientos[$i]['IdEstadoDemanda'];
                $FechaMovimiento = $Movimientos[$i]['FechaMovimiento'];
                $Descripcion = $Movimientos[$i]['Descripcion'];
                $FechaLimite = $Movimientos[$i]['FechaLimite'];

                $existencia = verificarExistencia($IdDemanda,$IdEstadoDemanda,$miConexion);

                if ($existencia != "ok") {
                    $i++;
                } else {
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
                    }
                    
                    $i++;
                }
           }
           $respuesta->preparar(200,"Inserciones correctas");
           $respuesta->responder();

        }else {

            $existencia = verificarExistencia($IdDemanda,$IdEstadoDemanda,$miConexion);

            if ($existencia != "ok") {
                
                $respuesta->preparar(403,$existencia);
                $respuesta->responder();  

            } else {

                $existencia = verificarFecha($IdDemanda,$FechaMovimiento,$miConexion);

                if ($existencia != "ok") {
                    $respuesta->preparar(403,$existencia);
                    $respuesta->responder(); 
                } else {
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
        }
    }

    function verificarFecha($IdDemanda,$FechaMovimiento,$miConexion){

        $sql="SELECT * 
            FROM movimientos
            WHERE Demandas_id = $IdDemanda AND FechaMovimiento = $FechaMovimiento ";

        $miConexion->EjecutarSQL($sql);
        $resultado = $miConexion->GetResultados();
        if (empty($resultado)) {
            return "ok";
        } else {
            return "Esta demanda ya tiene un movimiento registrado en esta fecha";
        }
    }

    function verificarExistencia($IdDemanda,$IdEstadoDemanda,$miConexion){

        $sql="SELECT * 
                FROM movimientos
                    WHERE Demandas_id = $IdDemanda AND EstadosDemandas_id = $IdEstadoDemanda ";

        $miConexion->EjecutarSQL($sql);
        $resultado = $miConexion->GetResultados();
        if (empty($resultado)) {
            return "ok";
        } else {
            return "Esta demanda con este movimiento ya existe";
        }
    
    }

             

 ?>                     