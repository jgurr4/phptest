<?php declare(strict_types=1);
include 'MysqlConnect.php';
$conn = new MysqlConnect();
$mysqli = $conn->sendMysqli();

$username = $_REQUEST["uname"];
$password = hash('sha256', $_REQUEST["pass"]);

try {
    $sql = "CALL retrieveUser('$username', '$password')";
    $result = $mysqli->query($sql);
    if ($row = $result->fetch_assoc()) {
        echo 'login successful';
        echo '<br>';
        echo $row['id'] . ' ' . $row['name'] . ' ' . $row['username'] . ' ' . $row['email'] . ' ' . $row['phone'];
    } else {
        'No user found with that username/password.';
    }
} catch (mysqli_sql_exception $e) {
    echo 'Login failed.';
    echo '<br>';
    echo $e->getMessage();
}