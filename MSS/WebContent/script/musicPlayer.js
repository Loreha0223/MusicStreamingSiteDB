
var audio;
var playtime = 0;
var isplay = false;
var currentTime;

function play(){
	audio = new Audio("media/sample.mp3");
	document.getElementById("coverimage").src = "sample.png";
	document.getElementById("title").innerHTML = "sample";
	if(isplay == false){
		audio.volume = 0.2;
		audio.currentTime = playtime;
		audio.play();
		currentTime = setInterval(function() {var minute = parseInt(Math.round(audio.currentTime) / 60);
											var second = Math.round(audio.currentTime) - (minute * 60);
											second = "0" + second; second = second.slice(-2);
											minute = "0" + minute; minute = minute.slice(-2);
											var convertedTime = minute + ":" + second; document.getElementById("playtime").innerHTML = convertedTime;}, 1000);
	
	}

	isplay = true;

}

function pause(){
	
	isplay = false;

	playtime = audio.currentTime;
	audio.pause();
	clearInterval(currentTime);

}

function stop(){

	isplay = false;

	playtime = 0;
	document.getElementById("playtime").innerHTML = "00:00";
	audio.pause();
	clearInterval(currentTime);

}