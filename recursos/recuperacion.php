<?php
    header("Access-Control-Allow-Origin:*");
    header("Access-Control-Allow-Headers:*");
    header("Access-Control-Allow-Methods:*");

    $post_vars=file_get_contents("php://input"); // Extracción de datos
    $post_vars= json_decode($post_vars,true); // Descodificacion de json 
    extract($post_vars);    // Importa $post_vars desde un array a la tabla de símbolos actual.

    require_once("../servicios/conexionbd.php");  

    require_once("../servicios/controlrespuesta.php");  // Llamado al servicio "controlrespuesta", quien es el encargado de administrar
    // las respuestas que retornen todos los recursos 

    $resultado = NULL;  // Inicio de variable para resultados 
    $miConexion = new ConexionBD; // Instancia de la clase ConeccionBD
    $respuesta = new ControlRespuesta($miConexion); // instancia de la clase ControlRespuesta
    $miConexion->Conectar(); // Metodo que ejecuta la conexion con la base de datos

 
    if(!(isset($Codigo))){
   
        $validar = validarUsuario($Usuario,$miConexion);
        switch ($validar) {
            case '503':
                $respuesta->preparar(503,"Servicio No disponible BD");
                $respuesta->responder();
                break;
            case '400':
                $error = $miConexion->GetError();
                $respuesta->preparar(400, "Error al consultar ($sql)".$error);
                $respuesta->responder();
                break;    
            case 'empty':
                $respuesta->preparar(200, "Usuario no existe");
                $respuesta->responder();
                break;
            default:
                require_once("usuarios/enviarCorreo.php");
                break;
        }

    }elseif($Codigo == 'nuevaClave'){

        require_once("usuarios/modificarUsuario.php");

    }
    else{

        $validar = consultarCodigo($Usuario,$miConexion);


        switch ($validar) {
            case '503':
                $respuesta->preparar(503,"Servicio No disponible BD");
                $respuesta->responder();
                break;
            case '400':
                $error = $miConexion->GetError();
                $respuesta->preparar(400, "Error al consultar ($sql)".$error);
                $respuesta->responder();
                break;    
            case 'empty':
                $respuesta->preparar(200, "No existe codigo registrado");
                $respuesta->responder();
                break;
            case 'NULL':
                $respuesta->preparar(200, "No existe codigo registrado");
                $respuesta->responder();
            default:
                
                if (!($Codigo == $validar)){
                    $respuesta->preparar(200, "El codigo es incorrecto");
                    $respuesta->responder();
                }else {
                    $respuesta->preparar(200, "El codigo es correcto");
                    $respuesta->responder();
                }
                break;
            }

        

    }

    function consultarCodigo($NomUsuario,$miConexion){

        if ($miConexion->GetCodigoRespuesta() == 503 ){
            return "503";
        }else{
            $sql="SELECT  CodigoAsociado 
                    FROM usuarios
                    WHERE Usuario = $NomUsuario";
            
            $miConexion->EjecutarSQL($sql);
            
            if ($miConexion->GetCodigoRespuesta() == 400){
               return "400";
            }else{
                $resultado = $miConexion->GetResultados();
                if(empty($resultado)){
                    return "empty";
                }else{
                    return $resultado;
                }
            }
        } 
    }

    function validarUsuario($NomUsuario,$miConexion){

        if ($miConexion->GetCodigoRespuesta() == 503 ){
            return "503";
        }else{
            $sql="SELECT    U.Id as 'IdUsuario',
                            E.Correo as 'Correo' 
                    FROM usuarios as U
	                    INNER JOIN empleados as E
		                    ON U.Empleados_id = E.Id
                    WHERE Usuario = $NomUsuario";
            
            $miConexion->EjecutarSQL($sql);
            
            if ($miConexion->GetCodigoRespuesta() == 400){
               return "400";
            }else{
                $resultado = $miConexion->GetResultados();
                if(empty($resultado)){
                    return "empty";
                }else{
                    return $resultado;
                }
            }
        }
    }

?>