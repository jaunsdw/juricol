<?php
  include "demandasDeEmpleados.php";
  $hoy = getdate();

  
?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <link rel="stylesheet" href="reportes.css" />
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js" integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy" crossorigin="anonymous"></script>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Document</title>
</head>
<body>

    <div id="contenedor">
        <header>
            <center>
                <h1>Demandas asignadas a abogados</h1>
                <h3 ><?php echo $hoy['weekday']." ".$hoy['wday']." de ".$hoy['month']." del ".$hoy['year'] ;  ?></h3>
            </center>
            <p id="descripcion">En cada sección se observa como titulo el nombre del empleado asignado a las demandas y su información de contacto, 
                    además en la sección inferior a el mismo encontramos las demandas y su información general</p>
        </header>
        <?php
            $numGeneral = count($datos);
            $iG = 0;
            $iE= 0;

            while ($iG < $numGeneral) {
              echo "<br>";
              echo "<div class='card'>
                          <h5 class='card-header'>
                            <p class='abogado-info'>".
                              $datos[$iG]['Empleado']['Nombre'].
                              "<br>".
                              $datos[$iG]['Empleado']['Rango'].
                            "</p>". 
                            "<p class='abogado-contacto'>".
                              $datos[$iG]['Empleado']['Celular'].
                              "<br>".
                              $datos[$iG]['Empleado']['Correo'].
                            "</p>". 
                          "</h5>
                          <div class='card-body'>
                              <table class='table'>
                                      <thead>
                                        <tr>
                                          <th scope='col'>#</th>
                                          <th scope='col'>Radicado</th>
                                          <th scope='col'>Cliente</th>
                                          <th scope='col'>Tipo de demanda</th>
                                          <th scope='col'>Descripción</th>
                                          <th scope='col'>Estado Actual</th>
                                          <th scope='col'>Categoria</th>
                                          <th scope='col'>Juzgado</th>
                                          <th scope='col'>Tipo de proceso</th>
                                          
                                        </tr>
                                      </thead>
                                      <tbody>";
                                      $numEspecifico = count($datos[$iG]['Demandas']);
                                      while ($iE < $numEspecifico) {
                                          
                                        echo"<tr>".
                                            "<th scope='row'>".$datos[$iG]['Demandas'][$iE]['IdDemanda']."</th>".
                                            "<td>".$datos[$iG]['Demandas'][$iE]['NumDemanda']."</td>".
                                            "<td>".$datos[$iG]['Demandas'][$iE]['NombreCliente']."</td>".
                                            "<td>".$datos[$iG]['Demandas'][$iE]['NombreTipoDemanda']."</td>".
                                            "<td>".$datos[$iG]['Demandas'][$iE]['DescripcionDemanda']."</td>".
                                            "<td>".$datos[$iG]['Demandas'][$iE]['NombreEstadoProceso']."</td>".
                                            "<td>".$datos[$iG]['Demandas'][$iE]['Categoria']."</td>".
                                            "<td>".$datos[$iG]['Demandas'][$iE]['NombreJuzgado']."</td>".
                                            "<td>".$datos[$iG]['Demandas'][$iE]['NombreTipoProceso']."</td>".
                                            
                                          "</tr>";
  
                                        $iE++;
                                      }
  
                                    $iE = 0;
                                echo "</tbody>
                              </table>
                          </div>     
                    </div>";
              echo "<br>";
              $iG++;
            }
         
        ?>
        </div>
    </div>
</body>
</html>