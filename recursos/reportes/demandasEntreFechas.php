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
        extract($_GET);

       $datos = obtenerDemandasEntreFechas($FechaInicial,$FechaFinal,$miConexion);
    
       ob_start();
       include "RdemandasEntreFechas.php";
       $content  =  ob_get_clean();
       $mpdf->WriteHTML($content);
       $mpdf->Output();
    }
    function obtenerDemandasEntreFechas($FechaInicial,$FechaFinal,$miConexion){
           
           $sql = "SELECT DISTINCT
                            D.Id AS 'IdDemanda',
                            CONCAT(C.PrimerNombre,' ',C.SegundoNombre,' ',C.PrimerApellido,' ',C.SegundoApellido) as 'NombreCliente',
                            D.NumDemanda AS 'NumDemanda',
                            TPS.Descripcion AS 'NombreTipoDemanda',
                            CONCAT(E1.PrimerNombre,' ',E1.SegundoNombre,' ',E1.PrimerApellido,' ',E1.SegundoApellido) as 'NombreTitular',
                            ESP.Descripcion AS 'NombreEstadoProceso',
                                        TPP.Descripcion AS 'NombreTipoProceso',
                                        J.Descripcion AS 'NombreJuzgado',
                            (SELECT  ED.Descripcion
                                FROM movimientos AS M
                                    INNER JOIN estadosdemandas AS ED
                                        ON M.EstadosDemandas_id = ED.Id
                                WHERE FechaMovimiento = (SELECT  max(FechaMovimiento)
                                                                            FROM movimientos 
                                                                            WHERE Demandas_id = D.Id) && M.Demandas_id = D.Id) AS 'UltimoMovimiento',
                            (SELECT count(Id)
                                    FROM movimientos 
                                        WHERE Demandas_id = D.Id) AS 'CantidadDeMovimientos'
                        FROM demandas AS D
                            INNER JOIN clientes as C
                                ON C.Id = D.Clientes_id
                            INNER JOIN tiposdemandas AS TPS
                                ON	TPS.Id = D.TiposDemandas_id
                            INNER JOIN empleados as E1 
                                ON E1.Id = D.Titular_id
                            INNER JOIN empleados AS E2
                                ON E2.Id = D.Suplente_id
                            INNER JOIN estadosprocesos AS ESP
                                ON ESP.Id = D.EstadosProcesos_id
                            INNER JOIN tipoprocesos AS TPP
                                ON TPP.Id = D.TiposProcesos_id
                            INNER JOIN juzgados AS J 
                                ON J.Id = D.Juzgado_id
                                INNER JOIN movimientos as Mv
                                    ON Mv.Demandas_id = D.Id
                            WHERE Mv.FechaMovimiento BETWEEN '$FechaInicial' AND '$FechaFinal' 
                        ORDER BY D.Id ASC ";

            $miConexion->EjecutarSQL($sql);
            $resultado = $miConexion->GetResultados();
            
        
        return $resultado;
    }
