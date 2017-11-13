<?php

if (isset($_POST['name']) and isset($_POST['message'])) {
	$sender_name = $_POST['name'];
	$message_text = $_POST['message'];
	$message_time = date('Y-m-d H:i:s', time());;

	if (!$mysql_connection = mysqli_connect('localhost', 'root', '', 'chat_app_db')) {
		exit('connection_error');
	}

	$sql_string = 'insert into messages (message_id, message_time, sender_name, message_text) values (unhex(replace(uuid(),\'-\',\'\')), \''.$message_time.'\', \''.$sender_name.'\', \''.$message_text.'\')';

	if (!mysqli_query($mysql_connection, $sql_string)) {
		mysqli_close($mysql_connection);
		exit('query error: ' . $sql_string);
	}

	mysqli_close($mysql_connection);

	echo $sql_string;
}
