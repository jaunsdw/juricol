<?php
        if ($miConexion->GetCodigoRespuesta() == 503) {  
            $respuesta->preparar(503, "Servicio No disponible BD");
        }
        else{     
            
            if (!(isset($IdCliente)) || empty($IdCliente) ) {
                $respuesta->preparar(400, "No se entrego IdCliente");
                $respuesta->responder();
            }else{
        
                $SQL = "UPDATE clientes  
                                SET PrimerNombre = '$PrimerNombre',
                                    SegundoNombre = '$SegundoNombre',
                                    PrimerApellido = '$PrimerApellido',
                                    SegundoApellido = '$SegundoApellido',
                                    Documento = $Documento,
                                    Telefono = $Telefono,
                                    Celular = $Celular,
                                    Direccion = '$Direccion',
                                    FechaNacimiento = '$FechaNacimiento'
                            WHERE Id = $IdCliente";    

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