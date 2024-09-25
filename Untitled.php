<?php
include './navbarindex.php';
include './signup.php';


if(isset($_POST["submit"])) {
    // Directory where uploaded images will be saved
    $target_dir = "uploads/";
    // Path to save the uploaded image file
    $target_file = $target_dir . basename($_FILES["image"]["name"]);
    $uploadOk = 1;
    // Get the image file type (jpg, png, etc.)
    $imageFileType = strtolower(pathinfo($target_file, PATHINFO_EXTENSION));

    // Check if the uploaded file is an actual image or fake image
    $check = getimagesize($_FILES["image"]["tmp_name"]);
    if($check !== false) {
        echo "File is an image - " . $check["mime"] . ".<br>";
        $uploadOk = 1;
    } else {
        echo "File is not an image.<br>";
        $uploadOk = 0;
    }

    // Check if the file already exists
    if (file_exists($target_file)) {
        echo "Sorry, file already exists.<br>";
        $uploadOk = 0;
    }

    // Check file size (limit: 5MB)
    if ($_FILES["image"]["size"] > 5000000) {
        echo "Sorry, your file is too large.<br>";
        $uploadOk = 0;
    }

    // Allow certain file formats (JPG, PNG, JPEG, GIF)
    if($imageFileType != "jpg" && $imageFileType != "png" && $imageFileType != "jpeg" && $imageFileType != "gif" ) {
        echo "Sorry, only JPG, JPEG, PNG & GIF files are allowed.<br>";
        $uploadOk = 0;
    }

    // Check if everything is okay before uploading
    if ($uploadOk == 0) {
        echo "Sorry, your file was not uploaded.<br>";
    } else {
        // Attempt to upload the file
        if (move_uploaded_file($_FILES["image"]["tmp_name"], $target_file)) {
            echo "The file ". htmlspecialchars( basename( $_FILES["image"]["name"])). " has been uploaded.";

            // Save image details to MySQL database
            $image_name = basename($_FILES["image"]["name"]);
            $image_path = $target_file;

            // Insert image data into the database
            $sql = "INSERT INTO images (image_name, image_path) VALUES ('$image_name', '$image_path')";
            
            if ($con->query($sql) === TRUE) {
                echo "<br>Image information saved to the database.";
                // Redirect to the display page after successful upload
                header("Location: display_images.php");
                exit();
            } else {
                echo "<br>Error: " . $sql . "<br>" . $con->error;
            }

        } else {
            echo "Sorry, there was an error uploading your file.<br>";
        }
    }
}



?>




<form action="<?php echo $_SERVER['PHP_SELF']; ?>" method="POST" enctype="multipart/form-data">
    <label>Select image to upload:</label>
    <input type="file" name="image" required>
    <input type="submit" name="submit" value="Upload">
  </form>