<?php include 'sql.php';
if(isset($_GET['pid'])){
    $product_id = $_GET['pid'];
    //img_prod   |    nume_prod
    if(isset($_POST['prod_descriere']) && isset($_POST['img_prod']) && isset($_POST['nume_prod']))
    {
        $desc = $_POST['prod_descriere'];
        $img = $_POST['img_prod'];
        $nume = $_POST['nume_prod'];
        echo "<h1>$desc</h1>";
        $data = "UPDATE produse SET nume_produs = '$nume', imagine = '$img', descriere = '$desc'  WHERE id = '$product_id';";
        if (mysqli_query($conn, $data)) {
			//echo "Record updated successfully";
		} else {
			//echo "Error updating record: " . mysqli_error($conn);
		}
        header("location: edit.php?pid=$product_id");

    }//else echo "!!!Am esuat";
}
else $product_id = 0;
?>
<!DOCTYPE html>
<html lang="en">
<head>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.13.0/css/all.min.css">
    <link href="https://fonts.googleapis.com/css2?family=Montserrat&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="product.css">
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>SGBD</title>
</head>
<body>
    
   <?php include 'top.php';
        
   ?> 

    <div class="sectionRestaurants__container-bot">
        <div class="sectionRestaurants__containerBot">
            <h1>EDIT</h1>
        <?php
            $prod_data = "SELECT * FROM produse WHERE id = '$product_id'";
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
                $prod_descriere = $prod_row['descriere'];
                ?>
                
                    <div class="sectionRestaurants__containerBot">
                        <div class="bot__box">
                            <form id = "edit_form"action="edit.php?pid=<?php echo $prod_id?>" method="POST">
                                <div class="bot__box-image">
                                    <?php echo "<img src=\"$prod_img\">";?>
                                </div>
                                <div class="bot__box-title">
                                    <input id="img_prod" name = "img_prod" value ="<?php echo $prod_img;?>" require>
                                </div>
                                <div class="bot__box-title">
                                    <input id="nume_prod" name = "nume_prod" value ="<?php echo $prod_nume;?>" require>
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
                                <div class="bot__box-desc">
                                <center><textarea rows="5" id = "prod_descriere" name = "prod_descriere" form = "edit_form" require><?php echo $prod_descriere;?></textarea></center>
                                    
                                </div>
                                <center><button>Aplica</button></center>
                            </form>
                            <a href="delete.php?pid=<?php echo $prod_id?>">Sterge produs</a>
                        </div>
                    </div>
                
            <?php }//end while
            }//end if ?>
        </div>
    </div>    
</body>
</html>