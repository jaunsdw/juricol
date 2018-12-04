<?php
        if ($miConexion->GetCodigoRespuesta() == 503) {  
            $respuesta->preparar(503, "Servicio No disponible BD");
        }
        else{              
            
            $estadoActual = verificarEstadoActual($IdCliente,$miConexion);
            $demandas = verificarDemandas($IdCliente,$miConexion);

            if (condition) {

                if ($estadoActual == "Activo") {
                    $nuevoEstado =  "Inactivo";
                } else {
                    $nuevoEstado = "Activo";
                }
                
                $SQL = "UPDATE clientes  
                            SET Estado = '$nuevoEstado'
                            WHERE Id = $IdCliente";
    
                $miConexion->EjecutarSQL($SQL); 

                if ( $miConexion->GetCodigoRespuesta() == 400 ) {   
                    $error = $miConexion->GetError();
                    $respuesta->preparar(400, "Error al consultar (".$SQL.") ".$error);
                    
                }
                else{                                      

                    $respuesta->preparar(200,$miConexion->ConsultarModificaciones());
                    
                }

            } else {
                    $respuesta->preparar(404,"El cliente tiene demandas activas");
            }
            
            


        }

    $respuesta->responder();




    function verificarDemandas($IdCliente,$miConexion){
        
    }


    function verificarEstadoActual($IdCliente,$miConexion){

        $SQL = "SELECT Estado FROM clientes WHERE Id = $IdCliente";
 
        $miConexion->EjecutarSQL($SQL); 

            $resultado = $miConexion->GetResultados();
            $estadoActual = $resultado[0]['Estado'];
            return $estadoActual;
        
    }
?>