<?php
    require_once("../../servicios/conexionbd.php");  
    require_once("../../servicios/controlrespuesta.php");  // Llamado al servicio "controlrespuesta", quien es el encargado de administrar
    // las respuestas que retornen todos los recursos
    $resultado = NULL;  // Inicio de variable para resultados 
    $miConexion = new ConexionBD; // Instancia de la clase ConeccionBD
    $respuesta = new ControlRespuesta($miConexion); // instancia de la clase ControlRespuesta
    $miConexion->Conectar(); // Metodo que ejecuta la conexion con la base de datos


    if ($miConexion->GetCodigoRespuesta() == 503 ){
        $respuesta->preparar(503,"Servicio No disponible BD");
    }else{
          
       if (!(isset($IdJuzgado)) || empty($IdJuzgado)) {
            $juzgados = obtenerjuzgados(NULL,$miConexion);
       } else {
            $juzgados = obtenerjuzgados($IdJuzgado,$miConexion);
       }
        
    
       $datos = obtenerDemandasPorJuzgados($empleados,$miConexion); 
    }


    function obtenerjuzgados(Type $var = null){
        # code...
    }