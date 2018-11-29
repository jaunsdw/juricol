<?php
    header("Access-Control-Allow-Origin:*");
    header("Access-Control-Allow-Headers:*");
    header("Access-Control-Allow-Methods: *");

    

    if($_SERVER['REQUEST_METHOD'] == "OPTIONS"){

    }else{
        $accion = NULL;
        $token = apache_request_headers();
         

        if(!(isset($token['Authorization'])) || $token['Authorization'] == NULL || empty($token['Authorization'])){
            $token = NULL;
        }else {
            $token = $token['Authorization'];
        }

        if ($_SERVER['REQUEST_METHOD'] == "POST" || $_SERVER['REQUEST_METHOD'] == "PUT"){    
            $post_vars=file_get_contents("php://input"); // Extracción de datos
            $post_vars= json_decode($post_vars,true); // Descodificacion de json 
            
            if(isset($_GET['accion'])){
                if($_GET['accion'] != "pdf"){
                    $respuesta->preparar(401,'Llamado erroneo de accion por post');
                    $respuesta->responder();
                    exit();
                }
                $accion = validarAccion($_GET['accion']);

            }else{
                @$accion = validarAccion($post_vars["accion"]);
            }

            acceder($accion,$token,$post_vars);
    
        }elseif ($_SERVER['REQUEST_METHOD'] == "GET") {

            @$accion = validarAccion($_GET['accion']);
            @acceder($accion,$token,$_GET);
    
        }elseif ($_SERVER['REQUEST_METHOD'] == "DELETE"){

            header("Access-Control-Allow-Methods: DELETE"); //Admicion para el metodo delete en especifico 

            @$accion = validarAccion($_GET['accion']);
            @acceder($accion,$token,$_GET);
        }else {
            $respuesta->preparar(401,'Llamado por metodo erroneo');
            $respuesta->responder();
        }
    }


    
    function validarAccion($accion){
        if(!(isset($accion)) || $accion == NULL || empty($accion)){
            return array("Codigo"=>404,"Mensaje"=>'Accion vacia o no enviada');
        }elseif(gettype($accion) == "string" ) {
            return $accion;
        }else {
            return array("Codigo"=>401,"Mensaje"=>'Tipo de dato de accion no valido');
        }
        
    }

    function acceder($accion,$token,$info){


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
      
     


        if(gettype($accion) != "array"){

            if($info == NULL || empty($info)){
                $info = NULL;
            }else {
                extract($info);
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
        }else {
            $respuesta->preparar($accion['Codigo'],$accion['Mensaje']);
            $respuesta->responder();
        }

        
    }

    



?>