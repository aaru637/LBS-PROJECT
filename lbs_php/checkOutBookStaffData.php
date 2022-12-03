<?php
include "config.php";
$registerno = $_POST['registerno'];
$booktitle = $_POST['booktitle'];
$edition = $_POST['edition'];
$publishedyear = $_POST['publishedyear'];
$isbnno = $_POST['isbnno'];
$sql = "insert into bookstaff (registerno,
bookname,
isbnno,
edition,
publishedyear,
checkdate,
renewdate) 
values('613520104008', 'sdgfgdf', 'hsfgsdfg', 'hshdsfh', 'dsfdfhdf', curdate(), DATE_ADD(curdate() , INTERVAL 30 DAY));";
if($con->query($sql))
{
    echo json_encode("true");
}
else
{
    echo json_encode("false");
}
?>

