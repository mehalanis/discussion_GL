<link href="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<!------ Include the above in your HEAD tag ---------->

<link href="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<!------ Include the above in your HEAD tag ---------->
<!------ Include the above in your HEAD tag ---------->


<!DOCTYPE html><html class=''>
<?php
include 'php/database.inc';
  session_start();
  if(!isset($_SESSION["id"])){
    header("location: index.php");
  }
?>
<head><script src='//production-assets.codepen.io/assets/editor/live/console_runner-079c09a0e3b9ff743e39ee2d5637b9216b3545af0de366d4b9aad9dc87e26bfd.js'></script><script src='//production-assets.codepen.io/assets/editor/live/events_runner-73716630c22bbc8cff4bd0f07b135f00a0bdc5d14629260c3ec49e5606f98fdd.js'></script><script src='//production-assets.codepen.io/assets/editor/live/css_live_reload_init-2c0dc5167d60a5af3ee189d570b1835129687ea2a61bee3513dee3a50c115a77.js'></script><meta charset='UTF-8'><meta name="robots" content="noindex"><link rel="shortcut icon" type="image/x-icon" href="//production-assets.codepen.io/assets/favicon/favicon-8ea04875e70c4b0bb41da869e81236e54394d63638a1ef12fa558a4a835f1164.ico" /><link rel="mask-icon" type="" href="//production-assets.codepen.io/assets/favicon/logo-pin-f2d2b6d2c61838f7e76325261b7195c27224080bc099486ddd6dccb469b8e8e6.svg" color="#111" /><link rel="canonical" href="https://codepen.io/emilcarlsson/pen/ZOQZaV?limit=all&page=74&q=contact+" />
<link href='https://fonts.googleapis.com/css?family=Source+Sans+Pro:400,600,700,300' rel='stylesheet' type='text/css'>

<script src="https://use.typekit.net/hoy3lrg.js"></script>
<script>try{Typekit.load({ async: true });}catch(e){}</script>
<link rel='stylesheet prefetch' href='https://cdnjs.cloudflare.com/ajax/libs/meyer-reset/2.0/reset.min.css'><link rel='stylesheet prefetch' href='https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.6.2/css/font-awesome.min.css'>
<style class="cp-pen-styles">
</style>

<link rel="stylesheet" type="text/css" href="css/discussion.css">
<script src="Discussion.js"></script>
</head><body>

<div id="frame">
  <div id="sidepanel">
    <div id="profile">
      <div class="wrap">
        <img id="profile-img" src="img/you.png" class="online" alt="" />
        <p> Summoner : <?php echo $_SESSION["username"]; ?></p>
      </div>
    </div>

    <div id="contacts">




      <ul>




<!--send inv-->
<?php
$link=mysqli_connect("localhost", "root", "","gl");
if(isset($_POST["addc"])) {
$recpu = $_POST["nom"];
$_query = mysqli_query($link,"SELECT * FROM joueur WHERE username = '" . $recpu . "'");
$_row = mysqli_fetch_array($_query);
$recp = $_row["id_joueur"];
$query = mysqli_query($link,"SELECT * FROM joueur WHERE id_joueur = '" . $recp . "'");
if(mysqli_num_rows($query) > 0) {
$_query = mysqli_query($link,"SELECT * FROM friend_requests WHERE sender = '" . $_SESSION["id"] . "' AND recipient = '" . $recp . "'");
if(mysqli_num_rows($_query) == 0) {
mysqli_query($link,"INSERT INTO friend_requests SET sender = '" . $_SESSION["id"] . "', recipient = '" . $recp . "'");
}
}
}
?>





<!-- Accepte inv-->
<?php
$link=mysqli_connect("localhost", "root", "","gl");
if(isset($_GET["accept"])) {
$query = mysqli_query($link,"SELECT * FROM friend_requests WHERE sender = '" . $_GET["accept"] . "' AND recipient = '" . $_SESSION["id"] . "'");
if(mysqli_num_rows($query) > 0) {
$_query = mysqli_query($link,"SELECT * FROM joueur WHERE id_joueur = '" . $_GET["accept"] . "'");
$_row = mysqli_fetch_array($_query);
$friends = unserialize($_row["friends"]);
$friends[] = $_SESSION["id"];
mysqli_query($link,"UPDATE joueur SET friends = '" . serialize($friends) . "' WHERE id_joueur = '" . $_GET["accept"] . "'");
$_query = mysqli_query($link,"SELECT * FROM joueur WHERE id_joueur = '" . $_SESSION["id"] . "'");
$_row = mysqli_fetch_array($_query);
$friends = unserialize($_row["friends"]);
$friends[] = $_GET["accept"];
mysqli_query($link,"UPDATE joueur SET friends = '" . serialize($friends) . "' WHERE id_joueur = '" . $_SESSION["id"] . "'");
}
mysqli_query($link,"DELETE FROM friend_requests WHERE sender = '" . $_GET["accept"] . "' AND recipient = '" . $_SESSION["id"] . "'");
mysqli_query($link,"INSERT INTO discussion SET id_joueur_1 = '" . $_SESSION["id"] . "', id_joueur_2 = '" . $_GET["accept"] . "'");
}
?>

<!-- DELETE inv -->

<?php
$link=mysqli_connect("localhost", "root", "","gl");
if(isset($_GET["refuse"])) {
$query = mysqli_query($link,"SELECT * FROM friend_requests WHERE sender = '" . $_GET["refuse"] . "' AND recipient = '" . $_SESSION["id"] . "'");
if(mysqli_num_rows($query) > 0) {

mysqli_query($link,"DELETE FROM friend_requests WHERE sender = '" . $_GET["refuse"] . "' AND recipient = '" . $_SESSION["id"] . "'");
}}
?>


<li class="contact">
    <p class="preview" align="center">  &#9830 Friend List : </p>
</li>



<!-- start or rech or all -->




<?php
$link=mysqli_connect("localhost", "root", "","gl");

        $query = mysqli_query($link,"SELECT * FROM joueur WHERE id_joueur = '" . $_SESSION["id"] . "'");
        while($row = mysqli_fetch_array($query)) {
        $friends = unserialize($row["friends"]);
        if(isset($friends[0])) {
        foreach($friends as $friend) {

              if(isset($_POST['rech'])){
                  $name = $_POST["nom"];
                    $_query = mysqli_query($link,"SELECT * FROM joueur WHERE id_joueur = '" . $friend . "' && username ='" . $name . "'");
              }
              else {
                  $_query = mysqli_query($link,"SELECT * FROM joueur WHERE id_joueur = '" . $friend . "'");
              }

        $_row = mysqli_fetch_array($_query);
        if(!$_row) continue; ?>

        <li class="contact" onclick="">
          <div class="wrap" >
            <span class="contact-status online"></span>
              <img id="profile-img" src="img/them.png" class="online" alt="" />
            <div class="meta">
              <p class="name">  <?php echo $_row["username"] . "&nbsp &nbsp <a href=\"" . $_SERVER["PHP_SELF"] . "?id=" . $_row["id_joueur"] . "\"> &#9993 </a>";?></p>

            </div>
          </div>
        </li>



<?php
        }
        }
        }
        ?>

<!--end of rech or all-->
  <li class="contact">
      <p class="preview" align="center">  &#9830 Friend Requests : </p>
  </li>

<!--Start of friend Requests-->
<?php
$link=mysqli_connect("localhost", "root", "","gl");
  $query = mysqli_query($link,"SELECT * FROM friend_requests WHERE recipient = '" . $_SESSION["id"] . "'");
  if(mysqli_num_rows($query) > 0) {
  while($row = mysqli_fetch_array($query)) {
  $_query = mysqli_query($link,"SELECT * FROM joueur WHERE id_joueur = '" . $row["sender"] . "'");
  while($_row = mysqli_fetch_array($_query)) { ?>

    <li class="contact">
      <div class="wrap">
        <span class="contact-status"></span>
        <img src="img/add.png" alt="" />
        <div class="meta">
          <?php echo $_row["username"] . " invited you. &nbsp <a href=\"" . $_SERVER["PHP_SELF"] . "?accept=" . $_row["id_joueur"] . "\"> &#10004;</a>  &nbsp <a href=\"" . $_SERVER["PHP_SELF"] . "?refuse=" . $_row["id_joueur"] . "\"> &#10006;</a> ";?>
        </div>
      </div>
    </li>


  <?php
  }
  }
  }
?>

<!--end of friends request-->

      </ul>
    </div>
    <div id="bottom-bar" style="text-align: center">

<!--get info for add or search -->
      <form action="#" method="post">
            <button type="submit" id="addc" name="addc"></i> <b> Add friends </b></button>
            <button type="submit" id="search" name="rech"><b> Search </b></button>
            <input align"center" type="text" name="nom" placeholder="contacts" /> <label for=""><i class="fa fa-search" aria-hidden="true"></i></label>

        </form>





    </div>
  </div>
<!-- PLEASE SEE : Yaa Aniiiis, tu trouveras l'id f $_GET["anis"] ou bien $disid et le username f $disuser, et tu trouvera l'id de joueur 1 f $_SESSION["id"]  -->


<?php
if(isset($_GET["id"])){
  $link=mysqli_connect("localhost", "root", "","gl");
  $disid = $_GET["id"];
  $_query = mysqli_query($link,"SELECT * FROM joueur WHERE id_joueur = '" . $disid . "'");
  $_row = mysqli_fetch_array($_query);
  $disuser = $_row["username"];

}
else {
      $disuser = "1";
}
 ?>

  <div class="content">
    <div class="contact-profile">
      <img src="img/them.png" alt="" />




      <p><?php
      $link=mysqli_connect("localhost", "root", "","gl");
                $query = mysqli_query($link,"SELECT * FROM joueur WHERE username = '" . $_GET["idguilde"] . "'");
                $_row = mysqli_fetch_array($query);
                $idguild = $_row["ID_Guild"];
                $query = mysqli_query($link,"SELECT * FROM guild WHERE ID_Guild = '" . $idguild . "'");

                $row = mysqli_fetch_array($query); echo $row["Nom_Guild"]; ?></p>

    </div>
    <div class="messages">
      <ul>

        <div class="container">
        	<div class="row">
        <table class="table table-bordered">
            <thead>
              <tr>
                <th>Classement</th>
                <th>Username</th>
                <th>Score</th>
              </tr>
            </thead>
            <tbody>



              <?php
              $link=mysqli_connect("localhost", "root", "","gl");
                        $query = mysqli_query($link,"SELECT * FROM joueur WHERE username = '" . $_GET["idguilde"] . "'");
                        $row = mysqli_fetch_array($query);
                        $idguild = $row["ID_Guild"];
                      $query = mysqli_query($link,"SELECT * FROM joueur WHERE ID_Guild = '" . $idguild . "' ORDER BY Point DESC");
                      $cpt=1;
                      while($_row = mysqli_fetch_array($query)) {
                      ?>

                      <tr>
                        <td><?php echo $cpt++ ;?></td>
                        <td><p class="name">  <?php echo $_row["username"] ;?></p></td>
                        <td><p class="name">  <?php echo $_row["Point"] ;?></p></td>
                      </tr>



              <?php
                      }

                      ?>







            </tbody>
          </table>
        	</div>
        </div>


      </ul>
    </div>
  </div>
</div>

     <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/socket.io/2.3.0/socket.io.js"/>

<script src='//production-assets.codepen.io/assets/common/stopExecutionOnTimeout-b2a7b3fe212eaa732349046d8416e00a9dec26eb7fd347590fbced3ab38af52e.js'></script><script src='https://code.jquery.com/jquery-2.2.4.min.js'></script>



<script >
<?php
$database=new database();
$result=$database->query("select id_discussion from discussion where id_joueur_1=".$_SESSION["id"]." and id_joueur_2=".$_GET["id"]." or id_joueur_2=".$_GET["id"]." and id_joueur_1=".$_SESSION["id"]);
  $row=mysqli_fetch_assoc($result);

  ?>

var socket=io.connect("http://localhost:3000/");
            var id="<?php echo $_SESSION["id"];?>";
            var recepteur="<?php echo $_GET["id"];?>";
            var discussion="<?php echo $row["id_discussion"];?>";
/*socket.on('message', function(message) {
        alert('Le serveur a un message pour vous : ' + message);


    });*/
socket.emit('nouveau_user', {nom:id});

loadMessage(discussion);
  $(".messages").animate({ scrollTop: $(document).height() }, "fast");

$("#profile-img").click(function() {
  $("#status-options").toggleClass("active");
});

$(".expand-button").click(function() {
  $("#profile").toggleClass("expanded");
  $("#contacts").toggleClass("expanded");
});

$("#status-options ul li").click(function() {
  $("#profile-img").removeClass();
  $("#status-online").removeClass("active");
  $("#status-away").removeClass("active");
  $("#status-busy").removeClass("active");
  $("#status-offline").removeClass("active");
  $(this).addClass("active");

  if($("#status-online").hasClass("active")) {
    $("#profile-img").addClass("online");
  } else if ($("#status-away").hasClass("active")) {
    $("#profile-img").addClass("away");
  } else if ($("#status-busy").hasClass("active")) {
    $("#profile-img").addClass("busy");
  } else if ($("#status-offline").hasClass("active")) {
    $("#profile-img").addClass("offline");
  } else {
    $("#profile-img").removeClass();
  };

  $("#status-options").removeClass("active");
});

function newMessage() {
  message = $(".message-input input").val();
  if($.trim(message) == '') {
    return false;
  }
  socket.emit('envoyer_message', {idj:id,idR:recepteur,id_discussion:discussion,message:message});
  $('<li class="sent"><img src="img/you.png" alt="" /><p>' + message + '</p></li>').appendTo($('.messages ul'));
  $('.message-input input').val(null);
  $('.contact.active .preview').html('<span>You: </span> ' + message+'');
  $(".messages").animate({ scrollTop: $(document).height() }, "fast");
};
socket.on('reception_message', function(message) {
        $('<li class="replies"><img src="img/them.png" alt="" /><p>' + message + '</p></li>').appendTo($('.messages ul'));
       $(".messages").animate({ scrollTop: $(document).height() }, "fast");
    });
$('.submit').click(function() {
  newMessage();
});

$(window).on('keydown', function(e) {
  if (e.which == 13) {
    newMessage();
    return false;
  }
});
//# sourceURL=pen.js
</script>
</body></html>
