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
    private String dc_nhan;
    private String name_payment;
    private String name_customer;
    
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
        setPayment(payment_);
        name_payment= getPayment();
        createdate=createdate_;
    }
    public Ban_DTO(int id_ban_,
                   int id_customer_,
                   int trangthai_,
                   float tongtien_,
                   String dc_nhan_,
                   int payment_,
                   String createdate_
                  )
    {
        id_ban      = id_ban_;
        id_customer = id_customer_;
        trangthai   = trangthai_;
        tongtien    = tongtien_ ;   
        dc_nhan     = dc_nhan_;
        setPayment(payment_);
        name_payment= getPayment();    
        createdate  = createdate_;
    }
    
    public Ban_DTO(int id_ban_,
                   String name_customer_,
                   int trangthai_,
                   float tongtien_,
                   String dc_nhan_,
                   int payment_,
                   String createdate_
                  )
    {
        id_ban      = id_ban_;
        name_customer = name_customer_;
        trangthai   = trangthai_;
        tongtien    = tongtien_ ;   
        dc_nhan     = dc_nhan_;
        setPayment(payment_);
        name_payment= getPayment();    
        createdate  = createdate_;
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
    public final String getPayment() {
        return name_payment;
    }

    /**
     * @param payment the payment to set
     */
    public final void setPayment(int payment) {
        switch(payment){
            case 1:
                name_payment = "Point bonus";
                break;
            case 2:
                name_payment = "Point";
                break;
            case 3:
                name_payment = "Cash";
                break;
            case 4:
                name_payment = "ATM";
                break;
            default:
                name_payment = "Visa/Master card"; 
                break;
        }
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
    
    /**
     * @return the dc_nhan
     */
    public String getDc_nhan() {
        return dc_nhan;
    }

    /**
     * @param dc_nhan the dc_nhan to set
     */
    public void setDc_nhan(String dc_nhan) {
        this.dc_nhan = dc_nhan;
    }
    
    /**
     * @return the name_customer
     */
    public String getName_Customer() {
        return name_customer;
    }
}
