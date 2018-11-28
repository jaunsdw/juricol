<?php

    if ($miConexion->GetCodigoRespuesta() == 503 ){
        $respuesta->preparar(503,"Servicio No disponible BD");
    }else{
        $estadoDemandaNuevo = utf8_decode($estadoDemandaNuevo);
        $sql="INSERT INTO estadosdemandas (Descripcion,
                                    FechaCreacion,
                                   DiasLimite,
                                   Tipo )
                            VALUES ('$estadoDemandaNuevo',
                                    NOW(),
                                    $DiasLimite,
                                    '$Tipo')";

        $miConexion->EjecutarSQL($sql);
        
        if ($miConexion->GetCodigoRespuesta() == 400){
            $error = $miConexion->GetError();
            $respuesta->preparar(400, "Error al consultar ($sql)".$error);
        }else{

            $resultado = $miConexion->ConsultarIdInsertado();
            $respuesta->preparar(200,"Id insertado ".$resultado);
 
        }
    }

    $respuesta->responder();

?>