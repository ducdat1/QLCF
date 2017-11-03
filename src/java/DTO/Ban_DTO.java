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
    private int id_customer;
    private int trangthai;
    private float tongtien;
    private int payment;
    private String createdate;
    
    public Ban_DTO(){}
    public Ban_DTO(int id_ban_,
                   int id_customer_,
                   int trangthai_,
                   float tongtien_,
                   int payment_,
                   String createdate_
                  )
    {
     id_ban=id_ban_;
     id_customer=id_customer_;
     trangthai=trangthai_;
     tongtien=tongtien_ ;   
     payment=payment_;
     createdate=createdate_;
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
    
    /**
     * @return the id_customer
     */
    public int getId_customer() {
        return id_customer;
    }

    /**
     * @param id_customer the id_customer to set
     */
    public void setId_customer(int id_customer) {
        this.id_customer = id_customer;
    }
    
    /**
     * @return the payment
     */
    public int getPayment() {
        return payment;
    }

    /**
     * @param payment the payment to set
     */
    public void setPayment(int payment) {
        this.payment = payment;
    }
    
    /**
     * @return the createdate
     */
    public String getCreatedate() {
        return createdate;
    }

    /**
     * @param createdate the createdate to set
     */
    public void setCreatedate(String createdate) {
        this.createdate = createdate;
    }
}
