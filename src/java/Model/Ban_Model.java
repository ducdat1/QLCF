/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Model;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import DTO.*;

/**
 *
 * @author ducdat
 */
public class Ban_Model {
    Database db = new Database();
    Statement stm;
    
    public ArrayList<Ban_DTO> get_empty()
    {
        ArrayList<Ban_DTO> list = new ArrayList<>();
        try
        {
            String sql = "select id_ban,id_customer,tinhtrang,tongtien,dc_nhan,payment,"
                       + "date_format(createdate, \"%h:%m %d-%m-%Y\") as createdate "
                       + "from db_ban "
                       + "where tinhtrang = 1 or tinhtrang = 0";
            db.connect();
            stm = db.getConn().createStatement();
            ResultSet rs = stm.executeQuery(sql);
            if(rs==null)
                return null;
            else
            {
                while(rs.next())
                {
                    int idban = rs.getInt("id_ban");
                    int id_customer = rs.getInt("id_customer");
                    int tinhtrang = rs.getInt("tinhtrang");
                    String dc_nhan = rs.getString("dc_nhan");
                    int tongtien = rs.getInt("tongtien");
                    int payment = rs.getInt("payment");
                    String ngaytao = rs.getString("createdate");
                   Ban_DTO ban = new Ban_DTO(idban,id_customer,tinhtrang,tongtien,dc_nhan,payment,ngaytao);
                   list.add(ban);
                }
                return list;
            }
        }catch(SQLException e){ System.out.print(e);}
        return null;
    }
    
//    public ArrayList<Ban_DTO> get_check()
//    {
//        ArrayList<Ban_DTO> list = new ArrayList<Ban_DTO>();
//        try
//        {
//            String sql = "select * from db_ban where tinhtrang = 1";
//            db.connect();
//            stm = db.getConn().createStatement();
//            ResultSet rs = stm.executeQuery(sql);
//            if(rs==null)
//                return null;
//            else
//            {
//                while(rs.next())
//                {
//                    int idban = rs.getInt("id_ban");
//                    int tinhtrang = rs.getInt("tinhtrang");
//                    int tongtien = rs.getInt("tongtien");
//                   Ban_DTO ban = new Ban_DTO(idban,tinhtrang,tongtien);
//                   list.add(ban);
//                }
//                return list;
//            }
//        }catch(Exception e){ System.out.print(e);}
//        return null;
//    }
    
    
    public ArrayList<Ban_DTO> get_all()
    {
        ArrayList<Ban_DTO> list = new ArrayList<Ban_DTO>();
        try
        {
            String sql = "select id_ban,id_customer,tinhtrang,tongtien,payment,"
                       + "date_format(createdate, \"%d-%m-%Y\") as createdate from db_ban";
            db.connect();
            stm = db.getConn().createStatement();
            ResultSet rs = stm.executeQuery(sql);
            if(rs==null)
                return null;
            else
            {
                while(rs.next())
                {
                    int idban = rs.getInt("id_ban");
                    int idcustomer = rs.getInt("id_customer");
                    int tinhtrang = rs.getInt("tinhtrang");
                    int tongtien = rs.getInt("tongtien");
                    int payment = rs.getInt("payment");
                    String ngaymua = rs.getString("createdate");
                   Ban_DTO ban = new Ban_DTO(idban,idcustomer,tinhtrang,tongtien,payment,ngaymua);
                   list.add(ban);
                }
                return list;
            }
        }catch(SQLException e){ System.out.print(e);}
        return null;
    }

    
//    public ArrayList<Ban_DTO> get_by_id(String result)
//    {
//        ArrayList<Ban_DTO> list = new ArrayList<Ban_DTO>();
//        try
//        {
//            String sql = "select * from db_ban WHERE id_ban = '"+result+"'";
//            db.connect();
//            stm = db.getConn().createStatement();
//            ResultSet rs = stm.executeQuery(sql);
//            if(rs==null)
//                return null;
//            else
//            {
//                while(rs.next())
//                {
//                    int idban = rs.getInt("idban");
//                    int tinhtrang = rs.getInt("tinhtrang");
//                    int tongtien = rs.getInt("tongtien");
//                   Ban_DTO ban = new Ban_DTO(idban,tinhtrang,tongtien);
//                   list.add(ban);
//                }
//                return list;
//            }
//        }catch(Exception e){ System.out.print(e);}
//        return null;
//    }
//    
//    public Ban_DTO select_by_id(String result)
//    {
//        //ArrayList<Ban_DTO> list = new ArrayList<Ban_DTO>();
//        Ban_DTO ban = null;
//        try
//        {
//            String sql = "select * from db_ban WHERE id_ban = '"+result+"'";
//            db.connect();
//            stm = db.getConn().createStatement();
//            ResultSet rs = stm.executeQuery(sql);
//            if(rs==null)
//                return null;
//            else
//            {
//                while(rs.next())
//                {
//                    int idban = rs.getInt("idban");
//                    int tinhtrang = rs.getInt("tinhtrang");
//                    int tongtien = rs.getInt("tongtien");
//                   ban = new Ban_DTO(idban,tinhtrang,tongtien);
//                }
//                
//            }
//        }catch(Exception e){ System.out.print(e);}
//        return ban;
//    }
    
    public boolean insert(Ban_DTO ban)
    {
        String sql = "insert into db_ban(tinhtrang,tongtien) values ('"+ban.getTrangthai()+"','"+ban.getTongtien()+"');";
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
    
    public boolean Delete(String mban) {
        try {
            String delete = "DELETE FROM db_ban WHERE id_ban='" + mban + "'";
            db.connect();
            PreparedStatement pst = db.getConn().prepareStatement(delete);
            pst.executeUpdate();
            db.close();
            return true;
        } catch (SQLException e) {
            System.out.print(e.toString());
            return false;
        }
    }
    public boolean Update(Ban_DTO ban)
    {
        try {
            String delete ="UPDATE db_ban SET tinhtrang='"+ban.getTrangthai()+"',tongtien='"+ban.getTongtien()+"' where id_ban = '"+ban.getId_ban()+"'";
            db.connect();
            PreparedStatement pst = db.getConn().prepareStatement(delete);
            pst.executeUpdate();
            db.close();
            return true;
        } catch (SQLException e) {
            System.out.print(e.toString());
            return false;
        }
    }
    
        public boolean tinhtien(String tongtien, String maban)
    {
        try {
            String delete ="UPDATE db_ban SET tinhtrang='1',tongtien='"+tongtien+"' where id_ban = '"+maban+"'";
            db.connect();
            PreparedStatement pst = db.getConn().prepareStatement(delete);
            pst.executeUpdate();
            db.close();
            return true;
        } catch (SQLException e) {
            System.out.print(e.toString());
            return false;
        }
    }
    
        
        
}
