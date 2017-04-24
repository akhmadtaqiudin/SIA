<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="com.id.akuntan.periode.PeriodeDao"%>
<%@page import="com.id.akuntan.periode.Periode"%>
<jsp:include page="/pages/template/home.jsp" />
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>SIA</title>
    </head>
    <body>
        <div class="main">
            <h1>Ubah Periode</h1>
            <%  
            String id=request.getParameter("id");  
            Periode p = PeriodeDao.getRecordById(Integer.parseInt(id));  
            %>
            <form action="${pageContext.request.contextPath}/pages/modul/periode/edit.jsp" method="post">  
                <input type="hidden" name="id" value="<%=p.getId() %>"/>
                <table>  
                    <tr>
                        <td>Tahun Periode </td>
                        <td>:</td>
                        <td><input type="text" name="tahun" value="<%=p.getTahun() %>"/></td>
                    </tr>  
                    <tr>
                        <td>Awal Bulan Periode </td>
                        <td>:</td>
                        <td><input type="text" name="awal" value="<%=p.getAwal() %>"/></td>
                    </tr>  
                    <tr>
                        <td>Akhir Bulan Periode </td>
                        <td>:</td>
                        <td><input type="text" name="akhir" value="<%=p.getAkhir() %>"/></td>
                    </tr>
                    <tr>
                        <td>Status </td>
                        <td>:</td>
                        <td>
                            <% if(p.getStatus().equalsIgnoreCase("Aktif")) { %>
                                <input type="radio" name="status" value="Aktif" />Aktif
                                <input type="radio" name="status" value="Non Aktif"/>Non Aktif
                            <% }else { %>
                                <input type="radio" name="status" value="Aktif" />Aktif
                                <input type="radio" name="status" value="Non Aktif"/>Non Aktif
                            <% } %>
                        </td>
                    </tr>  
                    <tr>
                        <td></td>
                        <td></td>
                        <td>
                            <button type="submit" class="btn-save">Ubah Periode</button>
                        </td>
                    </tr>  
                </table>  
            </form>
        </div>
    </body>
</html>
