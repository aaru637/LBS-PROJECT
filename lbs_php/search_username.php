<?php
include "config.php";
$username = $_POST['username'];
$password = $_POST['password'];
$sql = "select username, password from librarian where username = '$username';";
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
        if(($result[0]["password"]) == $password)
        {
            echo json_encode("true");
        }
        else
        {
            echo json_encode("false");
        }
    }
}
else
{
    echo json_encode("error");
}

?>