<%
  session.invalidate();
  response.sendRedirect(request.getContextPath()+"/admin/login/login.jsp");
%>