<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="com.id.akuntan.periode.PeriodeDao"%>
<jsp:useBean id="p" class="com.id.akuntan.periode.Periode"></jsp:useBean>  
<jsp:setProperty property="*" name="p"/>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>SIA</title>
    </head>
    <body>
        <%  
        PeriodeDao.delete(p);  
        response.sendRedirect("indexPeriode.jsp");  
        %>
    </body>
</html>
