<?php
        if ($miConexion->GetCodigoRespuesta() == 503) {  
            $respuesta->preparar(503, "Servicio No disponible BD");
        }
        else{                                 
        
            $SQL = "UPDATE cargos  
                            SET Descripcion = '$cargoNuevo'
                        WHERE Id = $IdCargo ";    
            
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