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
                    case 'consultarTipoDocumento':
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
                    case 'consultarInstitucionLaboral':
                        require_once("institucionlaboral/consultarInstitucionLaboral.php");
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
                    case 'crearEspecialidades':
                        require_once("especialidades/crearEspecialidades.php");
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
                    case 'modificarEspecialidades':
                        require_once("especialidades/modificarEspecialidades.php");
                        break;
                    case 'modificarCargos':
                        require_once("cargos/modificarCargos.php");
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