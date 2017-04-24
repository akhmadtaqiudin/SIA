<%@page import="com.id.akuntan.user.UserDao"%>
<%@page import="com.id.akuntan.user.User"%>
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
            <h1>Ubah User</h1>
            <%  
            String id=request.getParameter("id");  
            User u=UserDao.getRecordById(Integer.parseInt(id));  
            %>
            <form action="${pageContext.request.contextPath}/pages/modul/akun/edit.jsp" method="post">  
                <input type="hidden" name="id" value="<%=u.getId() %>"/>
                <table>  
                    <tr>
                        <td>User Name </td>
                        <td>:</td>
                        <td><input type="text" name="userName" value="<%=u.getUserName() %>"/></td>
                    </tr>  
                    <tr>
                        <td>Password </td>
                        <td>:</td>
                        <td><input type="password" name="password" value="<%=u.getPassword() %>"/></td>
                    </tr>  
                    <tr>
                        <td>Nama Lengkap </td>
                        <td>:</td>
                        <td><input type="text" name="namaLengkap" value="<%=u.getNamaLengkap() %>"/></td>
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
                            <button type="submit" class="btn-save">Ubah User</button>
                        </td>
                    </tr>  
                </table>  
            </form>
        </div>
    </body>
</html>
