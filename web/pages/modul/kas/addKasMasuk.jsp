<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!-- memanggil java sql spri koneksi dan tang lain-->
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<jsp:include page="/pages/template/home.jsp" />
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>SIA</title>
        <script>
            //fungsi untuk menampilkan tanggal
        $( function() {
          $( "#tgl" ).datepicker({ dateFormat: 'yy-mm-dd' });
        } );
        </script>
    </head>
    <body>
        <div class="main">
            <h1>Tambah Kas Masuk</h1>  
            <form action="${pageContext.request.contextPath}/pages/modul/kas/prosesKm.jsp" method="post"> 
                <table>  
                    <tr>
                        <td>No. Kas Masuk </td>
                        <td>:</td>
                        <td><input type="text" name="noKasMasuk"/></td>
                    </tr>  
                    <tr>
                        <td>Akun Debit </td>
                        <td>:</td>
                        <td>
                            <select name="akunDebit" style="width:155px">  
                                <option>11101</option>  
                                <option>11102</option>
                                <option>11103</option>  
                                <option>11104</option>
                                <option>11105</option>  
                                <option>11106</option>
                                <option>11107</option>  
                                <option>11108</option>
                                <option>11109</option>  
                                <option>11110</option>
                            </select> 
                        </td>
                    </tr>  
                    <tr>
                        <td>Tanggal </td>
                        <td>:</td>
                        <td><input type="text" name="tanggal" id="tgl"/></td>
                    </tr>
                    <tr>
                        <td>Keterangan </td>
                        <td>:</td>
                        <td><textarea type="text" name="keterangan" rows="5" cols="17"></textarea></td>
                    </tr> 
                    <tr>
                        <td>Akun Kas </td>
                        <td>:</td>
                        <td>
                            <select name="akunKas" style="width:155px">  
                                <option>11101</option>  
                                <option>11102</option>
                                <option>11103</option>  
                                <option>11104</option>
                                <option>11105</option>  
                                <option>11106</option>
                                <option>11107</option>  
                                <option>11108</option>
                                <option>11109</option>  
                                <option>11110</option>
                            </select> 
                        </td>
                    </tr>
                    <tr>
                        <td>Nominal </td>
                        <td>:</td>
                        <td><input type="text" name="nominal"/></td>
                    </tr> 
                    <tr>
                        <td></td>
                        <td></td>
                        <td>
                            <button type="submit" class="btn-save">Simpan</button>
                        </td>
                    </tr>  
                </table>  
            </form>
        </div>
    </body>
</html>
