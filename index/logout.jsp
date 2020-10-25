<%
  session.invalidate();
  response.sendRedirect(request.getContextPath()+"/index/login.jsp");
 %>
