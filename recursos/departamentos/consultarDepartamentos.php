<?php

    if ($miConexion->GetCodigoRespuesta() == 503 ){
        $respuesta->preparar(503,"Servicio No disponible BD");
    }else{

        if(!(isset($IdPais)) || empty($IdPais) ){
            if (!(isset($IdDepartamento)) || empty($IdDepartamento) ) {
                $sql="SELECT * FROM departamentos ";
            } else {
                $sql="SELECT * FROM departamentos WHERE Id = $IdDepartamento ";
            }
        }else {
            $sql="SELECT * FROM departamentos WHERE Paises_id = $IdPais";
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