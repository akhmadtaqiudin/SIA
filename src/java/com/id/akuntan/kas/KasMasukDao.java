package com.id.akuntan.kas;

import com.id.akuntan.connection.Koneksi;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class KasMasukDao {
    
    /*
    * class DAO adalah class yang berhubungan dengan database
    * di class inilah fungsi-fungsi untuk menyimpan, merubah, menghapus
    * dan menampilkan data
    */ 
    
    //fungsi simpan data atau tambah data
    public static int save(KasMasuk km){  
        int status=0;  
        try{  
             //membuka koneksi
            Connection con=Koneksi.openConnection();
            //melakukan query database
            PreparedStatement ps=con.prepareStatement(  
    "insert into kas_in(no_km, akun_debit, tanggal, keterangan, akun_kas, nominal) values(?,?,?,?,?,?)");  
            ps.setString(1,km.getNoKasMasuk());  
            ps.setString(2,km.getAkunDebit());  
            ps.setString(3,km.getTanggal());
            ps.setString(4,km.getKeterangan());  
            ps.setString(5,km.getAkunKas());  
            ps.setDouble(6,km.getNominal());
            status=ps.executeUpdate();  
        }catch(Exception e){
            System.out.println(e);
        }  
        return status;  
    } 
    //fungsi untuk merubah data
    public static int update(KasMasuk km){  
        int status=0;  
        try{  
            //membuka koneksi
            Connection con=Koneksi.openConnection();
            //melakukan query database untuk merubah data berdasarkan id atau primary key
            PreparedStatement ps=con.prepareStatement(  
    "update kas_in set akun_debit=?, tanggal=?, keterangan=?, akun_kas=?, nominal=? where no_km=?");  
            ps.setString(1,km.getAkunDebit());  
            ps.setString(2,km.getTanggal());
            ps.setString(3,km.getKeterangan());  
            ps.setString(4,km.getAkunKas());  
            ps.setDouble(5,km.getNominal()); 
            ps.setString(6,km.getNoKasMasuk());
            status=ps.executeUpdate();  
        }catch(Exception e){System.out.println(e);}  
        return status;  
    }
    //fungsi untuk menghapus data
    public static int delete(KasMasuk km){  
        int status=0;  
        try{  
            //membuka koneksi
            Connection con=Koneksi.openConnection();  
            //melakukan query database untuk menghapus data berdasarkan id atau primary key
            PreparedStatement ps=con.prepareStatement("delete from kas_in where no_km=?");  
            ps.setString(1, km.getNoKasMasuk());
            status=ps.executeUpdate();  
        }catch(Exception e){System.out.println(e);}  

        return status;  
    } 
    //fungsi untuk menampilkan data
    public static KasMasuk getRecordById(int no_km){  
        KasMasuk km=null;  
        try{  
            //membuka koneksi
            Connection con=Koneksi.openConnection(); 
            //melakukan query database untuk menampilkan data berdasarkan id atau primary key  
            PreparedStatement ps=con.prepareStatement("select * from kas_in where no_km=?");  
            ps.setString(1, km.getNoKasMasuk());
            ResultSet rs=ps.executeQuery();  
            while(rs.next()){  
                km = new KasMasuk();  
                km.setNoKasMasuk(rs.getString("no_km"));  
                km.setAkunDebit(rs.getString("akun_debit"));  
                km.setTanggal(rs.getString("tanggal"));  
                km.setKeterangan(rs.getString("keterangan"));
                km.setAkunKas(rs.getString("akun_kas"));
                km.setNominal(rs.getDouble("nominal"));
            }  
        }catch(Exception e){System.out.println(e);}  
        return km;  
    }  
}
