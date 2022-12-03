<?php
include "config.php";
$sql = "select * from student";
$result = array();
$res = $con->query($sql);
if($res->num_rows > 0)
{
    while($row = $res->fetch_assoc())
    {
        $result[] = $row;
    }
}
echo json_encode($result);
?>