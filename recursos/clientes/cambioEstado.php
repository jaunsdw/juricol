<?php
        if ($miConexion->GetCodigoRespuesta() == 503) {  
            $respuesta->preparar(503, "Servicio No disponible BD");
        }
        else{              
            
            $estadoActual = verificarEstadoActual($IdEmpleado,$miConexion);
            
            if ($estadoActual == "Activo") {
                $nuevoEstado =  "Desactivo";
            } else {
                $nuevoEstado = "Activo";
            }
            
            $SQL = "UPDATE empleados  
                           SET Estados = '$nuevoEstado'
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






    function verificarEstadoActual($IdEmpleado,$miConexion){

        $SQL = "SELECT Estados FROM empleados WHERE Id = $IdEmpleado";
 
        $miConexion->EjecutarSQL($SQL); 

            $resultado = $miConexion->GetResultados();
            $estadoActual = $resultado[0]['Estados'];
            return $estadoActual;
        
    }
?>