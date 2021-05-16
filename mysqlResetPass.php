<?php declare(strict_types=1);
include 'MysqlConnect.php';
$conn = new MysqlConnect();
$mysqli = $conn->sendMysqli();

$username = $_REQUEST["uname"];
$email = $_REQUEST["email"];

try {
    $sql = "CALL retrieveUserFromEmail('$username','$email')";
    $result = $mysqli->query($sql);
    if ($row = $result->fetch_assoc()) {
        echo 'Found user. Redirect user to reset password form.';
        echo '<br>';
        echo $row['id'] . ' ' . $row['name'] . ' ' . $row['username'] . ' ' . $row['email'] . ' ' . $row['phone'];
    } else {
        echo 'No results for that username/email';
    }
} catch (mysqli_sql_exception $e) {
    echo 'Reset Password request failed.';
    echo '<br>';
    echo $e->getMessage();
}