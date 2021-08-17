<?php include 'sql.php'; ?>
<!DOCTYPE html>
<html lang="en">
<head>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.13.0/css/all.min.css">
    <link href="https://fonts.googleapis.com/css2?family=Montserrat&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="style.css">
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>SGBD</title>
</head>
<body>
    
   <?php include 'top.php';
        include 'nav_bar.php';
   ?>
    <div class="sectionRestaurants__container-bot">
    <?php
    $prod_data = "SELECT * FROM produse "; // selectie
    $prod_result = $conn->query($prod_data);
    if (!$prod_result) {
        trigger_error('img_result:Invalid query: ' . $conn->error);
    }
    if ($prod_result->num_rows > 0) {
        while($prod_row = $prod_result->fetch_assoc()) { 
        $prod_id = $prod_row['id'];
        $prod_nume = $prod_row['nume_produs'];
        $prod_pret = $prod_row['pret'];    
        $prod_rating = $prod_row['rating'];
        $prod_img = $prod_row['imagine'];
        $prod_reducere = $prod_row['reducere'];
        ?>
        
            <div class="sectionRestaurants__containerBot">
                <div class="bot__box">
                    <div class="bot__box-image">
                      <?php echo "<img src=\"$prod_img\">";?>
                    </div>
                    <div class="bot__box-title">
                        <?php echo "<a href=\"product.php?pid=$prod_id\">$prod_nume</a>"; ?>
                    </div>
                    <div class="bot__box-stars">
                        <?php for($i = 0; $i < $prod_rating;$i++){echo "<i class=\"fas fa-star\"></i>";}?>
                        <?php for($i = $prod_rating; $i < 5;$i++){echo "<i class=\"far fa-star\"></i>";}?> 
                    </div>
                    <div class="bot__box-price">
                    DIS:<?php echo $prod_reducere;?> %
                    </div>
                    <div class="bot__box-price">
                    <?php echo $prod_pret;?> <i class="fas fa-euro-sign"></i> 
                    </div>
                </div>
            </div>
        
       <?php }//end while
    }//end if ?>
    </div>
        <footer id="footer">
            <div class="inner">
                <center><p class="copyright">&copy; Stama Bogdan Alexandru Ionut.</p></center>
            </div>
        </footer>
      
</body>
</html>