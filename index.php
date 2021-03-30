<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>login</title>
</head>
<body>
<?php


define("MYSQL_CONN_ERROR", "Unable to connect to database.");
$_PHP_SELF = $_SERVER["PHP_SELF"];

// Ensure reporting is setup correctly
mysqli_report(MYSQLI_REPORT_STRICT | MYSQLI_REPORT_ERROR);

// Connect function for database access
function connect($usr,$pw,$db,$host,$sql) {
    try {
        $mysqli = new mysqli($host,$usr,$pw,$db);
        if (mysqli_connect_errno()) {
            printf("Connect failed: %s\n", mysqli_connect_error());
            exit();
        }

        $result = $mysqli->query($sql);
        $row = $result->fetch_assoc();
        /* How to return specific columns from multiple rows. */
        while ($row = $result->fetch_assoc()) {
            printf("%s (%s)\n", $row["id"], $row["title"]);
        }
        echo $row;
    } catch (mysqli_sql_exception $e) {
        throw $e;
    }
}

try {
    connect('root','super03','phptest','127.0.0.1','SELECT * FROM task');
    echo 'Connected to database';
} catch (Exception $e) {
    echo $e->getMessage() . "\n";
    echo $e->getCode() . "\n";
    echo $e->getTraceAsString() . "\n";
}

$query ="SELECT * FROM task";

?>
<hr>
<br>
<form action="<?php $_PHP_SELF ?>" method="post">
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