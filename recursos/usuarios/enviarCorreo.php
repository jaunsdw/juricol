<?php

$Codigo = substr(str_shuffle("0123456789"), 0, 4);
ini_set( 'display_errors', 1 );
$asunto = "Codigo de Recuperacion de cuenta Juricol";
$mensaje = $Codigo;
$correoR = $validar["Correo"];
$IdUsuario = $validar["IdUsuario"];

if(mail($correoR,$asunto,$mensaje)){
    $sql="UPDATE usuarios  
            SET CodigoAsociado = $Codigo
            WHERE Id = $IdUsuario "; 

    $miConexion->EjecutarSQL($sql);

    if ($miConexion->GetCodigoRespuesta() == 400){
        $mensaje = "Error al consultar ($sql)=> ".$miConexion->GetError();
        $EstadoCodigo = 400;
    }else{
        if( $miConexion->ConsultarModificaciones() <= 0 ){
            $mensaje = "No se actualizo el usuario";
            $EstadoCodigo = 400;      
        }
        else{
            $mensaje = "Codigo creado satisfactorio";
            $EstadoCodigo = 200;      
        }
    }

    $respuesta->preparar($EstadoCodigo, "Correo Enviado (".$mensaje.")");
    $respuesta->responder();
}else{
    $respuesta->preparar(404, "Problemas en el envio de corrreo");
    $respuesta->responder();
}
 

?>