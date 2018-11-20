<?php


if ($miConexion->GetCodigoRespuesta() == 503 ){
        $respuesta->preparar(503,"Servicio No disponible BD");
    }else{
        
  
            if(!(isset($Telefono)) || empty($Telefono) || $Telefono == " "){

                    $sql="INSERT INTO clientes (PrimerNombre,
                                        SegundoNombre,
                                        PrimerApellido,
                                        SegundoApellido,
                                        Documento,
                                        Telefono,
                                        Celular,
                                        Direccion,
                                        Correo,
                                        FechaNacimiento,
                                        FechaCreacion,
                                        FechaInhabilitacion)
                            VALUES ('$PrimerNombre',
                                    '$SegundoNombre',
                                    '$PrimerApellido',
                                    '$SegundoApellido',
                                    $Documento,
                                    NULL,
                                    $Celular,
                                    '$Direccion',
                                    '$Correo',
                                    '$FechaNacimiento',
                                    NOW(),
                                    NULL )";
            }else{
                $sql="INSERT INTO clientes (PrimerNombre,
                                    SegundoNombre,
                                    PrimerApellido,
                                    SegundoApellido,
                                    Documento,
                                    Telefono,
                                    Celular,
                                    Direccion,
                                    Correo,
                                    FechaNacimiento,
                                    FechaCreacion,
                                    FechaInhabilitacion)
                        VALUES ('$PrimerNombre',
                                '$SegundoNombre',
                                '$PrimerApellido',
                                '$SegundoApellido',
                                $Documento,
                                $Telefono,
                                $Celular,
                                '$Direccion',
                                '$Correo',
                                '$FechaNacimiento',
                                NOW(),
                                NULL )";
            }
    

        $miConexion->EjecutarSQL($sql);
        
        if ($miConexion->GetCodigoRespuesta() == 400){
            $error = $miConexion->GetError();
            $respuesta->preparar(400, "Error al consultar ($sql)".$error);
        }else{

            $resultado = $miConexion->ConsultarIdInsertado();
            $respuesta->preparar(200,"Numero de cliente ingresado ".$resultado);
 
        }
    }

    $respuesta->responder();              

 ?>     