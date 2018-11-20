<?php

        switch ($_SERVER['REQUEST_METHOD']) {    // Validar el tipo de peticion que realizan  
            case 'GET':
                switch ($accion) {  // Verificacion de lo que se desea hacer 
                    case 'consultarEmpleados':
                        require_once("empleados/consultarEmpleados.php"); // Llamado al recurso necesario para realizar la accion solicitada 
                        break;
                    case 'consultarCargos':
                        require_once("cargos/consultarCargos.php");
                        break;
                    case 'consultarEstadosEmpleados':
                        require_once("estadosempleados/consultarEstados.php");
                        break;
                    case 'consultarEspecialidades':
                        require_once("especialidades/consultarEspecialidades.php");
                        break;
                    case 'consultarTiposDemandas':
                        require_once("tiposdemandas/consultarTipos.php");
                        break;
                    case 'consultarEstadosProcesos':
                        require_once("estadosprocesos/consultarEstados.php");
                        break;
                    case 'consultarUsuarios':
                        require_once("usuarios/consultarUsuarios.php");
                        break;
                    case 'consultarClientes':
                        require_once("clientes/consultarClientes.php");
                        break;
                    case 'consultarDemandas':
                        require_once("demandas/consultarDemandas.php");
                        break;
                    default:
                        $respuesta->preparar(404, "Accion no existe");
                        $respuesta->responder();
                        break;
                }

            break;
            case 'POST':
                switch ($accion) {
                    case 'crearClientes':
                        require_once("clientes/crearClientes.php");
                        break;
                    case 'crearCargos':
                        require_once("cargos/crearCargos.php");
                        break;
                    case 'crearEstadosEmpleados':
                        require_once("estadosempleados/crearEstados.php");
                        break;
                    case 'crearEmpleados';
                        require_once("empleados/crearEmpleados.php");
                        break;
                    case 'crearTiposDemandas';
                        require_once("tiposdemandas/crearTipos.php");
                        break;
                    case 'crearEstadosProcesos';
                        require_once("estadosprocesos/crearEstados.php");
                        break;
                    case 'pdf';
                        require_once("pdf/convertidor.php");
                        break;
                    case 'crearUsuario';
                        require_once("usuarios/crearUsuario.php");
                        break;
                    default:
                        $respuesta->preparar(404, "Accion no existe");
                        $respuesta->responder();
                        break;
                }
            break;
            case 'PUT':
                switch ($accion) {
                    case 'cambiarPassword';
                        require_once("usuarios/modificarUsuario.php");
                        break;
                    case 'modificarEmpleados':
                        require_once("empleados/modificarEmpleados.php");
                        break;
                    case 'cambioEstadoEmpleado':
                        require_once("empleados/cambioEstado.php");
                        break;
                    case 'modificarCliente':
                        require_once("clientes/actualizarCliente.php");
                        break;
                    default:
                        $respuesta->preparar(404, "Accion no existe");
                        $respuesta->responder();
                        break;
                }
            break;
            case 'DELETE':
                switch ($accion) {
                    case 'eliminarClientes':
                        require_once("clientes/eliminarCliente.php");
                        break;
                    case 'eliminarEmpleados':
                        require_once("empleados/eliminarEmpleado");
                        break;
                    default:
                        $respuesta->preparar(404, "Accion no existe");
                        $respuesta->responder();
                        break;
                }
            break;
            case 'OPTIONS': 

            
            break;
            default:
            $respuesta->preparar(403, "Llamado Erroneo"); /* Metodo que recibe un codigo de HTTP con unos resultados
                                                            para contruir una cabecera u luego ser retornada a quien llamo al recurso*/
            $respuesta->responder(); // Metodo que retorna la respuesta al ente que lo solicita
                break;
        }  
        




?>