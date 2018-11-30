<?php

    if ($miConexion->GetCodigoRespuesta() == 503 ){
        $respuesta->preparar(503,"Servicio No disponible BD");
    }else{


        if (!(isset($IdUsuario)) ||  empty($IdUsuario)) {
            $sql="UPDATE usuarios  
                    SET Password = '$NuevaClave'
                    WHERE Usuario = $NomUsuario"; 


            $resultado = cambiarContraseña($miConexion,$sql);
            $respuesta->preparar($resultado['Codigo'],$resultado['Mensaje']);
            $respuesta->responder();

        }else {

            $autorizacion = verificarContraseña($viejaClave,$miConexion,$IdUsuario);

            if($autorizacion != "ok"){
                $respuesta->preparar($autorizacion['Codigo'],$autorizacion['Mensaje']);
                $respuesta->responder();
            }else {

                $sql="UPDATE usuarios  
                SET Password = '$NuevaClave'
                WHERE Id = $IdUsuario";

                $resultado = cambiarContraseña($miConexion,$sql);
                $respuesta->preparar($resultado['Codigo'],$resultado['Mensaje']);
                $respuesta->responder();

            }

 
        }
    }




    function verificarContraseña($viejaClave,$miConexion,$usuario){

        $sql="SELECT * FROM usuarios WHERE Id = $usuario";
        
        $miConexion->EjecutarSQL($sql);
      

        if ($miConexion->GetCodigoRespuesta() == 400){
            $error = $miConexion->GetError();
            return array("Codigo"=>400,"Mensaje"=>"Error al consultar ($sql)".$error);
        }else{

            $resultado = $miConexion->GetResultados();
            


            if($viejaClave == $resultado[0]['Password']){
                return "ok";
            }else {
                return array("Codigo"=>404,"Mensaje"=>"Password incorrecto");
            }

        }        
        
    }

    function cambiarContraseña($miConexion,$sql){

        $miConexion->EjecutarSQL($sql);

        
        if ($miConexion->GetCodigoRespuesta() == 400){
            $error = $miConexion->GetError();
            return array("Codigo"=>400,"Mensaje"=>"Error al consultar ($sql)".$error);
        }else{

            $resultado = $miConexion->ConsultarModificaciones();
            return array("Codigo"=>200,"Mensaje"=>"Filas modificadas ".$resultado);
        }
    }
        
 
    

?>