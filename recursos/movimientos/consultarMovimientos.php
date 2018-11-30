<?php

    if ($miConexion->GetCodigoRespuesta() == 503 ){
        $respuesta->preparar(503,"Servicio No disponible BD");
    }else{
            
         if(!(isset($IdDemanda)) || empty($IdDemanda) ){
            $respuesta->preparar(400, "No se entrego IdDemanda");
            $respuesta->responder();
         }else {
             $sql="SELECT ";
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