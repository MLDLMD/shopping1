<%@page  import="edu.jmi.shop.bean.*,edu.jmi.shop.dao.*" %>
<%
	Object o = session.getAttribute("user");
	if (o != null) {
		return;
	}
	Cookie[] cookies = request.getCookies();
	String userName = null;
	String password = null;
	if (cookies==null)
		return;
	for (Cookie cookie : cookies) {
		if (cookie.getName().equals("username")) {
			userName = cookie.getValue();
		} else if (cookie.getName().equals("password")) {
			password = cookie.getValue();
		}
	}

	if (userName == null || password == null) {
		return;
	}
	UserDAO userDAO = new UserDAO();
	User user = userDAO.selectByName(userName);
	if (user == null) {
		return;
	}
	if (user.getPwd().equals(password) == false) {
		return;
	}
	if ("ROLE_GUEST".equals(user.getRole())==false){
		return;
	}
	session.setAttribute("user", user);
%>