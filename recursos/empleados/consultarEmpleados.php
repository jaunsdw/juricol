<?php


    if ($miConexion->GetCodigoRespuesta() == 503 ){
        $respuesta->preparar(503,"Servicio No disponible BD");
    }else{
            
        if(!(isset($IdEmpleado)) || empty($IdEmpleado) ){
            $sql="SELECT 	E.Id as 'IdEmpleado',
                            E.PrimerNombre as 'PrimerNombre',
                            E.SegundoNombre as 'SegundoNombre',
                            E.PrimerApellido as 'PrimerApellido',
                            E.SegundoApellido as 'SegundoApellido',
                            E.TipoDocumento_id as 'IdTipoDocumento',
                            Tdoc.Descripcion as 'TipoDocumento',
                            E.Documento as 'Documento',
                            E.TarjetaProfecional as 'TarjetaProfecional',
                            E.Especialidad as 'IdEspecialidad',
                            Esp.Descripcion as 'Especialidad',
                            E.Cargos_id as 'IdCargo',
                            C.Descripcion as 'NombreCargo',
                            if(E.Titular = 0, 'No','Si') Titular,
                            E.Direccion as 'Direccion',
                            E.Correo as 'CorreoElectronico',
                            E.Telefono as 'Telefono',
                            E.Celular as 'Celular',
                            E.Estados as 'Estado'
                        FROM empleados as E
                            INNER JOIN cargos as C
                                ON E.Cargos_id = C.Id
                            INNER JOIN especialidades as Esp
                                ON E.Especialidad = Esp.Id
                            INNER JOIN tiposdocumentos as Tdoc
                                ON E.TipoDocumento_id = Tdoc.Id
                        WHERE E.FechaInhabilitacion IS NULL";
        }else {
            $sql="SELECT 	E.Id as 'IdEmpleado',
                            E.PrimerNombre as 'PrimerNombre',
                            E.SegundoNombre as 'SegundoNombre',
                            E.PrimerApellido as 'PrimerApellido',
                            E.SegundoApellido as 'SegundoApellido',
                            E.Documento as 'Documento',
                            Esp.Descripcion as 'Especialidad',
                            E.Especialidad as 'IdEspecialidad',
                            E.Cargos_id as 'IdCargo',
                            C.Descripcion as 'NombreCargo',
                            if(E.Titular = 0, 'No','Si') Titular,
                            E.Direccion as 'Direccion',
                            E.Correo as 'CorreoElectronico',
                            E.Telefono as 'Telefono',
                            E.Celular as 'Celular',
                            E.Estados as 'Estado'
                        FROM empleados as E
                            INNER JOIN cargos as C
                                ON E.Cargos_id = C.Id
                            INNER JOIN especialidades as Esp
                                ON E.Especialidad = Esp.Id
                        WHERE E.Id = $IdEmpleado AND E.FechaInhabilitacion IS NULL";
        }


        $miConexion->EjecutarSQL($sql);
        
        if ($miConexion->GetCodigoRespuesta() == 400){
            $error = $miConexion->GetError();
            $respuesta->preparar(400, "Error al consultar ($sql)".$error);
        }else{

            $resultado = $miConexion->GetResultados();
            $respuesta->preparar(200, $resultado);
 
        }
    }

    $respuesta->responder();

?>