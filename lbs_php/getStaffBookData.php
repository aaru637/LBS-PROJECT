<?php
include "config.php";
$registerno = $_POST['registerno'];
$sql = "select staff.registerno, firstname, lastname, email, mobile, department, bookname, isbnno, edition, publishedyear, checkdate, renewdate from staff
  inner join bookstaff on staff.registerno = bookstaff.registerno
   where staff.registerno = '$registerno' order by bookstaff.bookname;";
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
else
{
    echo json_encode('false');
}

?>