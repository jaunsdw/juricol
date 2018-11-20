<?php

if ($miConexion->GetCodigoRespuesta() == 503 ){
        $respuesta->preparar(503,"Servicio No disponible BD");
    }else{

        if ( empty($IdEmpleado) || $IdEmpleado == NULL  ||  !(isset($IdEmpleado)) ) {
            $respuesta->preparar(400, "No se entrego datos en IdEmpleado");
        }else{
            $datosEmpleado =  datosEmpleado($IdEmpleado,$miConexion);
            extract($datosEmpleado);
            
            $pass = substr(str_shuffle("0Q1W2H3J4L5D6C7V8E9"), 0, 8); 

          
            $sql="INSERT INTO usuarios (Usuario,
                                        Password,
                                        Empleados_id,
                                        FechaCreacion,
                                        CodigoAsociado)
                                VALUES  ($Documento,
                                        '$pass',
                                        $IdEmpleado,
                                        NOW(),
                                        NULL)";

            $miConexion->EjecutarSQL($sql);
            
            if ($miConexion->GetCodigoRespuesta() == 400){
                $error = $miConexion->GetError();
                $respuesta->preparar(400, "Error al consultar ($sql)".$error);
                $respuesta->responder(); 
            }else{


                $email =  enviarEmail($CorreoElectronico,$pass);
                $respuesta->preparar($email['codigo'],$email['mensaje']);
                $respuesta->responder(); 


                $resultado = $miConexion->ConsultarIdInsertado();
                $respuesta->preparar(200,"Id insertado ".$resultado);
                $respuesta->responder();  
 
            }
        }

    }

           

    function datosEmpleado($Id,$miConexion){
       
        $sql="SELECT 
                        E.Documento as 'Documento',
                        E.Correo as 'CorreoElectronico'
                 FROM empleados as E
                 WHERE E.Id = $Id AND E.FechaInhabilitacion IS NULL ";

        $miConexion->EjecutarSQL($sql);
        
        if ($miConexion->GetCodigoRespuesta() == 400){
            $error = $miConexion->GetError();
            return array("codigo"=>400,"mensaje"=>"Error en consulta de datos del empleado ($sql)".$error);
        }else{
            $resultado = $miConexion->GetResultados();
            $resultado  =  array("Documento"=>$resultado[0]['Documento'],"CorreoElectronico"=>$resultado[0]['CorreoElectronico']);
            return $resultado;
        }
    }

    function enviarEmail($CorreoElectronico,$pass){

        ini_set( 'display_errors', 1 );
        $asunto = "Contraseña de cuenta Juricol ";

        if(mail($CorreoElectronico,$asunto,$pass)){
            return array("codigo"=>200,"mensaje"=> "Correo Enviado");
        }else{
            return array("codigo"=>404,"mensaje"=>"Problemas en el envio de corrreo");
        }
        
    }
 ?>                               