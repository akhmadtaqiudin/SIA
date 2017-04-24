<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <!-- fungsi untuk memanggil file css dan file javascript-->
        <link rel="stylesheet" href="${pageContext.request.contextPath}/conten/style.css" />
        <link rel="stylesheet" href="${pageContext.request.contextPath}/conten/jquery-ui.min.css" />
        <link rel="stylesheet" href="${pageContext.request.contextPath}/conten/jquery-ui.theme.min.css" />
        <script src="${pageContext.request.contextPath}/conten/jquery-3.1.0.min.js"></script>
        <script src="${pageContext.request.contextPath}/conten/jquery-ui.min.js"></script>
        <title>JSP Page</title>
    </head>
    <body>
        <div class="header">
            <div class="info">
                <h1>Sistem Informasi Akuntansi</h1>
                <h4>Binsa Sarana Informatika</h4>
                Jl. Nanti di atur lagi
            </div>
            <img alt="loading" src="${pageContext.request.contextPath}/conten/logo.png">
        </div>
        <div class="nav">
            <ul>
                <li><a href="${pageContext.request.contextPath}/index.jsp">HOME</a></li>
                <li><a href="${pageContext.request.contextPath}/pages/template/about.jsp">ABOUT</a></li>
                <li><a href="#">LOGOUT</a></li>
            </ul>
        </div>
        <div class="aside">
            <h3>Master Data</h3>
            <ul>
                <li><a href="#">Akun</a></li>
                <li><a href="#">Saldo Awal</a></li>
                <li><a href="${pageContext.request.contextPath}/pages/modul/akun/indexAkun.jsp">User</a></li>
                <li><a href="${pageContext.request.contextPath}/pages/modul/periode/indexPeriode.jsp">Periode Akuntansi</a></li>
            </ul>
            <h3>Transaksi</h3>
            <ul>
                <li><a href="${pageContext.request.contextPath}/pages/modul/kas/indexKasMasuk.jsp">Kas Masuk</a></li>
                <li><a href="${pageContext.request.contextPath}/pages/modul/kas/indexKasKeluar.jsp">Kas Keluar</a></li>
                <li><a href="#">Jurnal Umum</a></li>
            </ul>
            <h3>Informasi Data</h3>
            <ul>
                <li><a href="#">Informasi Akun</a></li>
                <li><a href="#">Informasi User</a></li>
                <li><a href="#">Informasi Kas Keluar</a></li>
                <li><a href="#">Informasi Kas Masuk</a></li>
                <li><a href="#">Data Jurnal Umum</a></li>
            </ul>
        </div>
    </body>
</html>
