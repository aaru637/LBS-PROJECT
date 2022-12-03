<?php
include "config.php";
$firstname = $_POST['firstname'];
$lastname = $_POST['lastname'];
$email = $_POST['email'];
$mobile = $_POST['mobile'];
$aadhar = $_POST['aadharno'];
$registerno = $_POST['registerno'];
$gender = $_POST['gender'];
$department = $_POST['department'];
$dob = $_POST['dob'];
$username = $_POST['username'];
$password = $_POST['password'];
$sql = "insert into staff values('$firstname', '$lastname','$email',
'$mobile','$aadhar', '$registerno', '$gender', '$department', '$dob', '$username', '$password', '3');";
if($con->query($sql))
{
    echo json_encode("true");
}
else
{
    echo json_encode("false");
}
?>

