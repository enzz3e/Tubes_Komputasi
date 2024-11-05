<?php
function getConnection(): PDO
{
    $host = "db";
    $port = 3306;
    $database = "fp_web";
    $username = "root";
    $password = "12345";

    return new PDO("mysql:host=$host;port=$port;dbname=$database", $username, $password);
}
