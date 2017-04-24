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
            <h1>Data Periode</h1></br>
            <%
                 String keyword = "";
                 if(request.getParameter("tahun") != null) {
                 keyword = request.getParameter("tahun");
                 }
             %>
             <a class="btn-add" href="${pageContext.request.contextPath}/pages/modul/periode/addPeriode.jsp">Tambah Periode</a>
             <form method="get" action="${pageContext.request.contextPath}/pages/modul/periode/indexPeriode.jsp">
                 <table class="search">
                     <tr>
                         <th>Cari Data Periode
                             <input name="tahun" type="text" value="<%=keyword%>">
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
                 String sql = "SELECT * FROM  periode WHERE tahun like '%" +  keyword + "%'  ORDER BY tahun ASC";
                 System.out.println(sql);
                 ResultSet rs = s.executeQuery(sql);
             %>
             <table class="view" id="periode">
                 <tr>
                     <th>Tahun</th>
                     <th>Awal</th>
                     <th>Akhir</th>
                     <th>Status</th>
                     <th>Action</th>
                 </tr>  
                 <%while((rs!=null) && (rs.next())) { %>
                 <tr>
                     <td><%=rs.getString("tahun")%></td>
                     <td><%=rs.getString("awal")%></td>
                     <td><%=rs.getString("akhir")%></td>
                     <td><%=rs.getString("status")%></td>
                     <td>
                         <a class="btn-edit" href="${pageContext.request.contextPath}/pages/modul/periode/editPeriode.jsp?id=<%=rs.getString("id")%>">Ubah</a> <b>|</b>   
                         <a class="del" href="${pageContext.request.contextPath}/pages/modul/periode/delet.jsp?id=<%=rs.getString("id")%>">Hapus</a>
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
