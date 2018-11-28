<?php
        if ($miConexion->GetCodigoRespuesta() == 503) {  
            $respuesta->preparar(503, "Servicio No disponible BD");
        }
        else{                                 
        
            $SQL = "UPDATE empleados  
                            SET PrimerNombre = '$PrimerNombre',
                                SegundoNombre = '$SegundoNombre',
                                PrimerApellido = '$PrimerApellido',
                                SegundoApellido = '$SegundoApellido',
                                Documento = $Documento,
                                TipoDocumento_id = $IdTipoDocumento,
                                TarjetaProfecional = $TarjetaProfecional,
                                Especialidad = $IdEspecialidad,
                                FechaNacimiento = '$FechaNacimiento',
                                Cargos_id = $IdCargo,
                                Titular = $Titular,
                                Direccion = '$Direccion',
                                Correo = '$Correo',
                                Celular = $Celular,
                                Telefono = $Telefono
                        WHERE Id = $IdEmpleado";
 
            $miConexion->EjecutarSQL($SQL); 

            if ( $miConexion->GetCodigoRespuesta() == 400 ) {   
                $error = $miConexion->GetError();
                $respuesta->preparar(400, "Error al consultar (".$SQL.") ".$error);
                
            }
            else{                                      

                $respuesta->preparar(200,$miConexion->ConsultarModificaciones());
                
            }

        }

    $respuesta->responder();
?>