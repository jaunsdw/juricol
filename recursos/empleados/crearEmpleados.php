<?php

if ($miConexion->GetCodigoRespuesta() == 503 ){
        $respuesta->preparar(503,"Servicio No disponible BD");
    }else{
        if (empty($Telefono) || (!(isset($Telefono))) || $Telefono == NULL) {
            $Telefono = " ";
        }
        

        $sql="INSERT INTO empleados ( PrimerNombre,
                                SegundoNombre,
                                PrimerApellido,
                                SegundoApellido,
                                Documento,
                                TipoDocumento_id,
                                TarjetaProfecional,
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
                                $IdTipoDocumento,
                                $TarjetaProfecional,
                                $IdEspecialidad,
                                'Activo',
                                '$FechaNacimiento',
                                $IdCargo,
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