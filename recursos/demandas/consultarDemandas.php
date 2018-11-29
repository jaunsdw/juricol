<?php
    if ($miConexion->GetCodigoRespuesta() == 503 ){
        $respuesta->preparar(503,"Servicio No disponible BD");
    }else{
            
        if(!(isset($IdDemanda)) || empty($IdDemanda)){

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
                    D.FechaCreacion AS 'FechaCreacion',
                    (SELECT  ED.Descripcion
                        FROM movimientos AS M
                            INNER JOIN estadosdemandas AS ED
                                ON M.EstadosDemandas_id = ED.Id
                        WHERE FechaMovimiento = (SELECT  max(FechaMovimiento)
                                                                    FROM movimientos 
                                                                    WHERE Demandas_id = D.Id) && M.Demandas_id = D.Id) AS 'UltimoMovimiento',
                    (SELECT  FechaMovimiento
                        FROM movimientos 
                        WHERE FechaMovimiento = (SELECT  max(FechaMovimiento)
                                                                    FROM movimientos 
                                                                    WHERE Demandas_id = D.Id) && Demandas_id = D.Id) AS 'FechaMovimiento',
                    (SELECT  FechaLimite
                        FROM movimientos 
                        WHERE FechaMovimiento = (SELECT  max(FechaMovimiento)
                                                                    FROM movimientos 
                                                                    WHERE Demandas_id = D.Id) && Demandas_id = D.Id) AS 'FechaLimite'
            
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
                                D.Juzgado_id AS 'IdJuzgado',
                                J.Descripcion AS 'NombreJuzgado',
                                D.Tiposprocesos_id AS 'IdTipoProceso',
                                TP.Descripcion AS 'NombreTipoProceso',
                                D.Demandado AS 'NombreDemandado',
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
                                INNER JOIN juzgados AS J
                                    ON J.Id = D.Juzgado_id
                                INNER JOIN tipoprocesos AS TP
                                    ON TP.Id = D.Tiposprocesos_id
                            WHERE D.Id = $IdDemanda";
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