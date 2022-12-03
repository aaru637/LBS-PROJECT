<?php
include "config.php";
$registerno = $_POST['registerno'];
$isbnno = $_POST['isbnno'];
$sql = "update bookstaff set renewdate = DATE_ADD(renewdate, INTERVAL 30 DAY) 
where registerno = '$registerno' and isbnno = '$isbnno'";
if($con->query($sql))
{
    echo json_encode('true');
}
else
{
    echo json_encode('false');
}
?>

