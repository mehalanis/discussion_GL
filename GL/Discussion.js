function loadMessage(id_discussion,id_joueur) {
  var xhttp = new XMLHttpRequest();
  xhttp.onreadystatechange = function() {
    if (this.readyState == 4 && this.status == 200) {
       var list =JSON.parse(this.responseText);
       for(var i=0;i<list.length;i++){

		if(list[i]["id_joueur"]==id_joueur){
			  $('<li class="sent"><img src="img/you.png" alt="" /><p>' + list[i]["message"] + '</p></li>').appendTo($('.messages ul'));
	   }else{ 
	   	$('<li class="replies"><img src="img/them.png" alt="" /><p>' + list[i]["message"] + '</p></li>').appendTo($('.messages ul'));
	    }
	}
    }
  };
  xhttp.open("GET", "php/Discussion.php?id_discussion="+id_discussion, false);
  xhttp.send();
}
