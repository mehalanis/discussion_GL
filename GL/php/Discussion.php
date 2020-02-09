<?php
require 'database.inc';

if((isset($_GET["id_discussion"]))&&(!empty($_GET["id_discussion"]))){
  $database=new database();
  $result=$database->query("select * from message where id_discussion=".$_GET["id_discussion"]." order by id_message ASC");
  $list=array();
  $message=array();
  while ($row=mysqli_fetch_assoc($result)) {
  	$message["id_message"]=$row["id_message"];
  	$message["id_joueur"]=$row["id_joueur"];
  	$message["message"]=$row["message"];
  	$message["time_send"]=$row["time_send"];
  	$message["time_vu"]=$row["time_vu"];
    $list[]=$message;
  }
  echo json_encode($list,JSON_UNESCAPED_UNICODE);
}
 ?>
