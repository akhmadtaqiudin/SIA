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
<%  //menggunakan fungsi simpan yang sudah di buat pada class DAO
int i = KasKeluarDao.save(kk);
//melakukan pengecekan, jika berhasil maka akan diarahkan ke halaman index
// jika gagal atau error makan akan berada tetep di halaman tambah
if(i>0){
    //fungsi berhasil 
response.sendRedirect("indexKasKeluar.jsp");  
}else{  
    //fungsi gagal
response.sendRedirect("addKasKeluar.jsp");  
}  
%>  
    </body>
</html>
