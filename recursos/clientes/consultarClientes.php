<?php

    if ($miConexion->GetCodigoRespuesta() == 503 ){
        $respuesta->preparar(503,"Servicio No disponible BD");
    }else{
            
         if(!(isset($IdCliente)) || empty($IdCliente) ){
            $sql="SELECT   C.Id as 'IdCliente',
                            C.PrimerNombre,
                            C.SegundoNombre,
                            C.PrimerApellido,
                            C.SegundoApellido,
                            C.Documento,
                            C.Telefono,
                            C.Celular,
                            C.Direccion,
                            C.Correo,
                            C.FechaNacimiento,
                            ciudades.Descripcion as 'CiudadResidencia'    
                        FROM clientes AS C
                            INNER JOIN ciudades 
                                ON C.CiudadResidencia_id = ciudades.Id
                        WHERE FechaInhabilitacion IS NULL";

         }else {
             $sql="SELECT Id as 'IdCliente',
                            PrimerNombre,
                            SegundoNombre,
                            PrimerApellido,
                            SegundoApellido,
                            TipoDocumento_id AS 'IdTipoDocumento',
                            Documento,
                            Telefono,
                            Celular,
                            Direccion,
                            CiudadResidencia_id AS 'IdCiudad',
                            Correo,
                            InstitucionLaboral_id AS 'IdInstitucionLaboral',
                            NombreSustituto,
                            CorreoSustituto,
                            CelularSustituto,
                            TipoDocumentoSustituto_id AS 'IdTipoDocumentoSusutituto',
                            DocumentoSustituto, 
                            Parentesco_id AS 'IdParentesco',
                            FechaNacimiento   
                        FROM clientes
                        WHERE Id = $IdCliente AND FechaInhabilitacion IS NULL";
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