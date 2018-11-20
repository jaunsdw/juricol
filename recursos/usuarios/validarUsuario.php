<?php

    /* Este recurso se encarga de verificar la existencia del usuario enviado, si el usuario existe verificara ademas la contraseña enviada 
       Esto con el fin de darle acceso al sistema al usuario que tenga la informacion correcta */



    if ($miConexion->GetCodigoRespuesta() == 503 ){    // Verificacion del servicio de la base de datos 
        $respuesta->preparar(503,"Servicio No disponible BD");
    }else{

        $sql="SELECT * FROM usuarios WHERE Usuario = $usuario"; // Consulta a realizar 

        $miConexion->EjecutarSQL($sql); // Metodo que realiza la consulta a la base de datos  
        
        if ($miConexion->GetCodigoRespuesta() == 400){  // Verificacion de errores en la consulta
            $error = $miConexion->GetError(); // Obtencion del error transmitido por la base de datos
            $respuesta->preparar(400, "Error al consultar ($sql)".$error); /* Metodo que recibe un codigo de HTTP con unos resultados
                                                                            para contruir una cabecera u luego ser retornada a quien llamo al recurso */
        }else{

            $resultado = $miConexion->GetResultados();  // Obtencion de resultados de la consulta 

            if(empty($resultado)){  // Verificacion de existencia del usuario
                $respuesta->preparar(404,"El usuario no existe");

            }elseif(!($resultado["0"]["Password"] == $password)){  // Verificacion de contraseña del usuario 
                $respuesta->preparar(404,"contaseña error"); 
                }else{
                    $respuesta->preparar(200,"Acceso correcto");
                    $datos = array('usuario' => $usuario);
                    $miToken->prepararToken($datos);
                }   
        }
    }
   // $miToken->entregar();
    $respuesta->responderToken($miToken->entregar()); // Metodo que retorna la respuesta con cabcera y resultados

?>