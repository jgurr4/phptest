<?php declare(strict_types=1);
const MYSQL_CONN_ERROR = "Unable to connect to database.";

//Obtain post values.
$_PHP_SELF = $_SERVER["PHP_SELF"];
$username = $_POST["uid"];
$name = $_POST["name"];
$password = hash('sha256', $_POST["password"]);
$email = $_POST["email"];
$phone = $_POST["phone"];

// Ensure reporting is setup correctly
mysqli_report(MYSQLI_REPORT_STRICT | MYSQLI_REPORT_ERROR);

//Set up mysql connection with connection pooling:
$dbhost = 'p:192.168.1.53';
$dbuser = 'root';
$dbpass = 'super03';
$dbdatabase = 'phptest';
$mysqli = new mysqli($dbhost, $dbuser, $dbpass, $dbdatabase, 3306);
$sql = "INSERT INTO user VALUES (default, $username, $name, $password, $email, $phone, default, default)";

$result = $mysqli->query($sql);
$row = $result->fetch_assoc();
echo $row;


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

