<?php declare(strict_types=1);
include 'index.php';
$getVar = new Test();
$mysqli = $getVar->sendMysqli();

$username = $_REQUEST["uid"];
$name = $_REQUEST["name"];
$password = hash('sha256', $_REQUEST["password"]);
$email = $_REQUEST["email"];
$phone = $_REQUEST["phone"];

$sql = "CALL createNewUser('$username', '$name', '$password', '$email', '$phone')";

try {
    $mysqli->query($sql);
    $sql = "CALL retrieveUser('$username', '$password')";
    $result = $mysqli->query($sql);
    if ($row = $result->fetch_assoc()) {
        echo 'You have successfully created your account.';
        echo '<br>';
        echo $row['id'] . ' ' . $row['name'] . ' ' . $row['username'] . ' ' . $row['email'] . ' ' . $row['phone'];
    }
} catch (mysqli_sql_exception $e) {
    if (preg_match('/.*key \'email\'/', $e->getMessage())) {
        echo 'That email is already in use with an existing account.';
    } elseif (preg_match('/.*key \'username\'/', $e->getMessage())) {
        echo 'That username is already in use with an existing account.';
    }
}
/* Todo: Add functionality for deleteUser, updateUser, getNextTask, addComplete, and removeComplete stored procedures.


/*  echo $e->getMessage() . "<br>";
    echo $e->getCode() . "<br>";
    echo $e->getTraceAsString() . "<br>";*/
//throw $e;

// exit();

// refreshes the page.
/*$location = '/index.php';
header("Location:$location");*/
//Load the new html in the page:


/*$row = $result->fetch_assoc() or die(mysql_error());
echo $row;*/


// Connect function for database access
/*function connect($usr,$pw,$db,$host,$sql) {
    try {
        $mysqli = new mysqli($host,$usr,$pw,$db);
        if (mysqli_connect_errno()) {
            printf("Connect failed: %s\n", mysqli_connect_error());
            exit();
        }

        $result = $mysqli->query($sql);
        $row = $result->fetch_assoc();
        // How to return specific columns from multiple rows.
        while ($row = $result->fetch_assoc()) {
            echo $row[0] . $row[1] . $row[2] . $row[3] . $row[4] . $row[5] . $row[6] . $row[7];
            //printf("%s (%s)\n", $row["id"], $row["title"]);
        }
        echo $row;
    } catch (mysqli_sql_exception $e) {
        throw $e;
    }
}*/

/*try {
    connect('root','super03','phptest','192.168.1.53','SELECT * FROM task');
    echo 'Connected to database';
} catch (Exception $e) {
    echo $e->getMessage() . "<br>";
    echo $e->getCode() . "<br>";
    echo $e->getTraceAsString() . "<br>";
}*/


/*if( $_REQUEST["message"] ){
    $message = $_REQUEST['message'];
    echo "You have successfully signed up. ". $message;
}*/
//Obtain post values.
/* For use only if you decide to skip using jquery/ajax.
$_PHP_SELF = $_SERVER["PHP_SELF"];
$username = $_POST["uid"];
$name = $_POST["name"];
$password = hash('sha256', $_POST["password"]);
$email = $_POST["email"];
$phone = $_POST["phone"];
*/
