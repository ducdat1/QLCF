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
public class NguoiDung_DTO {
    private int id_customer;
    private String firstname;
    private String lastname;
    private String cus_email;
    private String cus_account;
    private String cus_password;
    private String cus_address;
    private String cus_phone;
    private String plus ;
    private int point_sum;
        
    public NguoiDung_DTO(){}
    public NguoiDung_DTO( int id_customer_,String cus_email_,String cus_account_,String cus_address_,
                        String cus_phone_,String plus_,int point_sum_ )
    {
        id_customer  = id_customer_;
        cus_email    = cus_email_;
        cus_account  = cus_account_;
        cus_address  = cus_address_;
        cus_phone    = cus_phone_;
        plus         = plus_;
        point_sum    = point_sum_;
    }
    public NguoiDung_DTO(int id_customer_,String firstname_,String lastname_,String cus_email_,
                        String cus_account_,String cus_password_,String cus_address_,String cus_phone_,
                        String plus_,int point_sum_
    )
    {
        id_customer  = id_customer_;
        firstname    = firstname_;
        lastname     = lastname_ ;
        cus_email    = cus_email_;
        cus_account  = cus_account_;
        cus_password = cus_password_;
        cus_address  = cus_address_;
        cus_phone    = cus_phone_;
        plus         = plus_;
        point_sum    = point_sum_;
    }

    /**
     * @return the id_customer_
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
     * @return the firstname
     */
    public String getFirstname() {
        return firstname;
    }

    /**
     * @param firstname the firstname to set
     */
    public void setFirstname(String firstname) {
        this.firstname = firstname;
    }

    /**
     * @return the lastname
     */
    public String getLastname() {
        return lastname;
    }

    /**
     * @param lastname the lastname to set
     */
    public void setLastname(String lastname) {
        this.lastname = lastname;
    }
    
    /**
     * @return the cus_email
     */
    public String getCus_email() {
        return cus_email;
    }

    /**
     * @param cus_email the cus_email to set
     */
    public void setCus_email(String cus_email) {
        this.cus_email = cus_email;
    }
    
    /**
     * @return the cus_account
     */
    public String getCus_account() {
        return cus_account;
    }

    /**
     * @param cus_account the cus_account to set
     */
    public void setCus_account(String cus_account) {
        this.cus_account = cus_account;
    }
    
    /**
     * @return the cus_password
     */
    public String getCus_password() {
        return cus_password;
    }

    /**
     * @param cus_password the cus_password to set
     */
    public void setCus_password(String cus_password) {
        this.cus_password = cus_password;
    }
    
    /**
     * @return the cus_address
     */
    public String getCus_address() {
        return cus_address;
    }

    /**
     * @param cus_address the cus_address to set
     */
    public void setCus_address(String cus_address) {
        this.cus_address = cus_address;
    }
    
    /**
     * @return the cus_phone
     */
    public String getCus_phone() {
        return cus_phone;
    }

    /**
     * @param cus_phone the cus_phone to set
     */
    public void setCus_phone(String cus_phone) {
        this.cus_phone = cus_phone;
    }
    
    /**
     * @return the plus
     */
    public String getPlus() {
        return plus;
    }

    /**
     * @param plus the plus to set
     */
    public void setPlus(String plus) {
        this.plus = plus;
    }
    
    /**
     * @return the point_sum
     */
    public int getPoint_sum() {
        return point_sum;
    }

    /**
     * @param point_sum the point_sum to set
     */
    public void setPoint_sum(int point_sum) {
        this.point_sum = point_sum;
    }
}