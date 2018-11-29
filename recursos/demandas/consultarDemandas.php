<?php
    if ($miConexion->GetCodigoRespuesta() == 503 ){
        $respuesta->preparar(503,"Servicio No disponible BD");
    }else{
            
        if(!(isset($Filtro)) || empty($Filtro)){
            $sql="SELECT 
                        D.Id AS 'IdDemanda',
                        D.Clientes_id AS 'IdCliente',
                        CONCAT(C.PrimerNombre,' ',C.SegundoNombre,' ',C.PrimerApellido,' ',C.SegundoApellido) as 'NombreCliente',
                        D.NumDemanda AS 'NumDemanda',
                        D.TiposDemandas_id AS 'IdTipoDemanda',
                        TPS.Descripcion AS 'NombreTipoDemanda',
                        D.Titular_id AS 'IdTitular',
                        CONCAT(E1.PrimerNombre,' ',E1.SegundoNombre,' ',E1.PrimerApellido,' ',E1.SegundoApellido) as 'NombreTitular',
                        D.EstadosProcesos_id AS 'IdEstadoProceso',
                        ESP.Descripcion AS 'NombreEstadoProceso',
                        IF(D.Categoria = 1,'Ataque','Defensa') AS 'Categoria',

                        D.FechaCreacion AS 'FechaCreacion'
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
                            ON ESP.Id = D.EstadosProcesos_id";
        }else {

            switch ($Filtro) {
                case 'Demanda':
                    $sql="SELECT 
                                D.Id AS 'IdDemanda',
                                D.Clientes_id AS 'IdCliente',
                                CONCAT(C.PrimerNombre,' ',C.SegundoNombre,' ',C.PrimerApellido,' ',C.SegundoApellido) as 'NombreCliente',
                                D.NumDemanda AS 'NumDemanda',
                                D.TiposDemandas_id AS 'IdTipoDemanda',
                                TPS.Descripcion AS 'NombreTipoDemanda',
                                D.Titular_id AS 'IdTitular',
                                CONCAT(E1.PrimerNombre,' ',E1.SegundoNombre,' ',E1.PrimerApellido,' ',E1.SegundoApellido) as 'NombreTitular',
                                D.Suplente_id AS 'IdSuplente',
                                CONCAT(E2.PrimerNombre,' ',E2.SegundoNombre,' ',E2.PrimerApellido,' ',E2.SegundoApellido) as 'NombreSuplente',
                                D.Descripcion AS 'DescripcionDemanda',
                                D.EstadosProcesos_id AS 'IdEstadoProceso',
                                ESP.Descripcion AS 'NombreEstadoProceso',
                                IF(D.Categoria = 1,'Ataque','Defensa') AS 'Categoria',
                                D.Categoria AS 'IdCategoria',
                                D.FechaCreacion AS 'FechaCreacion'
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
                            WHERE D.Id = $IdDemanda";
                    break;
                
                default:
                    # code...
                    break;
            }
            
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