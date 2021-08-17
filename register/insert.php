<?php
set_include_path ('.;c:\xampp\htdocs\siteSGBD');
include 'sql.php'; 
if (isset($_POST['submit'])) {
    if (isset($_POST['username']) && isset($_POST['password']) &&
        isset($_POST['gender']) && isset($_POST['email']) &&
        isset($_POST['phoneCode']) && isset($_POST['phone'])) {
        
        $username = $_POST['username'];
        $password = $_POST['password'];
        $gender = $_POST['gender'];
        $email = $_POST['email'];
        $phoneCode = $_POST['phoneCode'];
        $phone = $_POST['phone'];
        $sql = "SELECT * FROM clienti WHERE email = '$email'";
		$result = $conn->query($sql);
        if (!$result) {
			trigger_error('Invalid query: ' . $conn->error);
		}
		if ($result->num_rows == 0) {
            $data = 
				"INSERT INTO clienti(`username`,`password`,`gender`,`email`,`phoneCode`,`phone`) 
				VALUES (\"$username\",\"$password\",\"$gender\",\"$email\",\"$phoneCode\",\"$phone\")";
				if (mysqli_query($conn, $data)) {
					echo "Record updated successfully";
				} else {
					echo "Error updating record: " . mysqli_error($conn);
				}
				header("location: /siteSGBD/index.php");
        }//else echo "deja este un client cu acest email.";
       /* $host = "localhost";
        $dbUsername = "root";
        $dbPassword = "";
        $dbName = "magazin";

        $conn = new mysqli($host, $dbUsername, $dbPassword, $dbName);

        if ($conn->connect_error) {
            die('Could not connect to the database.');
        }
        else {
            $Select = "SELECT email FROM clienti WHERE email = ? LIMIT 1";
            $Insert = "INSERT INTO clienti(username, password, gender, email, phoneCode, phone) values(?, ?, ?, ?, ?, ?)";

            $stmt = $dbName->$conn->prepare($Select);
            $stmt->bind_param("s", $email);
            $stmt->execute();
            $stmt->bind_result($resultEmail);
            $stmt->store_result();
            $stmt->fetch();
            $rnum = $stmt->num_rows;

            if ($rnum == 0) {
                $stmt->close();

                $stmt = $conn->prepare($Insert);
                $stmt->bind_param("ssssii",$username, $password, $gender, $email, $phoneCode, $phone);
                if ($stmt->execute()) {
                    echo "New record inserted sucessfully.";
                }
                else {
                    echo $stmt->error;
                }
            }
            else {
                echo "Someone already registers using this email.";
            }
            $stmt->close();
            $conn->close();
        }*/
    }
    else {
        echo "All field are required.";
        die();
    }
}
else {
    echo "Submit button is not set";
}
?>