<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Database deletion form</title>
</head>
<body>
 
<table width = "500" align="center" border="4">
<tr><td>
This responds to database deletion
<br />
<br />

</td></tr>

<tr><td>

 Result: 
<br /><br />
<?php

$uname=$_REQUEST["uname"];
$dbname=$_REQUEST["dname"];
$tname="crysta60_adlist";

// $_REQUEST or _POST
$con = mysql_connect("localhost",$uname,"(QJ2XUA7");
//$con = mysql_connect("localhost","root","(QJ2XUA7");
//$con = mysql_connect("crysta60_xjhdb","crysta60_xzheng","(QJ2XUA7");
if (!$con){
 		die('Could not connect: ' . mysql_error());
}else 
   echo "Connect successfully.<br />";


     

if (mysql_query("DROP DATABASE " . $dbname, $con))
{
  echo "Database deleted";
}else  {
  echo "Error deleting db: " . mysql_error();
}

mysql_close($con); 
?>
</td></tr>
</table>
</body>
</html>