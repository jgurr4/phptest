<?php

class MysqlConnect
{
const MYSQL_CONN_ERROR = "Unable to connect to database.";

    public function sendMysqli(): mysqli
    {
        mysqli_report(MYSQLI_REPORT_STRICT | MYSQLI_REPORT_ERROR);
        $dbhost = 'p:192.168.1.53';
        $dbuser = 'root';
        $dbpass = 'super03';
        $dbdatabase = 'phptest';
        return new mysqli($dbhost, $dbuser, $dbpass, $dbdatabase, 3306);
    }
}