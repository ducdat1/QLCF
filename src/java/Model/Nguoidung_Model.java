/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Model;

import DTO.*;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

/**
 *
 * @author ducdat
 */
public class Nguoidung_Model {
    Database db = new Database();
    Statement stm;

    public ArrayList<NguoiDung_DTO> get_all()
    {
        ArrayList<NguoiDung_DTO> list = new ArrayList<NguoiDung_DTO>();
        try
        {
            String sql = "SELECT * FROM db_customer";
            db.connect();
            stm = db.getConn().createStatement();
            ResultSet rs = stm.executeQuery(sql);
            if(rs==null)
                return null;
            else
            {
                while(rs.next())
                {
                    int id_customer     = rs.getInt("id_customer");
                    String firstname    = rs.getString("firstname");
                    String lastname     = rs.getString("lastname");
                    String cus_email    = rs.getString("cus_email");
                    String cus_account  = rs.getString("cus_account");
                    String cus_password = rs.getString("cus_password");
                    String cus_address  = rs.getString("cus_address");
                    String cus_phone    = rs.getString("cus_phone");
                    String plus         = rs.getString("plus");
                    int point_sum       = rs.getInt("point_sum");
                    
                    NguoiDung_DTO tu = new NguoiDung_DTO(id_customer,firstname,lastname,cus_email,cus_account,cus_password,cus_address,cus_phone,plus,point_sum);
                    
                    list.add(tu);
                }
                return list;
            }
        }catch(Exception e){ System.out.print(e);}
        return null;
    }
    
    public NguoiDung_DTO login(String username, String password)
    {
        //ArrayList<NhanVien_DTO> list = new ArrayList<NhanVien_DTO>();
        NguoiDung_DTO nd = null;
        try
        {
            String sql = "SELECT id_customer,cus_email,cus_account,cus_address,cus_phone,plus,point_sum"
                       + " FROM db_customer WHERE cus_account= '"+username+"' and cus_password = '"+password+"'";
            db.connect();
            stm = db.getConn().createStatement();
            ResultSet rs = stm.executeQuery(sql);
            if(rs==null)
                return null;
            while(rs.next())
                {
                    int    id_customer  = rs.getInt("id_customer");
                    String cus_email    = rs.getString("cus_email");
                    String cus_account  = rs.getString("cus_account");
                    String cus_address  = rs.getString("cus_address");
                    String cus_phone    = rs.getString("cus_phone");
                    String plus         = rs.getString("plus");
                    int    point_sum    = rs.getInt("point_sum");
                    nd = new NguoiDung_DTO(id_customer,cus_email,cus_account,cus_address,cus_phone,plus,point_sum);
                }
            
        }catch(Exception e){ System.out.print(e);}
        return nd;
    }
    
    public NguoiDung_DTO get_info(String idngdung)
    {
        try
        {
            String sql = "SELECT * FROM db_customer where id_customer='"+idngdung+"'";
            db.connect();
            stm = db.getConn().createStatement();
            ResultSet rs = stm.executeQuery(sql);
            if(rs==null)
                return null;
            else
            {
                while(rs.next())
                {
                    int id_customer     = rs.getInt("id_customer");
                    String firstname    = rs.getString("firstname");
                    String lastname     = rs.getString("lastname");
                    String cus_email    = rs.getString("cus_email");
                    String cus_account  = rs.getString("cus_account");
                    String cus_password = rs.getString("cus_password");
                    String cus_address  = rs.getString("cus_address");
                    String cus_phone    = rs.getString("cus_phone");
                    String plus         = rs.getString("plus");
                    int point_sum       = rs.getInt("point_sum");
                    NguoiDung_DTO tu = new NguoiDung_DTO(id_customer,firstname,lastname,cus_email,cus_account,cus_password,cus_address,cus_phone,plus,point_sum);
                    return tu;
                }
            }
        }catch(SQLException e){ System.out.print(e);}
        return null;
    }
    
    public boolean insert(NguoiDung_DTO tu)
    {
        String sql;
        if( tu.getCus_account().length() > 0)
        {
            sql = "insert into db_customer(firstname,lastname,cus_account,cus_password)"
                   + "values ('"+tu.getFirstname()+"','"+tu.getLastname()+"','"
                   +tu.getCus_account()+"','"+tu.getCus_password()+"');";
        }
        else
        {
            sql = "insert into db_customer(firstname,lastname,cus_email,cus_password)"
                   + "values ('"+tu.getFirstname()+"','"+tu.getLastname()+"','"
                   +tu.getCus_email()+"','"+tu.getCus_password()+"');";
        }
        try {
            db.connect();
            stm = db.getConn().createStatement();
            stm.executeUpdate(sql);
            db.close();
            return true;
        } catch (SQLException e) {
            System.out.println("Error " + e.toString());
        }
        return false;
    }
    
//    public boolean Delete(String matu) {
//        try {
//            String delete = "DELETE FROM db_customer WHERE id_thucuong='" + matu + "'";
//            db.connect();
//            PreparedStatement pst = db.getConn().prepareStatement(delete);
//            pst.executeUpdate();
//            db.close();
//            return true;
//        } catch (SQLException e) {
//            System.out.print(e.toString());
//            return false;
//        }
//    }
//    public boolean Update(NguoiDung_DTO tu)
//    {
//        try {
//            String delete ="UPDATE db_customer SET cus_account='"+tu.getCus_account()+"',giaban='"+tu.getGiaban()+"' where id_thucuong='"+tu.getId_thucuong()+"'";
//                db.connect();
//            PreparedStatement pst = db.getConn().prepareStatement(delete);
//            pst.executeUpdate();
//            db.close();
//            return true;
//        } catch (SQLException e) {
//            System.out.print(e.toString());
//            return false;
//        }
//    }
}
