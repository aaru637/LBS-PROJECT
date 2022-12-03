<?php
include "config.php";
$booktitle = $_POST['booktitle'];
$authorname = $_POST['authorname'];
$email = $_POST['email'];
$phoneno = $_POST['phoneno'];
$edition = $_POST['edition'];
$publishedyear = $_POST['publishedyear'];
$isbnno = $_POST['isbnno'];
$publication = $_POST['publication'];
$count = $_POST['count'];
$sql = "insert into book values('$booktitle', '$authorname', '$email',
'$phoneno', '$edition', '$publishedyear', '$isbnno', '$publication', '$count');";
if($con->query($sql))
{
    echo json_encode("true");
}
else
{
    echo json_encode("false");
}
?>

