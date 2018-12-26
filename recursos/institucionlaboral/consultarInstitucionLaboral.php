<?php

    if ($miConexion->GetCodigoRespuesta() == 503 ){
        $respuesta->preparar(503,"Servicio No disponible BD");
    }else{

        if(!(isset($IdCiudad)) || empty($IdCiudad) ){
            $sql="SELECT    institucionlaboral.Id as 'Id',
                            institucionlaboral.Descripcion as 'Descripcion',
                            ciudades.Id as 'IdCiudad',
                            ciudades.Descripcion as 'NombreCiudad'
                    FROM institucionlaboral 
                        INNER JOIN ciudades
                            ON institucionlaboral.CiudadResidencia_id = ciudades.Id
                        WHERE institucionlaboral.FechaInhabilitacion IS NULL";
        }else {
            $sql="SELECT * FROM institucionlaboral WHERE Ciudad_id = $IdCiudad AND FechaInhabilitacion IS NULL";
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