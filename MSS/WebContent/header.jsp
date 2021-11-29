<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<header>
	<div class="container">
		<nav>
			<form action="search.jsp" method="get" id="search">
				<div class="search-box">
					<input class="search-txt" type="text" placeholder="Type to search"
						name="keyword" id="searchText"> <a class="search-btn"
						href="#" onclick="searchButton()"> <i class="fa fa-search"
						aria-hidden="true"></i>
					</a>
				</div>
			</form>

			<ul class="nav-links">
				<li><a class="nav" href="chart.jsp">차트</a></li>
				<li><a class="nav" href="#.html">방 목록</a></li>
				<%
					if (session.getAttribute("userid") == null) {
						out.println("<li><a class='nav' href='login.jsp'><i class='fa fa-user'></i></a></li>");
					} else {
						String userid = (String) session.getAttribute("userid");
						if (session.getAttribute("account") == "admin") {
							out.println("<li><a class='nav' href='management.jsp'>관리 페이지</a></li>");
							out.println("<li class='nav'><h5>" + userid + "관리자님</h5></li>");
						} else {
							out.println("<li class='nav'><h5>" + userid + "님</h5></li>");
						}
						out.println("<li><a class='nav' href='logout.jsp'><i class='fa fa-user'></i></a></li>");
					}
				%>

			</ul>
		</nav>
	</div>
</header>