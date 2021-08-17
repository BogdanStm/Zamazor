<?php
include 'sql.php';
if(isset($_GET['pid'])){
    $product_id = $_GET['pid'];
    //
    $data = "DELETE FROM produse WHERE id=$product_id;";// DELETE stergerea unui produs
        if (mysqli_query($conn, $data)) {
			//echo "Record updated successfully";
		} else {
			//echo "Error updating record: " . mysqli_error($conn);
		}
}
header("location: /siteSGBD/index.php");
?>