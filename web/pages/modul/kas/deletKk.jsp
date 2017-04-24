<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!-- memanggil class KasKeluar dan kasKeluarDao pada java-->
<%@page import="com.id.akuntan.kas.KasKeluarDao"%>
<jsp:useBean id="kk" class="com.id.akuntan.kas.KasKeluar"></jsp:useBean>  
<jsp:setProperty property="*" name="kk"/>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>SIA</title>
    </head>
    <body>
        <% 
        //menggunakan fungsi hapus yang sudah di buat pada class DAO
        KasKeluarDao.delete(kk);
        // fungsi untuk mengarah ke index
        response.sendRedirect("indexKasKeluar.jsp");  
        %>
    </body>
</html>
