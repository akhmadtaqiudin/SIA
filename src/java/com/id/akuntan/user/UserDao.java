package com.id.akuntan.user;

import com.id.akuntan.connection.Koneksi;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;


public class UserDao {  
  
    /*
    * class DAO adalah class yang berhubungan dengan database
    * di class inilah fungsi-fungsi untuk menyimpan, merubah, menghapus
    * dan menampilkan data
    */ 
    
    //fungsi simpan data atau tambah data
    public static int save(User u){  
        int status=0;  
        try{  
            //membuka koneksi
            Connection con=Koneksi.openConnection();
            //melakukan query database
            PreparedStatement ps=con.prepareStatement(  
    "insert into t_user(user_name,nama_lengkap,password,hak_akses) values(?,?,?,?)");  
            ps.setString(1,u.getUserName());  
            ps.setString(2,u.getNamaLengkap());  
            ps.setString(3,u.getPassword());  
            ps.setString(4,u.getHakAkses());    
            status=ps.executeUpdate();  
        }catch(Exception e){
            System.out.println(e);
        }  
        return status;  
    }  
    //fungsi untuk merubah data
    public static int update(User u){  
        int status=0;  
        try{  
            //membuka koneksi
            Connection con=Koneksi.openConnection();
            //melakukan query database untuk merubah data berdasarkan id atau primary key
            PreparedStatement ps=con.prepareStatement(  
    "update t_user set user_name=?,nama_lengkap=?,password=?,hak_akses=? where id=?");  
            ps.setString(1,u.getUserName());  
            ps.setString(2,u.getNamaLengkap());  
            ps.setString(3,u.getPassword());  
            ps.setString(4,u.getHakAkses());    
            ps.setInt(5,u.getId());  
            status=ps.executeUpdate();  
        }catch(Exception e){System.out.println(e);}  
        return status;  
    }  
    //fungsi untuk menghapus data
    public static int delete(User u){  
        int status=0;  
        try{  
            //membuka koneksi
            Connection con=Koneksi.openConnection();  
            //melakukan query database untuk menghapus data berdasarkan id atau primary key
            PreparedStatement ps=con.prepareStatement("delete from t_user where id=?");  
            ps.setInt(1,u.getId());  
            status=ps.executeUpdate();  
        }catch(Exception e){System.out.println(e);}  

        return status;  
    }  
    //fungsi untuk menampilkan data
    public static User getRecordById(int id){  
        User u=null;  
        try{  
            //membuka koneksi
            Connection con=Koneksi.openConnection(); 
            //melakukan query database untuk menampilkan data berdasarkan id atau primary key
            PreparedStatement ps=con.prepareStatement("select * from t_user where id=?");  
            ps.setInt(1,id);  
            ResultSet rs=ps.executeQuery();  
            while(rs.next()){  
                u=new User();  
                u.setId(rs.getInt("id"));  
                u.setUserName(rs.getString("user_name"));  
                u.setNamaLengkap(rs.getString("nama_lengkap"));  
                u.setPassword(rs.getString("password"));  
                u.setHakAkses(rs.getString("hak_akses"));
            }  
        }catch(Exception e){System.out.println(e);}  
        return u;  
    }  
}  
