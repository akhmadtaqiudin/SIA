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
            <h1>Tambah Periode</h1>  
            <form action="${pageContext.request.contextPath}/pages/modul/periode/proses.jsp" method="post">  
                <table>  
                    <tr>
                        <td>Tahun Periode </td>
                        <td>:</td>
                        <td><input type="text" name="tahun"/></td>
                    </tr>  
                    <tr>
                        <td>Awal Bulan Periode </td>
                        <td>:</td>
                        <td><input type="text" name="awal"/></td>
                    </tr>  
                    <tr>
                        <td>Akhir Bulan Periode </td>
                        <td>:</td>
                        <td><input type="text" name="akhir"/></td>
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
