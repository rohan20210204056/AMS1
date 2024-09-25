<?php
include './navbarindex.php';

// Fetch image details from the database
$sql = "SELECT image_name, image_path FROM images";
$result = $con->query($sql);
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Uploaded Images</title>
</head>
<body>

    <h2>Uploaded Images</h2>

    <?php
    if ($result->num_rows > 0) {
        // Output data for each image
        while($row = $result->fetch_assoc()) {
            echo "<div>";
            echo "<img src='" . $row["image_path"] . "' alt='" . $row["image_name"] . "' style='max-width: 300px; height: auto;'><br>";
            echo "<p>Image Name: " . $row["image_name"] . "</p>";
            echo "</div><br>";
        }
    } else {
        echo "No images found.";
    }
    ?>

</body>
</html>
