<?php
include "config.php";
$username = $_POST['user'];
$sql = "select username from student where username = '$username';";
$result = array();
$res = $con->query($sql);
if($res->num_rows > 0)
{
    while($row = $res->fetch_assoc())
    {
        $result[] = $row;
    }
    if (($result[0]["username"] == $username))
    {
        echo json_encode("false");
    }
}
else
{
    echo json_encode("true");
}

?>