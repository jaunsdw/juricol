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
                    case 'consultarTiposDocumentos':
                        require_once("tiposDocumentos/consultarTipoDoc.php");
                        break;
                    case 'consultarParentescos':
                        require_once("parentesco/consultarParentescos.php");
                        break;
                    case 'consultarPaises':
                        require_once("paises/consultarPaises.php");
                        break;
                    case 'consultarDepartamentos':
                        require_once("departamentos/consultarDepartamentos.php");
                        break;
                    case 'consultarCiudades':
                        require_once("ciudades/consultarCiudades.php");
                        break;
                    case 'consultarInstitucionesLaborales':
                        require_once("institucionlaboral/consultarInstitucionLaboral.php");
                        break;
                    case 'consultarJuzgados':
                        require_once("juzgados/consultarJuzgados.php");
                        break;
                    case 'consultarTiposProcesos':
                        require_once("tiposprocesos/consultarTiposProcesos.php");
                        break;
                    case 'consultarEstadosDemandas':
                        require_once("estadosdemandas/consultarEstadosDemandas.php");
                        break;
                    case 'consultarMovimientos':
                        require_once("movimientos/consultarMovimientos.php");
                        break;
                    case 'demandasDeEmpleados':
                        require_once("reportes/demandasDeEmpleados.php");
                        break;
                    case 'consultarRoles':
                        require_once("roles/consultarRoles.php");
                        break;
                    default:
                        $respuesta->preparar(404, "Accion no existe");
                        $respuesta->responder();
                        break;
                }

            break;
            case 'POST':
                switch ($accion) {
                    case 'crearCliente':
                        require_once("clientes/crearClientes.php");
                        break;
                    case 'crearCargo':
                        require_once("cargos/crearCargos.php");
                        break;
                    case 'crearEmpleado';
                        require_once("empleados/crearEmpleados.php");
                        break;
                    case 'crearTipoDemanda';
                        require_once("tiposdemandas/crearTipos.php");
                        break;
                    case 'crearEstadoProceso';
                        require_once("estadosprocesos/crearEstados.php");
                        break;
                    case 'pdf';
                        require_once("pdf/convertidor.php");
                        break;
                    case 'crearUsuario';
                        require_once("usuarios/crearUsuario.php");
                        break;
                    case 'crearTipoDocumento':
                        require_once("tiposdocumentos/crearTipoDoc.php");
                        break;
                    case 'crearParentesco':
                        require_once("parentesco/crearParentesco.php");
                        break;
                    case 'crearPais':
                        require_once("paises/crearPais.php");
                        break;
                    case 'crearDepartamento':
                        require_once("departamentos/crearDepartamento.php");
                        break;
                    case 'crearCiudad':
                        require_once("ciudades/crearCiudad.php");
                        break;
                    case 'crearInstitucionLaboral':
                        require_once("institucionlaboral/crearInstitucionLaboral.php");
                        break;
                    case 'crearEspecialidad':
                        require_once("especialidades/crearEspecialidades.php");
                        break;
                    case 'crearJuzgado':
                        require_once("juzgados/crearJuzgado.php");
                        break;
                    case 'crearTipoProceso':
                        require_once("tiposprocesos/crearTipoProceso.php");
                        break;
                    case 'crearEstadoDemanda':
                        require_once("estadosdemandas/crearEstadoDemanda.php");
                        break;
                    case 'crearDemanda':
                        require_once("demandas/crearDemandas.php");
                        break;
                    case 'crearMovimiento':
                        require_once("movimientos/crearMovimiento.php");
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
                    case 'modificarEmpleado':
                        require_once("empleados/modificarEmpleados.php");
                        break;
                    case 'cambioEstadoEmpleado':
                        require_once("empleados/cambioEstado.php");
                        break;
                    case 'modificarCliente':
                        require_once("clientes/actualizarCliente.php");
                        break;
                    case 'modificarTipoDocumento':
                        require_once("tiposdocumentos/modificarTipoDocumento.php");
                        break;
                    case 'modificarParentesco':
                        require_once("parentesco/modificarParentesco.php");
                        break;
                    case 'modificarPais':
                        require_once("paises/modificarPais.php");
                        break;
                    case 'modificarDepartamento':
                        require_once("departamentos/modificarDepartamento.php");
                        break;
                    case 'modificarCiudad':
                        require_once("ciudades/modificarCiudad.php");
                        break;
                    case 'modificarInstitucionLaboral':
                        require_once("institucionlaboral/modificarInstitucionLaboral.php");
                        break;
                    case 'modificarEspecialidad':
                        require_once("especialidades/modificarEspecialidades.php");
                        break;
                    case 'modificarCargo':
                        require_once("cargos/modificarCargos.php");
                        break;
                    case 'modificarTipoDemanda':
                        require_once("tiposdemandas/modificarTipos.php");
                        break;
                    case 'modificarEstadoProceso':
                        require_once("estadosprocesos/modificarEstados.php");
                        break;
                    case 'modificarJuzgado':
                        require_once("juzgados/modificarJuzgado.php");
                        break;
                    case 'modificarTipoProceso':
                        require_once("tiposprocesos/modificarTipoProceso.php");
                        break;
                    case 'modificarEstadoDemanda':
                        require_once("estadosdemandas/modificarEstadoDemanda.php");
                        break;
                    case 'modificarDemanda':
                        require_once("demandas/modificarDemandas.php");
                        break;
                    default:
                        $respuesta->preparar(404, "Accion no existe");
                        $respuesta->responder();
                        break;
                }
            break;
            case 'DELETE':
                switch ($accion) {
                    case 'eliminarCliente':
                        require_once("clientes/cambioEstado.php");
                        break;
                    case 'eliminarEmpleado':
                        require_once("empleados/eliminarEmpleado.php");
                        break;
                    case 'eliminarCargo':
                        require_once("cargos/eliminarCargos.php");
                        break;
                    case 'eliminarCiudad':
                        require_once("ciudades/eliminarCiudades.php");
                        break;
                    case 'eliminarDepartamento':
                        require_once("departamentos/eliminarDepartamentos.php");
                        break;
                    case 'eliminarEspecialidad':
                        require_once("especialidades/eliminarEspecialidad.php");
                        break;
                    case 'eliminarEstadoDemanda':
                        require_once("estadosDemandas/eliminarEstadoDemanda.php");
                        break;
                    case 'eliminarEstadoProceso':
                        require_once("estadosprocesos/eliminarEstadProceso.php");
                        break; 
                    case 'eliminarInstitucionLaboral':
                        require_once("institucionlaboral/eliminarInstitucionLaboral.php");
                        break; 
                    case 'eliminarJuzgados':
                        require_once("juzgados/eliminarJuzgado.php");
                        break; 
                    case 'eliminarPais':
                        require_once("paises/eliminarPais.php");
                        break; 
                    case 'eliminarParentesco':
                        require_once("parentesco/eliminarParentesco.php");
                        break;
                    case 'eliminarTipoDemanda':
                        require_once("tiposdemandas/eliminarTipoDemanda.php");
                        break;
                    case 'eliminarTipoDocumento':
                        require_once("tiposdocumentos/eliminarTipoDocumento.php");
                        break;
                    case 'eliminarTipoProceso':
                        require_once("tiposprocesos/eliminarTipoProceso.php");
                        break;
                    case 'eliminarMovimiento':
                        require_once("movimientos/eliminarMovimientos.php");
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