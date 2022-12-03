<?php
include "config.php";
$isbnno = $_POST['isbnno'];
$sql = "select count from book where isbnno = '$isbnno'";

$result = array();
$res = $con->query($sql);
if($res->num_rows > 0)
{
    while($row = $res->fetch_assoc())
    {
        $result[] = $row;
    }
    $count = $result[0]['count'];
    if($count > 0)
    {
        $count -= 1;
        $sql1 = "update book set count = '$count' 
    where isbnno = '$isbnno';";

    if($con->query($sql1))
    {
        echo json_encode("true");
    }
    }
    else
    {
        echo json_encode('count exceeded');
    }

}
?>

