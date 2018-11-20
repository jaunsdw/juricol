<?php

if ($miConexion->GetCodigoRespuesta() == 503 ){
        $respuesta->preparar(503,"Servicio No disponible BD");
    }else{

        $sql="INSERT INTO empleados ( PrimerNombre,
                                SegundoNombre,
                                PrimerApellido,
                                SegundoApellido,
                                Documento,
                                Especialidad,
                                Estados,
                                FechaNacimiento,
                                Cargos_id,
                                Titular,
                                Direccion,
                                Correo,
                                Celular,
                                Telefono,
                                FechaCreacion,
                                FechaInhabilitacion)
                        VALUES ('$PrimerNombre',
                                '$SegundoNombre',
                                '$PrimerApellido',
                                '$SegundoApellido',
                                $Documento,
                                $Especialidad,
                                'Activo',
                                '$FechaNacimiento',
                                $Cargos_id,
                                $Titular,
                                '$Direccion',
                                '$Correo',
                                $Celular,
                                $Telefono,
                                NOW(),
                                NULL)";

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