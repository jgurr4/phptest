<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>login</title>
</head>
<body>
<?php
$dbhost = 'localhost:3306';
$dbuser = 'root';
$dbpass = 'super03';
$dbdatabase = 'phptest';
$mysqli = new mysqli($dbhost, $dbuser, $dbpass, $dbdatabase, 8886);


#if(! $conn ){
#    echo 'Connected failure\n';
#}
#echo 'Connected successfully\n';

$sql = "";
?>
<form action="index.php" method="post">
    <input type="text" name="uid" placeholder="Username">
    <br>
    <input type="text" name="password" placeholder="password">
    <br>
    <input type="text" name="email" placeholder="E-mail">
    <br>
    <button type="submit" name="submit">signup</button>

</form>
</body>
</html>
