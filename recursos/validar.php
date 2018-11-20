<?php
    header("Access-Control-Allow-Origin:*");
    header("Access-Control-Allow-Headers:*");
    header("Access-Control-Allow-Methods:*");

    
    require_once("../servicios/conexionbd.php");  
    require_once("../servicios/token.php");
    require_once("../servicios/controlrespuesta.php");  // Llamado al servicio "controlrespuesta", quien es el encargado de administrar
    // las respuestas que retornen todos los recursos


    require_once ('../../vendor/autoload.php');

    
    $miToken = new Token;
    $resultado = NULL;  // Inicio de variable para resultados 
    $miConexion = new ConexionBD; // Instancia de la clase ConeccionBD
    $respuesta = new ControlRespuesta($miConexion); // instancia de la clase ControlRespuesta
    $miConexion->Conectar(); // Metodo que ejecuta la conexion con la base de datos

    if ($_SERVER['REQUEST_METHOD'] == "POST" || $_SERVER['REQUEST_METHOD'] == "PUT"){    
        $post_vars=file_get_contents("php://input"); // Extracción de datos
        $post_vars= json_decode($post_vars,true); // Descodificacion de json 

        if(isset($_GET['accion'])){
            $accion = $_GET['accion'];
            $token = apache_request_headers();
            $token = $token['Authorization'];
        }else{
            if(!(isset($post_vars["token"])) ||  $post_vars["token"] == NULL || empty($post_vars["token"])){
                $token = NULL;
            }
            extract($post_vars);    // Importa $post_vars desde un array a la tabla de símbolos actual.
        }

    }elseif ($_SERVER['REQUEST_METHOD'] == "GET") {
        extract($_GET);
    }elseif ($_SERVER['REQUEST_METHOD'] == "DELETE"){
        header("Access-Control-Allow-Methods: DELETE"); //Admicion para el metodo delete en especifico 
        extract($_GET);
    }else{
        
    }

    if( $accion != 'validar'){
        if(!(isset($token)) || $token == NULL || empty($token)){
            $respuesta->preparar(401,'No existe token');
            $respuesta->responder();
        }else{

            $result = $miToken->validar($token);

            if($result != "Token valido"){
                $respuesta->preparar(401,$result);
                $respuesta->responder();
            }else{
                require_once("enrutador.php");
            }

        }
    }else{
        require_once("usuarios/validarUsuario.php");
    }

    

?>