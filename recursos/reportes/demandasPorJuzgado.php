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
        

       $datos = obtenerDemandasPorJuzgados($juzgados,$miConexion); 

 
    }



    function obtenerDemandasPorJuzgados($juzgados,$miConexion){
        $num = count($juzgados);
        $i = 0;
        $datos = array();
        while ($i < $num) {

            $Id = $juzgados[$i]['IdJuzgado']; 

            $sql = "SELECT 
                            D.Id AS 'IdDemanda',
                            CONCAT(C.PrimerNombre,' ',C.SegundoNombre,' ',C.PrimerApellido,' ',C.SegundoApellido) as 'NombreCliente',
                            D.NumDemanda AS 'NumDemanda',
                            TPS.Descripcion AS 'NombreTipoDemanda',
                            D.Descripcion AS 'DescripcionDemanda',
                            ESP.Descripcion AS 'NombreEstadoProceso',
                            IF(D.Categoria = 1,'Ataque','Defensa') AS 'Categoria',
                            TP.Descripcion AS 'NombreTipoProceso',
                            D.Demandado AS 'NombreDemandado'
                        FROM demandas AS D
                            INNER JOIN clientes as C
                                ON C.Id = D.Clientes_id
                            INNER JOIN tiposdemandas AS TPS
                                ON	TPS.Id = D.TiposDemandas_id
                            INNER JOIN estadosprocesos AS ESP
                                ON ESP.Id = D.EstadosProcesos_id
                            INNER JOIN juzgados AS J
                                ON J.Id = D.Juzgado_id
                            INNER JOIN tipoprocesos AS TP
                                ON TP.Id = D.Tiposprocesos_id
                        WHERE D.Juzgado_id = $Id ";

            $miConexion->EjecutarSQL($sql);
            $resultado = $miConexion->GetResultados();
            
            $Temporales = array("Juzgado"=>array(  "IdJuzgado"=>$Id,
                                        "Nombre"=>$juzgados[$i]['NombreJuzgado']),
                                "Demandas"=>$resultado);

            array_push($datos,$Temporales);
            

            $i++;

        }

        return $datos;
    }


    function obtenerjuzgados($IdJuzgado,$miConexion){

        if ($IdJuzgado == NULL) {
            $sql = "SELECT 
                            Id as 'IdJuzgado',
                            Descripcion as 'NombreJuzgado'
                        FROM juzgados ";
        } else {
            $sql = "SELECT 
                            Id as 'IdJuzgado',
                            Descripcion as 'NombreJuzgado'
                        FROM juzgados 
                        WHERE Id = $IdJuzgado";
        }

        $miConexion->EjecutarSQL($sql);
        $resultado = $miConexion->GetResultados();

        return $resultado;

        
    }