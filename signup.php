<?php
include './navbarindex.php';
$nameErr = $passwordErr = $confirmpwdErr = $newpassword = "";
$name = $email = $batch = $department = $password = $confirmpwd = "";
if ($_SERVER["REQUEST_METHOD"] == "POST") {
  #validating name
  $name = test_input($_POST["name"]);
  $checkname = str_replace(" ", "", $name);
  if (!preg_match("/^[a-zA-Z]*$/", $checkname)) {
    $nameErr = "Only letters and white spaces are allowed";
  }
  $password = test_input($_POST["pwd"]);
  #validation password
  $uppercase = preg_match('@[A-z]@', $password);
  $lowercase = preg_match('@[a-z]@', $password);
  $numbers = preg_match('@[0-9]@', $password);
  $specialchars = preg_match('@[^/w]@', $password);
  if (!$uppercase || !$lowercase || !$numbers || !$specialchars || strlen($password) < 8) {
    $passwordErr = "Password should be atleast 8 characters length and should contain lowercase and uppercase alphabets, numbers and special characters";
  }
  $confirmpwd = test_input($_POST["confirmpwd"]);
  if ($password != $confirmpwd) {
    $confirmpwdErr = "Passwords are not matching";
  }
  $email = test_input($_POST["email"]);
  $department = test_input($_POST["dept"]);
  $batch = test_input($_POST["batch"]);
  if (isset($_POST["submit"])) {
    $duplicate = mysqli_query($con, "select * from alumnilogin where email='$email'");
    if (mysqli_num_rows($duplicate) > 0) {
      header("Location: userexists.php");
    } elseif (($nameErr == "") && ($passwordErr == "") && ($confirmpwdErr == "")) {
      $hashpassword = md5($password);
      // echo '$newpassword';
      $sql = "INSERT INTO alumnilogin (id,name,email,department,batch,password) VALUES(NULL,'$name','$email','$department','$batch','$hashpassword')";
      if (mysqli_query($con, $sql)) {
        header("Location: redirectpostsignup.php");
      }
      mysqli_close($con);
    }
  }
}

function test_input($data)
{
  $data = trim($data);
  $data = stripslashes($data);
  $data = htmlspecialchars($data);
  return $data;
}









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
<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="UTF-8" />
  <meta http-equiv="X-UA-Compatible" content="IE=edge" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0" />
  <title>ALUMNI REGISTRATION</title>
  <link rel="stylesheet" type="text/css" href="./assets/css/stylehome.css">
</head>

<body>
  <div class="main">
    <div class="bg-img">
      <form action="<?php echo htmlspecialchars($_SERVER["PHP_SELF"]) ?>" name="signup" method="post">
        <div class="scontainer">
          <center>
            <h2><u>ALUMNI REGISTRATION</u></h2>
          </center>
          <div class="message">
            <?php
            if ($nameErr != "") {
              echo $nameErr;
            } elseif ($passwordErr != "") {
              echo $passwordErr;
            } elseif ($confirmpwdErr != "") {
              echo $confirmpwdErr;
            }
            ?>
          </div>
          <div class="user-details">
            <div class="input-box">
              <span class="details">Name</span>
              <input type="text" name="name" placeholder="Enter your name" autocomplete="off" required />
            </div>
            <div class="input-box">
              <span class="details">Email</span>
              <input type="email" name="email" placeholder="Enter your email" autocomplete="off" required />
            </div>
            <div class="input-box">
              <span class="details">Department</span>
              <select name="dept" required>
                <option value="" disabled selected>Select your department</option>
                <optgroup label="Department of Architecture">
                  <option value="BArch">Bachelor of Architecture (BArch)</option>
                </optgroup>
                <optgroup label="Department of Civil Engineering">
                  <option value="CE">Bachelor of Science in Civil Engineering (CE)</option>
                </optgroup>
                <optgroup label="Department of Computer Science & Engineering">
                  <option value="CSE">Bachelor of Science in Computer Science and Engineering(CSE)</option>
                </optgroup>
                <optgroup label="Department of Electrical & Electronic Engineering">
                  <option value="EEE">Bachelor of Science in Electrical and Electronic Engineering(EEE)</option>
                  <option value="MSEEE">Master of Science in Electrical and Electronic Engineering(EEE)</option>
                </optgroup>
                <optgroup label="Department of Mechanical and Production Engineering">
                  <option value="IPE">Bachelor of Science in Industrial and Production Engineering(IPE)</option>
                  <option value="ME">Bachelor of Science in Mechanical Engineering(ME)</option>
                  <option value="MSME">Master of Science in Mechanical Engineering(ME)</option>
                </optgroup>
                <optgroup label="Department of Textile Engineering">
                  <option value="TE">Bachelor of Science in Textile Engineering(TE)</option>
                  <option value="MSTE">Master of Science in Textile Engineering(TE)</option>
                </optgroup>
                <optgroup label="School of Business">
                  <option value="BBA">Bachelor of Business Administration(BBA)</option>
                </optgroup>
              </select>
            </div>

            <div class="input-box">
              <span class="details">Batch</span>
              <input type="text" name="batch" placeholder="Enter your Batch" autocomplete="off" required />
            </div>

            <div class="input-box">
              <span class="details">Picture</span>


              <form action="<?php echo $_SERVER['PHP_SELF']; ?>" method="POST" enctype="multipart/form-data">
                <label>Select image to upload:</label>
                <input type="file" name="image" required>
              </form>
            </div>

            <div class="input-box">
              <span class="details">Password</span>
              <input type="password" name="pwd" placeholder="Enter your password" autocomplete="off" required />
            </div>
            <div class="input-box">
              <span class="details">Confirm Password</span>
              <input type="password" name="confirmpwd" placeholder="Renter your password" autocomplete="off" required />
            </div>

            <button type="submit" value="submit" name="submit" class="btn" >Register</button><br /><br />
          </div>
        </div>
      </form>
    </div>
  </div>
</body>

</html>