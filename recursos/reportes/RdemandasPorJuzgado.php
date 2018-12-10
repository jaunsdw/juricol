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
                <h1>Demandas en juzgados</h1>
                <h3 ><?php echo $hoy['weekday']." ".$hoy['mday']." de ".$hoy['month']." del ".$hoy['year'] ;  ?></h3>
            </center>
            <p id="descripcion">En cada sección se observa como titulo el nombre del juzgado al que pertenecen las demandas, 
                    además en la sección inferior encontramos las demandas y su información general</p>
        </header>
        <?php
            $numGeneral = count($datos);
            $iG = 0;
            $iE= 0;

            while ($iG < $numGeneral) {
              echo "<br>";
              echo "<div >
                            <h5 >    
                            <p class='juzgado-info'>".
                              $datos[$iG]['Juzgado']['Nombre'].
                            "</p>". 
                          "</h5>
                          <div>
                              <table>
                                      <thead>
                                        <tr>
                                          <th >#</th>
                                          <th >Radicado</th>
                                          <th >Cliente</th>
                                          <th >Tipo de demanda</th>
                                          <th >Descripción</th>
                                          <th >Estado Actual</th>
                                          <th >Categoria</th>
                                          <th >Tipo de proceso</th>
                                          
                                        </tr>
                                      </thead>
                                      <tbody>";
                                      $numEspecifico = count($datos[$iG]['Demandas']);
                                      while ($iE < $numEspecifico) {
                                          
                                        echo"<tr>".
                                            "<th >".$datos[$iG]['Demandas'][$iE]['IdDemanda']."</th>".
                                            "<td>".$datos[$iG]['Demandas'][$iE]['NumDemanda']."</td>".
                                            "<td>".$datos[$iG]['Demandas'][$iE]['NombreCliente']."</td>".
                                            "<td>".$datos[$iG]['Demandas'][$iE]['NombreTipoDemanda']."</td>".
                                            "<td>".$datos[$iG]['Demandas'][$iE]['DescripcionDemanda']."</td>".
                                            "<td>".$datos[$iG]['Demandas'][$iE]['NombreEstadoProceso']."</td>".
                                            "<td>".$datos[$iG]['Demandas'][$iE]['Categoria']."</td>".
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