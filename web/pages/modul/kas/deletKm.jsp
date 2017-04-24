<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!-- memanggil class KasMasuk dan kasMasukDao pada java-->
<%@page import="com.id.akuntan.kas.KasMasukDao"%>
<jsp:useBean id="km" class="com.id.akuntan.kas.KasMasuk"></jsp:useBean>  
<jsp:setProperty property="*" name="km"/>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>SIA</title>
    </head>
    <body>
        <%  
        //menggunakan fungsi hapus yang sudah di buat pada class DAO
        KasMasukDao.delete(km); 
        // fungsi untuk mengarah ke index
        response.sendRedirect("indexKasMasuk.jsp");  
        %>
    </body>
</html>
