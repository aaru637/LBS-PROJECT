<?php
include "config.php";
$registerno = $_POST['registerno'];
$booktitle = $_POST['booktitle'];
$edition = $_POST['edition'];
$publishedyear = $_POST['publishedyear'];
$isbnno = $_POST['isbnno'];
$sql = "insert into bookstudent (registerno,
bookname,
isbnno,
edition,
publishedyear,
checkdate,
renewdate) 
values('$registerno', '$booktitle', '$isbnno', '$edition', '$publishedyear', curdate(), DATE_ADD(curdate() , INTERVAL 30 DAY));";
if($con->query($sql))
{
    echo json_encode('true');
}
else
{
    echo json_encode('false');
}
?>

