<?php
include "config.php";
$registerno = $_POST['registerno'];
$sql = "select student.registerno, firstname, lastname, email, mobile, department,
 year, bookname, isbnno, edition, publishedyear, checkdate, renewdate from student
  inner join bookstudent on student.registerno = bookstudent.registerno
   where student.registerno = '$registerno' order by bookstudent.bookname;";
$result = array();
$res = $con->query($sql);
if($res->num_rows > 0)
{
    while($row = $res->fetch_assoc())
    {
        $result[] = $row;
    }
}
echo json_encode($result);
?>