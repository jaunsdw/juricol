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
        $error = $miConexion->GetError();
        $EstadoCodigo = array("400"=>"Error al consultar ($sql)".$error);
    }else{

        $resultado = $miConexion->ConsultarModificaciones();
        $EstadoCodigo = array("200"=>"Filas modificadas".$resultado);

    }

    $respuesta->preparar(200, "Correo Enviado".$EstadoCodigo);
    $respuesta->responder();
}else{
    $respuesta->preparar(404, "Problemas en el envio de corrreo");
    $respuesta->responder();
}
 

?>