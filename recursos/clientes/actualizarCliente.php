<?php
        if ($miConexion->GetCodigoRespuesta() == 503) {  
            $respuesta->preparar(503, "Servicio No disponible BD");
        }
        else{     
            
            if (!(isset($IdCliente)) || empty($IdCliente) ) {
                $respuesta->preparar(400, "No se entrego IdCliente");
                $respuesta->responder();
            }else{

                if (empty($Telefono) || (!(isset($Telefono))) || $Telefono == NULL) {
                    $SQL = "UPDATE clientes  
                            SET     PrimerNombre = '$PrimerNombre',
                                    SegundoNombre = '$SegundoNombre',
                                    PrimerApellido = '$PrimerApellido',
                                    SegundoApellido = '$SegundoApellido',
                                    TipoDocumento_id = $IdTipoDocumento,
                                    Documento =  $Documento,
                                    CiudadResidencia_id = $IdCiudad,
                                    InstitucionLaboral_id = $IdInstitucionLaboral,
                                    Telefono = NULL,
                                    Celular = $Celular,
                                    Direccion = '$Direccion',
                                    Correo = '$Correo',
                                    FechaNacimiento = '$FechaNacimiento',
                                    NombreSustituto = '$NombreSustituto',
                                    CelularSustituto = $CelularSustituto,
                                    CorreoSustituto = '$CorreoSustituto',
                                    TipoDocumentoSustituto_id = $IdTipoDocumentoSustituto,
                                    DocumentoSustituto = $DocumentoSustituto,
                                    Parentesco_id = $IdParentesco
                            WHERE Id = $IdCliente";  
                }else {
                    $SQL = "UPDATE clientes  
                            SET     PrimerNombre = '$PrimerNombre',
                                    SegundoNombre = '$SegundoNombre',
                                    PrimerApellido = '$PrimerApellido',
                                    SegundoApellido = '$SegundoApellido',
                                    TipoDocumento_id = $IdTipoDocumento,
                                    Documento =  $Documento,
                                    CiudadResidencia_id = $IdCiudad,
                                    InstitucionLaboral_id = $IdInstitucionLaboral,
                                    Telefono = $Telefono,
                                    Celular = $Celular,
                                    Direccion = '$Direccion',
                                    Correo = '$Correo',
                                    FechaNacimiento = '$FechaNacimiento',
                                    NombreSustituto = '$NombreSustituto',
                                    CelularSustituto = $CelularSustituto,
                                    CorreoSustituto = '$CorreoSustituto',
                                    TipoDocumentoSustituto_id = $IdTipoDocumentoSustituto,
                                    DocumentoSustituto = $DocumentoSustituto,
                                    Parentesco_id = $IdParentesco
                            WHERE Id = $IdCliente";  

                }
                
                  

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