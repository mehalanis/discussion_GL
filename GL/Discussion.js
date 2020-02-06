function loadMessage(id) {
  var xhttp = new XMLHttpRequest();
  xhttp.onreadystatechange = function() {
    if (this.readyState == 4 && this.status == 200) {
       var list =JSON.parse(this.responseText);
       for(var i=0;i<list.length;i++){

		if(list[i]["id_joueur"]==id){
			  $('<li class="sent"><img src="http://emilcarlsson.se/assets/mikeross.png" alt="" /><p>' + list[i]["message"] + '</p></li>').appendTo($('.messages ul'));
	   }else{ 
	   	$('<li class="replies"><img src="http://emilcarlsson.se/assets/mikeross.png" alt="" /><p>' + list[i]["message"] + '</p></li>').appendTo($('.messages ul'));
	    }
	}
    }
  };
  xhttp.open("GET", "php/Discussion.php?id_discussion="+id, false);
  xhttp.send();
}
