<?php
     require_once("../../servicios/conexionbd.php");  
     require_once("../../servicios/controlrespuesta.php");   // Llamado al servicio "controlrespuesta", quien es el encargado de administrar
    // las respuestas que retornen todos los recursos
    $resultado = NULL;  // Inicio de variable para resultados 
    $miConexion = new ConexionBD; // Instancia de la clase ConeccionBD
    $respuesta = new ControlRespuesta($miConexion); // instancia de la clase ControlRespuesta
    $miConexion->Conectar(); // Metodo que ejecuta la conexion con la base de datos


    if ($miConexion->GetCodigoRespuesta() == 503 ){
        $respuesta->preparar(503,"Servicio No disponible BD");
    }else{
            
       $empleados = obtenerEmpleados($miConexion);
       $datos = obtenerDemandasDeEmpleados($empleados,$miConexion); 
    }








    function obtenerDemandasDeEmpleados($empleados,$miConexion){
        
        $num = count($empleados);
        $i = 0;
        $datos = array();
        while ($i < $num) {

            $Id = $empleados[$i]['IdEmpleado'];
            $sql="SELECT 
                        D.Id AS 'IdDemanda',
                        CONCAT(C.PrimerNombre,' ',C.SegundoNombre,' ',C.PrimerApellido,' ',C.SegundoApellido) as 'NombreCliente',
                        D.NumDemanda AS 'NumDemanda',
                        TPS.Descripcion AS 'NombreTipoDemanda',
                        D.Descripcion AS 'DescripcionDemanda',
                        ESP.Descripcion AS 'NombreEstadoProceso',
                        IF(D.Categoria = 1,'Ataque','Defensa') AS 'Categoria',
                        J.Descripcion AS 'NombreJuzgado',
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
                                    WHERE D.Titular_id = $Id OR D.Suplente_id = $Id";
            
            $miConexion->EjecutarSQL($sql);
            $resultado = $miConexion->GetResultados();

            $Temporales = array("Empleado"=>array(  "IdEmpleado"=>$Id,
                                                    "Nombre"=>$empleados[$i]["NombreEmpleado"],
                                                    "Rango"=>$empleados[$i]["Rango"],
                                                    "Celular"=>$empleados[$i]["Celular"],
                                                    "Correo"=>$empleados[$i]["Correo"]),
                                "Demandas"=>$resultado);

            array_push($datos,$Temporales);


            $i++;
        }

        return $datos;

    }


    function obtenerEmpleados($miConexion){
        
        $sql= "SELECT 
                    Id as 'IdEmpleado',
                    CONCAT(PrimerNombre,' ',SegundoNombre,' ',PrimerApellido,' ',SegundoApellido) as 'NombreEmpleado',
                    IF(Titular = 1,'Titular','Suplente') as 'Rango',
                    Celular,
                    Correo 
                    FROM empleados";

        $miConexion->EjecutarSQL($sql);
        $resultado = $miConexion->GetResultados();
        
        
        return $resultado;
    }

?>