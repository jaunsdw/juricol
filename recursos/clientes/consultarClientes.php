<?php

    if ($miConexion->GetCodigoRespuesta() == 503 ){
        $respuesta->preparar(503,"Servicio No disponible BD");
    }else{
            
         if(!(isset($IdCliente)) || empty($IdCliente) ){
            $sql="SELECT Id as 'IdCliente',
                        PrimerNombre,
                        SegundoNombre,
                        PrimerApellido,
                        SegundoApellido,
                        Documento,
                        Telefono,
                        Celular,
                        Direccion,
                        Correo,
                        FechaNacimiento    
                    FROM clientes
                    WHERE FechaInhabilitacion IS NULL";

         }else {
             $sql="SELECT Id as 'IdCliente',
                            PrimerNombre,
                            SegundoNombre,
                            PrimerApellido,
                            SegundoApellido,
                            Documento,
                            Telefono,
                            Celular,
                            Direccion,
                            Correo,
                            FechaNacimiento    
                        FROM clientes 
                        WHERE Id = $IdCliente AND FechaInhabilitacion IS NULL";
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