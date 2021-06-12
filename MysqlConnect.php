<?php
include("config.php");

class MysqlConnect
{
const MYSQL_CONN_ERROR = "Unable to connect to database.";

    public function sendMysqli(): mysqli
    {
        mysqli_report(MYSQLI_REPORT_STRICT | MYSQLI_REPORT_ERROR);
        $dbhost = constant("HOST");
        $dbuser = constant("USER");
        $dbpass = constant("PASS");
        $dbdatabase = constant("DB");
        return new mysqli($dbhost, $dbuser, $dbpass, $dbdatabase, 3306);
    }
}
