<?php include 'sql.php'; ?>
<!DOCTYPE html>
<html lang="en">
<head>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.13.0/css/all.min.css">
    <link href="https://fonts.googleapis.com/css2?family=Montserrat&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="angajati.css">
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Angajati</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
</head>
<body>
    <?php include 'top.php';?>
    <div class="w3-container">
        
        <ul class="w3-ul w3-card-4">          
            <?php 
                $angajati_data = "SELECT nume FROM angajati UNION SELECT oras FROM magazine;";
                $angajati_result = $conn->query($angajati_data);
                if (!$angajati_result) {
                    trigger_error('angajati_result:Invalid query: ' . $conn->error);
                }
                if ($angajati_result->num_rows > 0) {
                    while($angajati_row = $angajati_result->fetch_assoc()) { 
                        $angajat_nume = $angajati_row['nume'];
                        echo "<div class=\"w3-bar-item\">";
                        echo "<span class=\"w3-large\">$angajat_nume </span><br>";
                    }
                }
            ?>
        </ul>
      </div>
      <footer id="footer">
      <div class="inner">
        <center><p class="copyright">&copy; Stama Bogdan Alexandru Ionut.</p></center>
      </div>
    </footer>
</body>
</html>