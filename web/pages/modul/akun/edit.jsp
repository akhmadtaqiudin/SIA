<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="com.id.akuntan.user.UserDao"%>
<jsp:useBean id="u" class="com.id.akuntan.user.User"></jsp:useBean>  
<jsp:setProperty property="*" name="u"/>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>SIA</title>
    </head>
    <body>
        <%  
        int i=UserDao.update(u);  
        response.sendRedirect("indexAkun.jsp");  
        %>
    </body>
</html>
