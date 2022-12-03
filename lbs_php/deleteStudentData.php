<?php
include "config.php";
$registerno = $_POST['registerno'];
$isbnno = $_POST['isbnno'];
$sql = "delete from student where registerno = '$registerno'";
$sql1 = "delete from bookstudent where registerno = '$registerno'";
$sql2 = "update book set bookcount = bookcount + 1 where isbnno = '$isbnno'";
if($con->query($sql) && $con->query($sql1) && $con->query($sql2))
{
    echo json_encode("true");
}
else
{
    echo json_encode("false");
}
?>