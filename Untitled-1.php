<?php
include './navbarindex.php';

if (isset($_POST['submit'])) {
    $filename = $_FILES['upfile']['name'];
    $temploc = $_FILES['upfile']['tmp_name'];
    $filetype = $_FILES['upfile']['type'];
    $filesize = $_FILES['upfile']['size'];
    $uploc = "images/". $filename;
    $expensions = array("jpeg", "jpg", "png");

    if ($filesize < 20000000) {
        if ($filetype == 'images/jpeg'){
            if (file_exists($uploc)) {
                echo "file already exists.";
            } else {
                if (mov_uploaded_file($temploc, $uploc)) {
                    $sql = "INSERT INTO images(imgname) VALUES('$filename')";
                    if (mysqli_query($con, $sql)) {
                        echo "inserted.";
                    } else {
                        echo "Not inserted.";
                    }
                    echo "Uploaded.";
                } else {
                    echo "Not Uploaded.";
                }
            }

        }
    } else {
        echo "Size must be less than 200000 byte.";
    }











    #if(in_array($file_ext,$expensions)=== false)
}
?>




<form action="<?php echo $_SERVER['PHP_SELF']; ?>" method="POST" enctype="multipart/form-data">
    <input type="file" name="upfile" /><br><br>
    <input type="submit" name="submit" value="Upload" />
</form>