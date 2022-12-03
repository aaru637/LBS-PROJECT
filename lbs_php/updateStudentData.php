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
$year = $_POST['year'];
$dob = $_POST['dob'];
$username = $_POST['username'];
$password = $_POST['password'];
$bookcount = $_POST['bookcount'];
$copyregisterno = $_POST['copyregisterno'];
$sql = "update student set 
firstname = '$firstname',
lastname = '$lastname',
email = '$email',
mobile = '$mobile', 
aadharno = '$aadhar',
registerno = '$registerno',
gender = '$gender',
department = '$department',
year = '$year',
dob = '$dob',
username = '$username',
password = '$password',
bookcount = '$bookcount'  
where registerno = '$copyregisterno';";
if($con->query($sql))
{
    echo json_encode("true");
}
else
{
    echo json_encode("false");
}
?>

