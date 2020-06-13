<?php
$conn = new mysqli("mysql", "db_user", "root_password", "db_name");
if ($conn->connect_error) {
	die("Connection failed: " . $conn->connect_error . "\n");
}
echo "OK";