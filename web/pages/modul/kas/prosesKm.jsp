<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!-- memanggil class KasMasuk dan KasMasukDao pada java-->
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
    //menggunakan fungsi simpan yang sudah di buat pada class DAO
int i = KasMasukDao.save(km);
//melakukan pengecekan, jika berhasil maka akan diarahkan ke halaman index
// jika gagal atau error makan akan berada tetep di halaman tambah
if(i>0){
    //fungsi berhasil
response.sendRedirect("indexKasMasuk.jsp");  
}else{  
    //fungsi gagal
response.sendRedirect("addKasMasuk.jsp");  
}  
%>  
    </body>
</html>
