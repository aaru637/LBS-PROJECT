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
$sql = "insert into librarian values('$firstname', '$lastname','$email',
'$mobile','$aadhar', '$librarianId', '$gender', '$dob', '$username', '$password');";
if($con->query($sql))
{
    echo json_encode("true");
}
else
{
    echo json_encode("false");
}
?>

