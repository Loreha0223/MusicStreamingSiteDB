function printMusicList(str) {
  $(".listno").load("printPL.jsp?listno="+str, hideLoader);
}