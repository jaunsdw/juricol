<?php


if ($miConexion->GetCodigoRespuesta() == 503 ){
        $respuesta->preparar(503,"Servicio No disponible BD");
    }else{

        if(!(isset($telefono)) || empty($telefono) ){
            $telefono = NULL;
        }

                    $sql="INSERT INTO clientes (PrimerNombre,
                                                SegundoNombre,
                                                PrimerApellido,
                                                SegundoApellido,
                                                TipoDocumento_id,
                                                Documento,
                                                CiudadResidencia_id,
                                                InstitucionLaboral_id,
                                                Telefono,
                                                Celular,
                                                Direccion,
                                                Correo,
                                                FechaNacimiento,
                                                NombreSustituto,
                                                CelularSustituto,
                                                CorreoSustituto,
                                                TipoDocumentoSustituto_id,
                                                DocumentoSustituto,
                                                Parentesco_id,
                                                FechaCreacion,
                                                FechaInhabilitacion)
                            VALUES ('$PrimerNombre',
                                    '$SegundoNombre',
                                    '$PrimerApellido',
                                    '$SegundoApellido',
                                    $IdTipoDocumento,
                                    $Documento,
                                    $IdCiudad,
                                    $IdInstitucionLaboral,
                                    $telefono,
                                    $Celular,
                                    '$Direccion',
                                    '$Correo',
                                    '$FechaNacimiento',
                                    '$NombreSustituto',
                                    $CelularSustituto,
                                    '$CorreoSustituto',
                                    $IdTipoDocumentoSustituto,
                                    $DocumentoSustituto,
                                    $IdParentesco,
                                    NOW(),
                                    NULL )";
        
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