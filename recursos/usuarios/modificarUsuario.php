<?php

    if ($miConexion->GetCodigoRespuesta() == 503 ){
        $respuesta->preparar(503,"Servicio No disponible BD");
    }else{


        if (!(isset($IdUsuario)) ||  empty($IdUsuario)) {
            $sql="UPDATE usuarios  
                    SET Password = $NuevaClave
                    WHERE Usuario = $NomUsuario"; 
        }else {
            $sql="UPDATE usuarios  
                    SET Password = $NuevaClave
                    WHERE Id = $IdUsuario"; 
        }

        $miConexion->EjecutarSQL($sql);
        
        if ($miConexion->GetCodigoRespuesta() == 400){
            $error = $miConexion->GetError();
            $respuesta->preparar(400, "Error al consultar ($sql)".$error);
        }else{

            $resultado = $miConexion->ConsultarModificaciones();
            $respuesta->preparar(200,"Filas modificadas ".$resultado);
 
        }
    }

    $respuesta->responder();

?>