<?php
$dbhost = 'localhost:3306';
$dbuser = 'root';
$dbpass = 'super03';
$dbdatabase = 'phptest';
$mysqli = new mysqli($dbhost, $dbuser, $dbpass, $dbdatabase, 8886);


if(! $conn ){
    echo 'Connected failure\n';
}
echo 'Connected successfully\n';

$sql = "";
header("Location: index.html");
