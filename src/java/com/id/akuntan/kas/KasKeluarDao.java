package com.id.akuntan.kas;

import com.id.akuntan.connection.Koneksi;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class KasKeluarDao {
    
    /*
    * class DAO adalah class yang berhubungan dengan database
    * di class inilah fungsi-fungsi untuk menyimpan, merubah, menghapus
    * dan menampilkan data
    */ 
    
    //fungsi simpan data atau tambah data
    public static int save(KasKeluar kk){  
        int status=0;  
        try{  
             //membuka koneksi
            Connection con=Koneksi.openConnection();
            //melakukan query database
            PreparedStatement ps=con.prepareStatement(  
    "insert into kas_out(no_kk, akun_debit, tanggal, keterangan, akun_kas, nominal) values(?,?,?,?,?,?)");  
            ps.setString(1,kk.getNoKasKeluar());  
            ps.setString(2,kk.getAkunDebit());  
            ps.setString(3,kk.getTanggal());
            ps.setString(4,kk.getKeterangan());  
            ps.setString(5,kk.getAkunKas());  
            ps.setDouble(6,kk.getNominal());
            status=ps.executeUpdate();  
        }catch(Exception e){
            System.out.println(e);
        }  
        return status;  
    }  
    //fungsi untuk merubah data
    public static int update(KasKeluar kk){  
        int status=0;  
        try{  
            //membuka koneksi
            Connection con=Koneksi.openConnection();
            //melakukan query database untuk merubah data berdasarkan id atau primary key
            PreparedStatement ps=con.prepareStatement(  
    "update kas_out set akun_debit=?, tanggal=?, keterangan=?, akun_kas=?, nominal=? where no_kk=?");  
            ps.setString(1,kk.getAkunDebit());  
            ps.setString(2,kk.getTanggal());
            ps.setString(3,kk.getKeterangan());  
            ps.setString(4,kk.getAkunKas());  
            ps.setDouble(5,kk.getNominal()); 
            ps.setString(6,kk.getNoKasKeluar());
            status=ps.executeUpdate();  
        }catch(Exception e){System.out.println(e);}  
        return status;  
    }  
    //fungsi untuk menghapus data
    public static int delete(KasKeluar kk){  
        int status=0;  
        try{  
            //membuka koneksi
            Connection con=Koneksi.openConnection();  
            //melakukan query database untuk menghapus data berdasarkan id atau primary key 
            PreparedStatement ps=con.prepareStatement("delete from kas_out where no_kk=?");  
            ps.setString(1, kk.getNoKasKeluar());
            status=ps.executeUpdate();  
        }catch(Exception e){System.out.println(e);}  

        return status;  
    }
    //fungsi untuk menampilkan data
    public static KasKeluar getRecordById(int no_kk){  
        KasKeluar kk=null;  
        try{  
            //membuka koneksi
            Connection con=Koneksi.openConnection(); 
            //melakukan query database untuk menampilkan data berdasarkan id atau primary key  
            PreparedStatement ps=con.prepareStatement("select * from kas_out where no_kk=?");  
            ps.setString(1, kk.getNoKasKeluar());
            ResultSet rs=ps.executeQuery();  
            while(rs.next()){  
                kk = new KasKeluar();  
                kk.setNoKasKeluar(rs.getString("no_kk"));  
                kk.setAkunDebit(rs.getString("akun_debit"));  
                kk.setTanggal(rs.getString("tanggal"));  
                kk.setKeterangan(rs.getString("keterangan"));
                kk.setAkunKas(rs.getString("akun_kas"));
                kk.setNominal(rs.getDouble("nominal"));
            }  
        }catch(Exception e){System.out.println(e);}  
        return kk;  
    } 
}
