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
public class Ban_DTO {
    private int id_ban;
    private int trangthai;
    private float tongtien;
    
    public Ban_DTO(){}
    public Ban_DTO(int id_ban_,
    int trangthai_,
    float tongtien_
    )
    {
     id_ban=id_ban_;
     trangthai=trangthai_;
     tongtien=tongtien_ ;   }

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
     * @return the trangthai
     */
    public int getTrangthai() {
        return trangthai;
    }

    /**
     * @param trangthai the trangthai to set
     */
    public void setTrangthai(int trangthai) {
        this.trangthai = trangthai;
    }

    /**
     * @return the tongtien
     */
    public float getTongtien() {
        return tongtien;
    }

    /**
     * @param tongtien the tongtien to set
     */
    public void setTongtien(float tongtien) {
        this.tongtien = tongtien;
   
    }
    
}
