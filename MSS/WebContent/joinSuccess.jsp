<%@include file="dbConnect.jsp"%>
<%
	ResultSet rs = null;
	String sql = "";

	request.setCharacterEncoding("UTF-8");
	String userid = request.getParameter("userid");
	String password = request.getParameter("password");
	String passCheck = request.getParameter("password-check");
	String nickname = request.getParameter("nickname");
	String birthday = request.getParameter("birthday");
	String sex = request.getParameter("sex");
	String email = request.getParameter("email");
	String phone = request.getParameter("phone");
	
	String account = request.getParameter("account");
	String userType = null;
	
// 	String rt_msg = null;
	
	if (account != null){
		userType = "admin";
		try {
			sql = "INSERT INTO ADMIN VALUES ('" + userid + "', '" + password + "', '" + nickname + "', '" + phone + "', '" + email + "', TO_DATE('" + birthday + "', 'yyyy-mm-dd'), '" + sex + "')";
			PreparedStatement st = conn.prepareStatement(sql);
			int res = st.executeUpdate();
			if(res == 1){
				response.sendRedirect("login.jsp");
// 	        	System.out.println("관리자 계정으로 회원가입이 완료되었습니다. 환영합니다 "+name+" 님!");
			}else{
				String url = request.getHeader("referer");
				response.sendRedirect(url);
			}
		} catch (SQLException e) {
			e.printStackTrace();
			String url = request.getHeader("referer");
			response.sendRedirect(url);
		}
	}else{
		userType = "user";
		
// 		//id 검사
// 		sql = "select * from player where playerID = '" + userid + "'";
// 		rs = stmt.executeQuery(sql);
// 		if (rs.next() == true) {
// 			rt_msg = userid + "은(는) 사용중인 아이디 입니다.";
// 			session.setAttribute("rt_msg", rt_msg);
// 			String url = request.getHeader("referer");
// 			response.sendRedirect(url);
// 		}
// 		else if (userid.length() != 5){
// 			rt_msg = "아이디 형식이 맞지 않습니다.";
// 			session.setAttribute("rt_msg", rt_msg);
// 			String url = request.getHeader("referer");
// 			response.sendRedirect(url);
// 		}
		try {
			sql = "INSERT INTO PLAYER(PlayerID, Password, Name, Membership, Birthday, Sex, Email, PhoneNumber) VALUES ('" 
					+ userid + "', '" + password + "', '" + nickname + "', '" + "0" + "', TO_DATE('" + birthday + "', 'yyyy-mm-dd'), '" + sex + "', '"
					+ email + "', '" + phone + "')";
			PreparedStatement st = conn.prepareStatement(sql);
			int res = st.executeUpdate();
	        if(res == 1){
	        	response.sendRedirect("login.jsp");
// 	        	System.out.println("회원가입이 완료되었습니다. 환영합니다 "+name+" 님!");	        	
	        }else{
				String url = request.getHeader("referer");
				response.sendRedirect(url);
			}
		} catch (SQLException e) {
			e.printStackTrace();
			String url = request.getHeader("referer");
			response.sendRedirect(url);
		}

	}
	

// 	response.sendRedirect("login.jsp");

%>
