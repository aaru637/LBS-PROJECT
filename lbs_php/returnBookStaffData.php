<?php
include "config.php";
$registerno = $_POST['registerno'];
$isbnno = $_POST['isbnno'];
$sql = "delete from bookstaff where registerno = '$registerno' and isbnno = '$isbnno'";
$sql1 = "update staff set bookcount = bookcount + 1 where registerno = '$registerno'";
$sql2 = "update book set count = count + 1 where isbnno = '$isbnno'";
if($con->query($sql))
{
    if($con->query($sql1))
    {
        if($con->query($sql2))
        {
            echo json_encode('true');
        }
        else
        {
            echo json_encode("false");
        }
    }
    else
    {
        echo json_encode("false");
    }
}
else
{
    echo json_encode('false');
}
?>

