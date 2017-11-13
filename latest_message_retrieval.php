<?php

$newer_than_message_order = null;

if(isset($_GET['newer_than'])) {
	$newer_than_message_order = $_GET['newer_than'];
}

$greatest_message_order = ($newer_than_message_order === null)? 0 : $newer_than_message_order;

$data = new stdClass();

$messages = array();

if (!$mysql_connection = mysqli_connect('localhost', 'root', '', 'chat_app_db')) {
	exit('connection_error');
}

if ($newer_than_message_order === null) {
	$sql_string = 'select t.* from (select hex(message_id) message_id, message_order, message_time, sender_name, message_text from messages order by message_order desc limit 0, 10) t order by t.message_order asc';
} else {
	$sql_string = 'select t.* from (select hex(message_id) message_id, message_order, message_time, sender_name, message_text from messages where message_order > '.$newer_than_message_order.' order by message_order desc limit 0, 10) t order by t.message_order asc';
}

if (!$result = mysqli_query($mysql_connection, $sql_string)) {
	mysqli_close($mysql_connection);
	exit('query error: ' . $sql_string);
}

$least_message_order = null;

while ($object = mysqli_fetch_object($result)) {
	$messages[] = $object;
	
	if ($greatest_message_order < $object->message_order) {
		$greatest_message_order = $object->message_order;
	}
	
	$least_message_order = $greatest_message_order;
}

foreach ($messages as $message) {
	if ($least_message_order > $message->message_order) {
		$least_message_order = $message->message_order;
	}
}

mysqli_close($mysql_connection);

$data->messages = $messages;
$data->next = strtok('http://'.$_SERVER['HTTP_HOST'].$_SERVER['REQUEST_URI'],'?').'?newer_than='.$greatest_message_order;
$data->greatest_message_order = $greatest_message_order;
$data->least_message_order = $least_message_order;

header('Content-Type: application/json');
echo json_encode($data, JSON_PRETTY_PRINT);