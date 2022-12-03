<?php
include "config.php";
$registerno = $_POST['registerno'];
$sql = "select registerno from student where registerno = '$registerno'";
$result = array();
$res = $con->query($sql);
if($res->num_rows > 0)
{
    while($row = $res->fetch_assoc())
    {
        $result[] = $row;
    }
    if (($result[0]["registerno"] == $registerno))
    {
        echo json_encode("true");
    }
}
else
{
    echo json_encode("false");
}
?>