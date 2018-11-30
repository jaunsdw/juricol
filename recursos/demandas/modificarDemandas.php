<?php
        if ($miConexion->GetCodigoRespuesta() == 503) {  
            $respuesta->preparar(503, "Servicio No disponible BD");
        }
        else{     
            
            if (!(isset($IdDemanda)) || empty($IdDemanda) ) {
                $respuesta->preparar(400, "No se entrego IdDemanda");
                $respuesta->responder();
            }else{
        
                $SQL = "UPDATE demandas   

                            SET    Clientes_id = $IdCliente,
                                    NumDemanda = '$NumDemanda',
                                    TiposDemandas_id = $IdTipoDemanda,
                                    TiposProcesos_id = $IdTipoProceso,
                                    Juzgado_id = $IdJuzgado,
                                    Titular_id = $IdTitular,
                                    Suplente_id = $IdSuplente,
                                    Demandado = '$Demandado',
                                    Descripcion = '$Descripcion',
                                    EstadosProcesos_id = $IdEstadoProceso,
                                    Categoria = $Categoria
                            WHERE Id = $IdDemanda";    

                $miConexion->EjecutarSQL($SQL); 

                if ( $miConexion->GetCodigoRespuesta() == 400 ) {   
                    $error = $miConexion->GetError();
                    $respuesta->preparar(400, "Error al consultar (".$SQL.") ".$error);
                    
                }
                else{                                      

                    $respuesta->preparar(200,$miConexion->ConsultarModificaciones());
                    $respuesta->responder();
                }

                }

                
        }

?>