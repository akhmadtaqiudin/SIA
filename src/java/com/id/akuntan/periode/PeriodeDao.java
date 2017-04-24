package com.id.akuntan.periode;

import com.id.akuntan.connection.Koneksi;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class PeriodeDao {
  
    /*
    * class DAO adalah class yang berhubungan dengan database
    * di class inilah fungsi-fungsi untuk menyimpan, merubah, menghapus
    * dan menampilkan data
    */ 
    
    //fungsi simpan data atau tambah data
    public static int save(Periode p){  
        int status=0;  
        try{  
             //membuka koneksi
            Connection con=Koneksi.openConnection();
            //melakukan query database
            PreparedStatement ps=con.prepareStatement(  
    "insert into periode(tahun, awal, akhir) values(?,?,?)");  
            ps.setString(1,p.getTahun());  
            ps.setString(2,p.getAwal());  
            ps.setString(3,p.getAkhir());    
            status=ps.executeUpdate();  
        }catch(Exception e){
            System.out.println(e);
        }  
        return status;  
    }  
    //fungsi untuk merubah data
    public static int update(Periode p){  
        int status=0;  
        try{  
            //membuka koneksi
            Connection con=Koneksi.openConnection();
            //melakukan query database untuk merubah data berdasarkan id atau primary key
            PreparedStatement ps=con.prepareStatement(  
    "update periode set tahun=?, awal=?, akhir=?, status=? where id=?");  
            ps.setString(1,p.getTahun());  
            ps.setString(2,p.getAwal());  
            ps.setString(3,p.getAkhir());  
            ps.setString(4,p.getStatus()); 
            ps.setInt(5,p.getId());  
            status=ps.executeUpdate();  
        }catch(Exception e){System.out.println(e);}  
        return status;  
    }
    //fungsi untuk menghapus data
    public static int delete(Periode p){  
        int status=0;  
        try{  
            //membuka koneksi
            Connection con=Koneksi.openConnection();  
            //melakukan query database untuk menghapus data berdasarkan id atau primary key
            PreparedStatement ps=con.prepareStatement("delete from periode where id=?");  
            ps.setInt(1,p.getId());  
            status=ps.executeUpdate();  
        }catch(Exception e){System.out.println(e);}  

        return status;  
    } 
    //fungsi untuk menampilkan data
    public static Periode getRecordById(int id){  
        Periode p=null;  
        try{  
            //membuka koneksi
            Connection con=Koneksi.openConnection(); 
            //melakukan query database untuk menampilkan data berdasarkan id atau primary key 
            PreparedStatement ps=con.prepareStatement("select * from periode where id=?");  
            ps.setInt(1,id);  
            ResultSet rs=ps.executeQuery();  
            while(rs.next()){  
                p = new Periode();  
                p.setId(rs.getInt("id"));  
                p.setTahun(rs.getString("tahun"));  
                p.setAwal(rs.getString("awal"));  
                p.setAkhir(rs.getString("akhir"));
                p.setStatus(rs.getString("status"));
            }  
        }catch(Exception e){System.out.println(e);}  
        return p;  
    }  
}  
