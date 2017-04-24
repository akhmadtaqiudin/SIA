<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!-- memanggil java sql spri koneksi dan tang lain-->
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
            //fungsi untuk konfirmasi ketika klik button delet
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
            <h1>Data Kas Keluar</h1></br>
            <%
                // membuat variabel untuk pencarian
                 String cari = "";
                 if(request.getParameter("no_kk") != null) {
                 cari = request.getParameter("no_kk");
                 }
             %>
             <a class="btn-add" href="${pageContext.request.contextPath}/pages/modul/kas/addKasKeluar.jsp">Tambah Kas Keluar</a>
             <form method="get" action="${pageContext.request.contextPath}/pages/modul/kas/indexKasKeluar.jsp">
                 <table class="kas">
                     <tr>
                         <th>Cari Data Kas Keluar
                             <input name="no_kk" type="text" value="<%=cari%>">
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
                    //membuat koneksi  
                 Class.forName("com.mysql.jdbc.Driver");
                 connect =  DriverManager.getConnection("jdbc:mysql://localhost:3306/akuntan","root","");
                 s = connect.createStatement();
                 //query untuk mencari data pada database
                 String sql = "SELECT * FROM  kas_out WHERE no_kk like '%" +  cari + "%'  ORDER BY no_kk ASC";
                 System.out.println(sql);
                 ResultSet rs = s.executeQuery(sql);
             %>
             <table class="view" id="kas">
                 <tr>
                     <th>No Kas Keluar</th>
                     <th>Tanggal Kas Keluar</th>
                     <th>Memo</th>
                     <th>Akun</th>
                     <th>Nominal</th>
                     <th>Action</th>
                 </tr>  
                 <%while((rs!=null) && (rs.next())) { %>
                 <tr>
                     <td><%=rs.getString("no_kk")%></td>
                     <td><%=rs.getString("tanggal")%></td>
                     <td><%=rs.getString("keterangan")%></td>
                     <td><%=rs.getString("akun_kas")%></td>
                     <td><%=rs.getDouble("nominal")%></td>
                     <td>
                        <a class="del" href="${pageContext.request.contextPath}/pages/modul/kas/deletKk.jsp?kk=<%=rs.getString("no_kk")%>">Hapus</a>
                     </td>
                 </tr>
                 <%}%>
             </table>     

             <%  //blok untuk menghindari error
                 } catch (Exception e) {
                     out.println(e.getMessage());
                     e.printStackTrace();
                 }
                 try {
                    //pengecekan statement, bila bernilai kosong maka tutup atau keluar 
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
