/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DTO;

/**
 *
 * @author ducdat
 */
public class ChiTietBan_DTO {

    private int id_chitiet_ban;
    private int id_ban;
    private int id_thucuong;
    private int soluong_thucuong;
    private float thanhtien;

    public ChiTietBan_DTO() {
    }

    public ChiTietBan_DTO(int id_chitiet_ban_,
            int id_ban_,
            int id_thucuong_,
            int soluong_thucuong_,
            float thanhtien_
    ) {

        id_chitiet_ban = id_chitiet_ban_;
        id_ban = id_ban_;
        id_thucuong = id_thucuong_;
        soluong_thucuong = soluong_thucuong_;
        thanhtien = thanhtien_;

    }

    /**
     * @return the id_chitiet_ban
     */
    public int getId_chitiet_ban() {
        return id_chitiet_ban;
    }

    /**
     * @param id_chitiet_ban the id_chitiet_ban to set
     */
    public void setId_chitiet_ban(int id_chitiet_ban) {
        this.id_chitiet_ban = id_chitiet_ban;
    }

    /**
     * @return the id_ban
     */
    public int getId_ban() {
        return id_ban;
    }

    /**
     * @param id_ban the id_ban to set
     */
    public void setId_ban(int id_ban) {
        this.id_ban = id_ban;
    }

    /**
     * @return the id_thucuong
     */
    public int getId_thucuong() {
        return id_thucuong;
    }

    /**
     * @param id_thucuong the id_thucuong to set
     */
    public void setId_thucuong(int id_thucuong) {
        this.id_thucuong = id_thucuong;
    }

    /**
     * @return the soluong_thucuong
     */
    public int getSoluong_thucuong() {
        return soluong_thucuong;
    }

    /**
     * @param soluong_thucuong the soluong_thucuong to set
     */
    public void setSoluong_thucuong(int soluong_thucuong) {
        this.soluong_thucuong = soluong_thucuong;
    }

    /**
     * @return the thanhtien
     */
    public float getThanhtien() {
        return thanhtien;
    }

    /**
     * @param thanhtien the thanhtien to set
     */
    public void setThanhtien(float thanhtien) {
        this.thanhtien = thanhtien;
    }

}
