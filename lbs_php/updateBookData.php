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
$copyisbnno = $_POST['copyisbnno'];
$sql = "update book set booktitle = '$booktitle',
authorname = '$authorname',
email = '$email',
phoneno = '$phoneno',
edition = '$edition',
publishedyear = '$publishedyear',
isbnno = '$isbnno',
publication = '$publication',
count = '$count'
 where isbnno = '$copyisbnno';
";
if($con->query($sql))
{
    echo json_encode("true");
}
else
{
    echo json_encode("false");
}
?>

