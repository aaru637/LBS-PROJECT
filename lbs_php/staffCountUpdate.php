<?php
include "config.php";
$registerno = $_POST['registerno'];
$sql = "select bookCount from staff where registerno = '$registerno'";

$result = array();
$res = $con->query($sql);
if($res->num_rows > 0)
{
    while($row = $res->fetch_assoc())
    {
        $result[] = $row;
    }
    $count = $result[0]['bookCount'];
    if($count > 0)
    {
        $count -= 1;
        $sql1 = "update staff set bookCount = '$count' 
    where registerno = '$registerno';";

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
else
{
    echo json_encode('No Staff Found');
}
?>

