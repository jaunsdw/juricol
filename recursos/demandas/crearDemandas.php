<?php

if ($miConexion->GetCodigoRespuesta() == 503 ){
        $respuesta->preparar(503,"Servicio No disponible BD");
    }else{

        $sql="INSERT INTO demandas (Clientes_id,
                                    NumDemanda,
                                    TiposDemandas_id,
                                    TiposProcesos_id,
                                    Juzgado_id,
                                    Titular_id,
                                    Suplente_id,
                                    Demandado,
                                    Descripcion,
                                    EstadosProcesos_id,
                                    Categoria,
                                    FechaCreacion)
                            VALUES ($IdCliente,
                                    '$NumDemanda',
                                    $IdTipoDemanda,
                                    $IdTipoProceso,
                                    $IdJuzgado,
                                    $IdTitular,
                                    $IdSuplente,
                                    '$Demandado',
                                    '$Descripcion',
                                    $IdEstadoProceso,
                                    $Categoria,
                                    NOW())";

        $miConexion->EjecutarSQL($sql);
        
        if ($miConexion->GetCodigoRespuesta() == 400){
            $error = $miConexion->GetError();
            $respuesta->preparar(400, "Error al consultar ($sql)".$error);
        }else{

            $resultado = $miConexion->ConsultarIdInsertado();
            $respuesta->preparar(200,$resultado);
 
        }
    }

    $respuesta->responder();              

 ?>                               