<?php include 'sql.php'; ?>
<!DOCTYPE html>
<html lang="en">
<head>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.13.0/css/all.min.css">
    <link href="https://fonts.googleapis.com/css2?family=Montserrat&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="magazine.css">
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Magazine</title>
</head>
<body>
    <?php include 'top.php';?>
    <table id="customers">
        <tr>
          <th>Numar</th>
          <th>Judet</th>
          <th>Numar locatii</th>
        </tr>
        <?php 
        $judet_data = "SELECT DISTINCT `judet` FROM `magazine` WHERE 1"; // PROIECTIE face ca fiecare nume de judet apare o singura data
        $judet_result = $conn->query($judet_data);
        if (!$judet_result) {
            trigger_error('judet_result:Invalid query: ' . $conn->error);
        }
        if ($judet_result->num_rows > 0) {
            $nr_judete = 1;
            while($judet_row = $judet_result->fetch_assoc()) { 
                $judet_nume = $judet_row['judet'];
                echo "<tr><td>$nr_judete</td>";
                echo "<td>$judet_nume</td>";
                $nr_magazine_data = "SELECT COUNT(oras) AS 'rezultat'  FROM magazine WHERE judet = '$judet_nume'";// numara cate orase au numele $judet_nume
                $nr_magazine_result = $conn->query($nr_magazine_data);
                if (!$nr_magazine_result) {
                    trigger_error('nr_magazine_result:Invalid query: ' . $conn->error);
                }
                $nr_magazine_judet = 0;
                while($judet_row = $nr_magazine_result->fetch_assoc()){
                    $nr_magazine_judet = $judet_row['rezultat'];
                }
                echo "<td>$nr_magazine_judet</td>";
                $nr_judete++;
            }//end while
        }//end if
        
        ?>
      </table>
        
</body>
</html>