function searchButton(){
	if(document.getElementById('searchText').value != '')
		document.getElementById('search').submit();
}

function banButton(no){
	document.getElementById('ban').value = no;
	document.getElementById('manage').submit();
}

function unbanButton(no){
	document.getElementById('unban').value = no;
	document.getElementById('manage').submit();
}

function initButton(no){
	document.getElementById('init').value = no;
	document.getElementById('manage').submit();
}

function openSearchWindow(){
	var searchWin = window.open("selectsonginroom.jsp", "Select Music", "width=570, height=350, resizable = no, scrollbars = no");
}