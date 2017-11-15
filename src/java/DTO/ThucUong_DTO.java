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
public class ThucUong_DTO {
    private int id_thucuong;
    private String ten_thucuong;
    private int giaban;
    private int rank;
    private String url_image;
    private String note;
    private int discount;
    private String size;
    private String extra1;
    private String extra2;
    private int gia_discount;
    private int soluong;
    
    public ThucUong_DTO(){}
    public ThucUong_DTO( int id_thucuong_, String ten_thucuong_, int giaban_,
         int rank_, String url_image_, String note_, int discount_, String size_,
         String extra1_, String extra2_
    )
    {
        id_thucuong = id_thucuong_;
        ten_thucuong= ten_thucuong_;
        giaban      = giaban_;
        rank        = rank_;
        url_image   = url_image_;
        note        = note_;
        discount    = discount_;
        size        = size_;
        extra1      = extra1_;
        extra2      = extra2_;
    }
    public ThucUong_DTO( int id_thucuong_, String ten_thucuong_, int giaban_,
         int rank_, String url_image_, String note_, int discount_, String size_,
         String extra1_, String extra2_, int gia_discount_
    )
    {
        id_thucuong = id_thucuong_;
        ten_thucuong= ten_thucuong_;
        giaban      = giaban_;
        rank        = rank_;
        url_image   = url_image_;
        note        = note_;
        discount    = discount_;
        size        = size_;
        extra1      = extra1_;
        extra2      = extra2_;
        gia_discount= gia_discount_;
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
     * @return the ten_thucuong
     */
    public String getTen_thucuong() {
        return ten_thucuong;
    }

    /**
     * @param ten_thucuong the ten_thucuong to set
     */
    public void setTen_thucuong(String ten_thucuong) {
        this.ten_thucuong = ten_thucuong;
    }

    /**
     * @return the giaban
     */
    public int getGiaban() {
        return giaban;
    }

    /**
     * @param giaban the giaban to set
     */
    public void setGiaban(int giaban) {
        this.giaban = giaban;
    }
    
    /**
     * @return the rank
     */
    public int getRank() {
        return rank;
    }

    /**
     * @param rank the rank to set
     */
    public void setRank(int rank) {
        this.rank = rank;
    }
    
    /**
     * @return the url_image
     */
    public String geturl_image() {
        return url_image;
    }

    /**
     * @param url_image the url_image to set
     */
    public void seturl_image(String url_image) {
        this.url_image = url_image;
    }
    
    /**
     * @return the discount
     */
    public int getdiscount() {
        return discount;
    }

    /**
     * @param discount the discount to set
     */
    public void setdiscout(int discount) {
        this.discount = discount;
    }
    
    /**
     * @return the note
     */
    public String getnote() {
        return note;
    }

    /**
     * @param note the note to set
     */
    public void setnote(String note) {
        this.note = note;
    }
    
    /**
     * @return the size
     */
    public String getsize() {
        return size;
    }

    /**
     * @param size the size to set
     */
    public void setsize(String size) {
        this.size = size;
    }
    /**
     * @return the extra1
     */
    public String getextra1() {
        if("null".equals(extra1) || null == extra1){
            return "";
        }
        return extra1;
    }

    /**
     * @param extra1 the extra1 to set
     */
    public void setextra1(String extra1) {
        this.extra1 = extra1;
    }
    
    /**
     * @return the extra2
     */
    public String getextra2() {
        return extra2;
    }

    /**
     * @param extra2 the extra2 to set
     */
    public void setextra2(String extra2) {
        this.extra2 = extra2;
    }
    
    /**
     * @return the gia_discount
     */
    public int getgia_discount() {
        return gia_discount;
    }

    /**
     * @param gia_discount the gia_discount to set
     */
    public void setgia_discount(int gia_discount) {
        this.gia_discount = gia_discount;
    }
    
    /**
     * @return the soluong
     */
    public int getSoluong() {
        return soluong;
    }

    /**
     * @param soluong the soluong to set
     */
    public void setSoluong(int soluong) {
        this.soluong = soluong;
    }
}
