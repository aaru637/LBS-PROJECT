<?php
include "config.php";
$registerno = $_POST['registerno'];
$sql = "delete from staff where registerno = '$registerno'";
$sql1 = "delete from bookstaff where registerno = '$registerno'";
if($con->query($sql) || $con->query($sql1))
{
    echo json_encode("true");
}
else
{
    echo json_encode("false");
}
?>