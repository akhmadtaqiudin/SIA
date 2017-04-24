package com.id.akuntan.kas;

/*
 * class Kas Masuk adalah class yang mempresentasikan nilai pada database
 * 
 */
public class KasMasuk {
    
    private String noKasMasuk;
    private String akunDebit;
    private String tanggal;
    private String keterangan;
    private String akunKas;
    private Double nominal;

    public String getNoKasMasuk() {
        return noKasMasuk;
    }

    public void setNoKasMasuk(String noKasMasuk) {
        this.noKasMasuk = noKasMasuk;
    }

    public String getAkunDebit() {
        return akunDebit;
    }

    public void setAkunDebit(String akunDebit) {
        this.akunDebit = akunDebit;
    }

    public String getTanggal() {
        return tanggal;
    }

    public void setTanggal(String tanggal) {
        this.tanggal = tanggal;
    }

    public String getKeterangan() {
        return keterangan;
    }

    public void setKeterangan(String keterangan) {
        this.keterangan = keterangan;
    }

    public String getAkunKas() {
        return akunKas;
    }

    public void setAkunKas(String akunKas) {
        this.akunKas = akunKas;
    }

    public Double getNominal() {
        return nominal;
    }

    public void setNominal(Double nominal) {
        this.nominal = nominal;
    }
}
