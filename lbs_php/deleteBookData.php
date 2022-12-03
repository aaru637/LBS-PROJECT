<?php
include "config.php";
$isbnno = $_POST['isbnno'];
$sql = "delete from book where isbnno = '$isbnno'";
$sql1 = "delete from bookstudent where isbnno = '$isbnno'";
$sql2 = "delete from bookstaff where isbnno = '$isbnno'";
if($con->query($sql) || $con->query($sql1) || $con->query($sql2))
{
    echo json_encode("true");
}
else
{
    echo json_encode("false");
}
?>