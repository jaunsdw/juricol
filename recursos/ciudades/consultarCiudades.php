<?php

    if ($miConexion->GetCodigoRespuesta() == 503 ){
        $respuesta->preparar(503,"Servicio No disponible BD");
    }else{

        if(!(isset($IdDepartamento)) || empty($IdDepartamento) ){
            if (!(isset($IdCiudad)) || empty($IdCiudad)) {
                $sql="SELECT * FROM ciudades WHERE FechaInhabilitacion IS NULL ";
            }else {
                $sql="SELECT * FROM ciudades WHERE Id = $IdCiudad  AND FechaInhabilitacion IS NULL";
            }
            
        }else {
            $sql="SELECT * FROM ciudades WHERE Departamentos_id = $IdDepartamento AND FechaInhabilitacion IS NULL";
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