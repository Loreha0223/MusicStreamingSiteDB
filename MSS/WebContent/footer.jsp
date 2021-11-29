<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<footer>
	<div class="container">
		<div class="playing-album">
			<img src="src/cover.jpg">
			<div class="album-info">
				<span id="title" class="title">Another Life</span> <span id="singer">Kyle Patrick</span>
			</div>
			<i class="fa fa-heart" id="heart-icon" aria-hidden="true"></i>
		</div>
		<audio id="player" src="./src/AnotherLife.mp3"></audio>
		<div class="player">
			<div class="control">
				<i class="fa fa-random play" aria-hidden="true"></i> <i
					class="fa fa-step-backward step" aria-hidden="true"></i> <i
					class="fa fa-play-circle play-btn" id="playbtn" aria-hidden="true"></i>
				<i class="fa fa-step-forward step" aria-hidden="true"></i> <i
					class="fa fa-repeat play" aria-hidden="true"></i>
			</div>
			<div class="progress-bar">
				<div id="current">0:00</div>
				<div id="bar">
					<div id="progress"></div>
				</div>
				<div id="end">4:16</div>
			</div>
		</div>
		<div class="volume">
			<div class="volume-container">
				<div class="volume-control">
					<i class="fa fa-volume-up" id="volume" aria-hidden="true"></i> <i
						class="fa fa-desktop" aria-hidden="true"></i> <i
						class="fa fa-list-ul" aria-hidden="true"></i>
				</div>
				<div class="volume-bar">
					<input type="range" , min="0" , max="100" value="40" id="myRange"
						class="slider">
				</div>
			</div>
		</div>
	</div>
</footer>

<script type="text/javascript" src="./js/slide.js"></script>
<script type="text/javascript" src="./js/player.js"></script>
<script type="text/javascript" src="./js/heart.js"></script>
<script type="text/javascript" src="./js/mute.js"></script>