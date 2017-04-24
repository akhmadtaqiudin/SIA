<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:include page="/pages/template/home.jsp" />
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>SIA</title>
    </head>
    <body>
        <div class="main">
            <h1>Tambah User Baru</h1>  
            <form action="${pageContext.request.contextPath}/pages/modul/akun/proses.jsp" method="post">  
                <table>  
                    <tr>
                        <td>User Name </td>
                        <td>:</td>
                        <td><input type="text" name="userName"/></td>
                    </tr>  
                    <tr>
                        <td>Password </td>
                        <td>:</td>
                        <td><input type="password" name="password"/></td>
                    </tr>  
                    <tr>
                        <td>Nama Lengkap </td>
                        <td>:</td>
                        <td><input type="text" name="namaLengkap"/></td>
                    </tr>  
                    <tr>
                        <td>Hak Akses </td>
                        <td>:</td>
                        <td>
                            <select name="hakAkses" style="width:155px">  
                                <option>Admin</option>  
                                <option>User</option>   
                            </select>  
                        </td>
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
