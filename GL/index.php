<!DOCTYPE html>
<?php
if(isset($_POST["envoyer"])){
	require 'php/database.inc';
	if(isset($_POST["username"])&&!empty($_POST["username"])&&isset($_POST["password"])&&!empty($_POST["password"])){
		$database=new database();
		$result=$database->query("select * from joueur where username='".$_POST["username"]."' and password='".$_POST["password"]."'");
		if(mysqli_num_rows($result)>0){
			$row=mysqli_fetch_assoc($result);
			session_start();
			$_SESSION["id"]=$row["id_joueur"];
			$_SESSION["username"]=$row["username"];
			$_SESSION["password"]=$row["password"];
			 header("location: Discussion.php");
		}
	}
}

?>

<html lang="en" dir="ltr">
  <head>
    <meta charset="utf-8">
    <title></title>
    <link rel="stylesheet" href="css\bootstrap.min.css">
  </head>
  <body>
    <div class="container">
    <h2>Connecter</h2>
    <form class="form-horizontal" action="index.php" method="post">
      <div class="form-group">
        <label class="control-label col-sm-2" for="email">username :</label>
        <div class="col-sm-10">
          <input type="text" class="form-control" id="titre" placeholder="username" name="username">
        </div>
      </div>
      <div class="form-group">
        <label class="control-label col-sm-2" for="description">password :</label>
        <div class="col-sm-10">
          <input type="password" class="form-control" id="titre" placeholder="password" name="password">
        </div>
      </div>
      
      <div class="form-group">
        <div class="col-sm-offset-2 col-sm-10">
          <button type="submit" class="btn btn-primary" name="envoyer">Se connecter</button>
        </div>
      </div>
    </form>
  </div>

  </body>
</html>
