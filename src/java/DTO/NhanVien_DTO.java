/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DTO;

import java.sql.Date;

/**
 *
 * @author ducdat
 */
public class NhanVien_DTO {

    private int id_nhanvien;
    private String tennv;
    private int giolam;
    private Date ngaysinh;
    private String sdt;
    private String diachi;
    private float luong;
    private int capdo;
    private String taikhoan;
    private String matkhau;

    public NhanVien_DTO() {
    }

    public NhanVien_DTO(int _id_nhanvien,
            String _tennv,
            int _giolam,
            Date _ngaysinh,
            String _sdt,
            String _diachi,
            float _luong,
            int _capdo,
            String _taikhoan,
            String _matkhau) {
        id_nhanvien = _id_nhanvien;
        tennv = _tennv;
        giolam = _giolam;
        ngaysinh = _ngaysinh;
        sdt = _sdt;
        diachi = _diachi;
        luong = _luong;
        capdo = _capdo;
        taikhoan = _taikhoan;
        matkhau = _matkhau;

    }

    /**
     * @return the id_nhanvien
     */
    public int getId_nhanvien() {
        return id_nhanvien;
    }

    /**
     * @param id_nhanvien the id_nhanvien to set
     */
    public void setId_nhanvien(int id_nhanvien) {
        this.id_nhanvien = id_nhanvien;
    }

    /**
     * @return the tennv
     */
    public String getTennv() {
        return tennv;
    }

    /**
     * @param tennv the tennv to set
     */
    public void setTennv(String tennv) {
        this.tennv = tennv;
    }

    /**
     * @return the giolam
     */
    public int getGiolam() {
        return giolam;
    }

    /**
     * @param giolam the giolam to set
     */
    public void setGiolam(int giolam) {
        this.giolam = giolam;
    }

    /**
     * @return the ngaysinh
     */
    public Date getNgaysinh() {
        return ngaysinh;
    }

    /**
     * @param ngaysinh the ngaysinh to set
     */
    public void setNgaysinh(Date ngaysinh) {
        this.ngaysinh = ngaysinh;
    }

    /**
     * @return the sdt
     */
    public String getSdt() {
        return sdt;
    }

    /**
     * @param sdt the sdt to set
     */
    public void setSdt(String sdt) {
        this.sdt = sdt;
    }

    /**
     * @return the diachi
     */
    public String getDiachi() {
        return diachi;
    }

    /**
     * @param diachi the diachi to set
     */
    public void setDiachi(String diachi) {
        this.diachi = diachi;
    }

    /**
     * @return the luong
     */
    public float getLuong() {
        return luong;
    }

    /**
     * @param luong the luong to set
     */
    public void setLuong(float luong) {
        this.luong = luong;
    }

    /**
     * @return the capdo
     */
    public int getCapdo() {
        return capdo;
    }

    /**
     * @param capdo the capdo to set
     */
    public void setCapdo(int capdo) {
        this.capdo = capdo;
    }

    /**
     * @return the taikhoan
     */
    public String getTaikhoan() {
        return taikhoan;
    }

    /**
     * @param taikhoan the taikhoan to set
     */
    public void setTaikhoan(String taikhoan) {
        this.taikhoan = taikhoan;
    }

    /**
     * @return the matkhau
     */
    public String getMatkhau() {
        return matkhau;
    }

    /**
     * @param matkhau the matkhau to set
     */
    public void setMatkhau(String matkhau) {
        this.matkhau = matkhau;
    }

}
