<?php
    $servername='localhost';
    $username='root';
    $password='';
    $dbname='alm';
    $con=mysqli_connect($servername,$username,$password,$dbname);
    if(!$con){
        echo mysqli_connect_error();
    }
?>