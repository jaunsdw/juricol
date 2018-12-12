<?php

  $hoy = getdate();

?>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <link rel="stylesheet" href="reportes.css" />
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Document</title>
</head>
<body>

    <div id="contenedor">
        <header>
            <center>
                <h1>Demandas entre <?php echo " ".$FechaInicial." y ".$FechaFinal;  ?></h1>
                <h3 ><?php echo $hoy['weekday']." ".$hoy['mday']." de ".$hoy['month']." del ".$hoy['year'] ;  ?></h3>
            </center>
            <p id="descripcion">En la siguiente tabla encontramos las demandas que tienen movimientos entre el rango de fechas ingresadas</p>
        </header>
        <?php
              echo "<br>";
              echo "<div >
                          <div>
                              <table>
                                      <thead>
                                        <tr>
                                          <th >#</th>
                                          <th >Radicado</th>
                                          <th >Cliente</th>
                                          <th >Tipo de demanda</th>
                                          <th >Tipo de proceso</th>
                                          <th >Titular</th>
                                          <th >Juzgado</th>
                                          <th >Ultimo Movimiento</th>
                                          <th >Numero total de movimientos</th>          
                                        </tr>
                                      </thead>
                                      <tbody>";
                                      $iE = 0;
                                      $numEspecifico = count($datos);
                                      while ($iE < $numEspecifico) {
                                          
                                        echo"<tr>".
                                            "<th >".$datos[$iE]['IdDemanda']."</th>".
                                            "<td>".$datos[$iE]['NumDemanda']."</td>".
                                            "<td>".$datos[$iE]['NombreCliente']."</td>".
                                            "<td>".$datos[$iE]['NombreTipoDemanda']."</td>".
                                            "<td>".$datos[$iE]['NombreTipoProceso']."</td>".
                                            "<td>".$datos[$iE]['NombreTitular']."</td>".
                                            "<td>".$datos[$iE]['NombreJuzgado']."</td>".
                                            "<td>".$datos[$iE]['UltimoMovimiento']."</td>".
                                            "<td>".$datos[$iE]['CantidadDeMovimientos']."</td>".

                                            
                                          "</tr>";
  
                                        $iE++;
                                      }
  
                                    $iE = 0;
                                echo "</tbody>
                              </table>
                          </div>     
                    </div>";
              echo "<br>";
        ?>
        </div>
    </div>
</body>
</html>