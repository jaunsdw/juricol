<?php

    if ($miConexion->GetCodigoRespuesta() == 503 ){
        $respuesta->preparar(503,"Servicio No disponible BD");
    }else{
            
         if(!(isset($IdDemanda)) || empty($IdDemanda) ){
            $respuesta->preparar(400, "No se entrego IdDemanda");
            $respuesta->responder();
         }else {
             $sql="SELECT ED.Descripcion as 'NombreEstado',
                            M.FechaMovimiento as 'FechaMovimiento',
                            M.Descripcion as 'Descripcion',
                            M.FechaLimite as 'FechaLimite' 
                        FROM movimientos AS M
                            INNER JOIN estadosdemandas AS ED
                                ON M.EstadosDemandas_id = ED.Id
                        WHERE M.Demandas_id = $IdDemanda
                        ORDER BY FechaMovimiento DESC ";
         }

        $miConexion->EjecutarSQL($sql);
        
        if ($miConexion->GetCodigoRespuesta() == 400){
            $error = $miConexion->GetError();
            $respuesta->preparar(400, "Error al consultar ($sql)".$error);
        }else{
            $resultado = $miConexion->GetResultados();
            $respuesta->preparar(200, $resultado);
 
        }
    }

    $respuesta->responder();

?>          