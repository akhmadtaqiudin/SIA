package com.id.akuntan.connection;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 * class ini adalah class untuk koneksi atau menyambungan ke database
 * 
 */
public class Koneksi {
    
    //url atau alamat database
    private static String url  = "jdbc:mysql://localhost:3306/akuntan";
    //user pada database
    private static String user = "root";
    //password pada database
    private static String pass = "";
    //fungsi untuk koneksi
    private static Connection connection;
    
    //method atau fungsi untuk membuka koneksi
    public static Connection openConnection(){
        try {
            //setingan default pada mysql
            Class.forName("com.mysql.jdbc.Driver");
            connection = DriverManager.getConnection(url, user, pass);
        } catch (SQLException e) {
            System.out.println(e);
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(Koneksi.class.getName()).log(Level.SEVERE, null, ex);
        }
        //mengembalikan niai koneksi
        return connection;
    }
}
