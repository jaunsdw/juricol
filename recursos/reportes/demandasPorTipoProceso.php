<?php
    require_once("../../servicios/conexionbd.php");  
    require_once("../../servicios/controlrespuesta.php");  // Llamado al servicio "controlrespuesta", quien es el encargado de administrar
    // las respuestas que retornen todos los recursos
    $resultado = NULL;  // Inicio de variable para resultados 
    $miConexion = new ConexionBD; // Instancia de la clase ConeccionBD
    $respuesta = new ControlRespuesta($miConexion); // instancia de la clase ControlRespuesta
    $miConexion->Conectar(); // Metodo que ejecuta la conexion con la base de datos
    require_once  '../../../vendor/autoload.php';
    $mpdf = new \Mpdf\Mpdf();
    if ($miConexion->GetCodigoRespuesta() == 503 ){
        $respuesta->preparar(503,"Servicio No disponible BD");
    }else{
        

       if (!(isset($IdTipoProceso)) || empty($IdTipoProceso)) {
            $tiposProcesos = obtenerTiposProcesos(NULL,$miConexion);
       } else {
            $tiposProcesos = obtenerTiposProcesos($IdTipoProceso,$miConexion);
       }
        
       $datos = obtenerDemandasPorTipoProceso($tiposProcesos,$miConexion); 
       ob_start();
       include "RdemandasPorTipoProceso.php";
       $content  =  ob_get_clean();
       $mpdf->WriteHTML($content);
       $mpdf->Output();
    }



    function obtenerDemandasPorTipoProceso($tiposProcesos,$miConexion){
        $num = count($tiposProcesos);
        $i = 0;
        $datos = array();
        while ($i < $num) {

            $Id = $tiposProcesos[$i]['IdTipoProceso']; 

            $sql = "SELECT 
                            D.Id AS 'IdDemanda',
                            CONCAT(C.PrimerNombre,' ',C.SegundoNombre,' ',C.PrimerApellido,' ',C.SegundoApellido) as 'NombreCliente',
                            D.NumDemanda AS 'NumDemanda',
                            TPS.Descripcion AS 'NombreTipoDemanda',
                            D.Descripcion AS 'DescripcionDemanda',
                            ESP.Descripcion AS 'NombreEstadoProceso',
                            IF(D.Categoria = 1,'Ataque','Defensa') AS 'Categoria',
                            J.Descripcion AS 'NombreJuzgado',
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
                        WHERE D.Tiposprocesos_id = $Id ";

            $miConexion->EjecutarSQL($sql);
            $resultado = $miConexion->GetResultados();
            
            $Temporales = array("TipoDeProceso"=>array(  "IdTipoDeProceso"=>$Id,
                                        "Nombre"=>$tiposProcesos[$i]['NombreTipoProceso']),
                                "Demandas"=>$resultado);

            array_push($datos,$Temporales);
            

            $i++;

        }

        return $datos;
    }


    function obtenerTiposProcesos($IdTipoProceso,$miConexion){

        if ($IdTipoProceso == NULL) {
            $sql = "SELECT 
                        Id as 'IdTipoProceso',
                        Descripcion as 'NombreTipoProceso'
                    FROM tipoprocesos";
        } else {
            $sql = "SELECT 
                        Id as 'IdTipoProceso',
                        Descripcion as 'NombreTipoProceso'
                    FROM tipoprocesos
                        WHERE Id = $IdTipoProceso";
        }

        $miConexion->EjecutarSQL($sql);
        $resultado = $miConexion->GetResultados();

        return $resultado;

        
    }