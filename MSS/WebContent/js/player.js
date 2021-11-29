var setCookie = function(name, value, exp) {
	var date = new Date();
	date.setTime(date.getTime() + exp*24*60*60*1000);
	document.cookie = name + '=' + value + ';expires=' + date.toUTCString() + ';path=/';
};

var getCookie = function(name) {
	var value = document.cookie.match('(^|;) ?' + name + '=([^;]*)(;|$)');
	return value? value[2] : null;
};

if(getCookie("title") == null){
	document.getElementById("title").innerHTML = "None";
	document.getElementById("singer").innerHTML = "-";
}else{
	document.getElementById("title").innerHTML = getCookie("title");
	document.getElementById("singer").innerHTML = getCookie("singer");
}

var player = document.getElementById("player");
let progress = document.getElementById("progress");
let playbtn = document.getElementById("playbtn");

function setPlayer(path, title, singer){
	document.getElementById("title").innerHTML = title;
	document.getElementById("singer").innerHTML = singer;
	setCookie("title", title, 1);
	setCookie("singer", singer, 1);
}

var playpause = function(){
    if(player.paused){
        player.play();
    }else{
        player.pause();
    }
}

playbtn.addEventListener("click", playpause);

player.onplay = function(){
    playbtn.classList.remove("fa-play-circle");
    playbtn.classList.add("fa-pause-circle");
}

player.onpause = function(){
    playbtn.classList.add("fa-play-circle");
    playbtn.classList.remove("fa-pause-circle");
}

player.ontimeupdate = function(){
    let ct = player.currentTime;
    current.innerHTML=timeFormat(ct);

    let duration = player.duration;
    prog = Math.floor((ct * 100)/duration);
    progress.style.setProperty("--progress", prog+"%");
}

function timeFormat(ct){
    minutes=Math.floor(ct / 60);
    seconds = Math.floor(ct % 60);

    if(seconds < 10){
        seconds = "0" + seconds;    }

    return minutes + ":" + seconds;
}