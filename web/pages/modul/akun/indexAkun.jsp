<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.sql.SQLException" %>
<%@ page import="java.sql.Statement" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.DriverManager" %>
<jsp:include page="/pages/template/home.jsp" />
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>SIA</title>
        <script type="text/javascript">
            $(document).ready(function(){
              $(".del").click(function(){
                if (!confirm("Apakah anda yakin ingin hapus file tersebut")){
                  return false;
                }
              });
            });
        </script>
    </head>
    <body>  
        <div class="main">
            <h1>Data User</h1></br>
            <%  
                String cari = "";
                if(request.getParameter("user_name") != null) {
                cari = request.getParameter("user_name");
                }
            %> 
            <a class="btn-add" href="${pageContext.request.contextPath}/pages/modul/akun/addAkun.jsp">Tambah User Baru</a>
            <form method="get" action="${pageContext.request.contextPath}/pages/modul/akun/indexAkun.jsp">
                <table class="search" id="akun">
                    <tr>
                        <th>Cari Data User
                            <input name="user_name" type="text" value="<%=cari%>">
                            <input type="submit" value="Search">
                            <input type="reset" value="Reset">
                        </th>
                    </tr>
                </table>
            </form>
            <%
                 Connection connect = null;
                 Statement s = null;
                 try {

                 Class.forName("com.mysql.jdbc.Driver");
                 connect =  DriverManager.getConnection("jdbc:mysql://localhost:3306/akuntan","root","");
                 s = connect.createStatement();
                 String sql = "SELECT * FROM  t_user WHERE user_name like '%" +  cari + "%'  ORDER BY user_name ASC";
                 System.out.println(sql);
                 ResultSet rs = s.executeQuery(sql);
             %>
            <table class="view">  
                <tr>
                    <th>Username</th>
                    <th>Nama Lengkap</th>
                    <th>Hak Akses</th>  
                    <th>Action</th>
                </tr>
                </tr>  
                <%while((rs!=null) && (rs.next())) { %>
                 <tr>
                     <td><%=rs.getString("user_name")%></td>
                     <td><%=rs.getString("nama_lengkap")%></td>
                     <td><%=rs.getString("hak_akses")%></td>
                     <td>
                        <a class="btn-edit" href="${pageContext.request.contextPath}/pages/modul/akun/editAkun.jsp?id=<%=rs.getString("id")%>">Ubah</a> <b>|</b>   
                        <a class="del" href="${pageContext.request.contextPath}/pages/modul/akun/delet.jsp?id=<%=rs.getString("id")%>">Hapus</a>
                     </td>
                 </tr>
                 <%}%>
             </table>
            <%  
                 } catch (Exception e) {
                     out.println(e.getMessage());
                     e.printStackTrace();
                 }
                 try {
                     if(s!=null){
                     s.close();
                     connect.close();
                     }
                 } catch (SQLException e) {
                     out.println(e.getMessage());
                     e.printStackTrace();
                 }
             %>
        </div>
    </body>
</html>
