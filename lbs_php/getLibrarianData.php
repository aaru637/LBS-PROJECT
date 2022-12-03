<?php
include "config.php";
$username = $_POST['username'];
$password = $_POST['password'];
$sql = "select * from librarian where username = '$username' and password = '$password'";
$result = array();
$res = $con->query($sql);
if($res->num_rows > 0)
{
    while($row = $res->fetch_assoc())
    {
        $result[] = $row;
    }
    echo json_encode($result);
}
else{
    echo json_encode("false");
}

?>