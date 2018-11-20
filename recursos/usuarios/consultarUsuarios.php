<?php

    if ($miConexion->GetCodigoRespuesta() == 503 ){
        $respuesta->preparar(503,"Servicio No disponible BD");
    }else{
            
        if(!(isset($Usuario)) || empty($Usuario) ){

            $sql="SELECT 	Id as 'IdUsuario',
			                Usuario,
			                FechaCreacion  
                    FROM usuarios";
        }else {
            $sql="SELECT 	Id as 'IdUsuario',
			                Usuario,
			                FechaCreacion  
                    FROM usuarios
                    WHERE Usuario = $Usuario";
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