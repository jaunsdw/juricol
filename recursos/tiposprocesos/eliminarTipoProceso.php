<?php
        if ($miConexion->GetCodigoRespuesta() == 503) {  
            $respuesta->preparar(503, "Servicio No disponible BD");
        }
        else{                                 
        
            
            $SQL = "CALL integridad('TiposProcesos_id',$IdTipoProceso)";    
                
            $miConexion->EjecutarSQL($SQL); 

            if ( $miConexion->GetCodigoRespuesta() == 400 ) {   
                $error = $miConexion->GetError();
                $respuesta->preparar(400, "Error al consultar (".$SQL.") ".$error);
             
            }
            else{   
                                                   
                $result = $miConexion->GetResultados(); 

                if( $result[0] != 0  ){
                    $respuesta->preparar(400,"No se puede eliminar debido a que este regristro se encuentra en uso");
                }else {

                    $SQL = "DELETE FROM tipoprocesos  WHERE Id = $IdTipoProceso";     
                    
                    $miConexion->EjecutarSQL($SQL); 
    
                    if ( $miConexion->GetCodigoRespuesta() == 400 ) {   
                        $error = $miConexion->GetError();
                        $respuesta->preparar(400, "Error al consultar (".$SQL.") ".$error);
                
                    }
                    else{                                      
    
                        $respuesta->preparar(200,$miConexion->ConsultarModificaciones());
                      
                    }
                } 
            }
        }

    $respuesta->responder();
?>