<?php
include "config.php";
$firstname = $_POST['firstname'];
$lastname = $_POST['lastname'];
$email = $_POST['email'];
$mobile = $_POST['mobile'];
$aadhar = $_POST['aadharno'];
$librarianId = $_POST['librarianid'];
$gender = $_POST['gender'];
$dob = $_POST['dob'];
$username = $_POST['username'];
$password = $_POST['password'];
$copylibrarianid = $_POST['copylibrarianid'];
$sql = "update librarian set firstname = '$firstname',
lastname = '$lastname',
email = '$email',
mobile = '$mobile',
aadharno = '$aadhar',
librarianid = '$librarianId',
gender = '$gender',
dob = '$dob',
username = '$username',
password = '$password' 
where librarianid = '$copylibrarianid';";
if($con->query($sql))
{
    echo json_encode("true");
}
else
{
    echo json_encode("false");
}
?>

