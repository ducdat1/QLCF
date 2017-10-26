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
public class ThucUong_Model {
    Database db = new Database();
    Statement stm;
    
    

    
    
    public ArrayList<ThucUong_DTO> get_all()
    {
        ArrayList<ThucUong_DTO> list = new ArrayList<ThucUong_DTO>();
        try
        {
            String sql = "SELECT * FROM db_thucuong";
            db.connect();
            stm = db.getConn().createStatement();
            ResultSet rs = stm.executeQuery(sql);
            if(rs==null)
                return null;
            else
            {
                while(rs.next())
                {
                    int id_thucuong = rs.getInt("id_thucuong");
                    String ten_thucuong = rs.getString("ten_thucuong");
                    int giaban = rs.getInt("giaban");
                    int rank            = rs.getInt("rank");;
                    String url_image    = rs.getString("url_image");;
                    String note         = rs.getString("note");;
                    int discount        = rs.getInt("discount");;
                    String size         = rs.getString("size");;
                    String extra1       = rs.getString("extra1");;
                    String extra2       = rs.getString("extra2");;
                    
                    ThucUong_DTO tu = new ThucUong_DTO(id_thucuong,ten_thucuong,giaban,rank,url_image,note,discount,size,extra1,extra2);
                    
                    list.add(tu);
                }
                return list;
            }
        }catch(Exception e){ System.out.print(e);}
        return null;
    }
    
    public ArrayList<ThucUong_DTO> get_pop()
    {
        ArrayList<ThucUong_DTO> list = new ArrayList<ThucUong_DTO>();
        try
        {
            String sql = "SELECT * FROM qlcf.db_thucuong ORDER BY rank DESC LIMIT 8";
            db.connect();
            stm = db.getConn().createStatement();
            ResultSet rs = stm.executeQuery(sql);
            if(rs==null)
                return null;
            else
            {
                while(rs.next())
                {
                    int id_thucuong = rs.getInt("id_thucuong");
                    String ten_thucuong = rs.getString("ten_thucuong");
                    int giaban = rs.getInt("giaban");
                    int rank            = rs.getInt("rank");;
                    String url_image    = rs.getString("url_image");;
                    String note         = rs.getString("note");;
                    int discount        = rs.getInt("discount");;
                    String size         = rs.getString("size");;
                    String extra1       = rs.getString("extra1");;
                    String extra2       = rs.getString("extra2");;
                    
                    ThucUong_DTO tu = new ThucUong_DTO(id_thucuong,ten_thucuong,giaban,rank,url_image,note,discount,size,extra1,extra2);
                    
                    list.add(tu);
                }
                return list;
            }
        }catch(Exception e){ System.out.print(e);}
        return null;
    }
    
    public ArrayList<ThucUong_DTO> get_new()
    {
        ArrayList<ThucUong_DTO> list = new ArrayList<ThucUong_DTO>();
        try
        {
            String sql = "SELECT * FROM db_thucuong ORDER BY id_thucuong DESC LIMIT 1";
            db.connect();
            stm = db.getConn().createStatement();
            ResultSet rs = stm.executeQuery(sql);
            if(rs==null)
                return null;
            else
            {
                while(rs.next())
                {
                    int id_thucuong     = rs.getInt("id_thucuong");
                    String ten_thucuong = rs.getString("ten_thucuong");
                    int giaban          = rs.getInt("giaban");
                    int rank            = rs.getInt("rank");;
                    String url_image    = rs.getString("url_image");;
                    String note         = rs.getString("note");;
                    int discount        = rs.getInt("discount");;
                    String size         = rs.getString("size");;
                    String extra1       = rs.getString("extra1");;
                    String extra2       = rs.getString("extra2");;
                    if(discount == 1)
                    {
                       int gia_discount = (int)(giaban - (giaban*0.15));
                       gia_discount = (gia_discount/1000)*1000;
                       ThucUong_DTO tu = new ThucUong_DTO(id_thucuong,ten_thucuong,giaban,rank,url_image,note,discount,size,extra1,extra2,gia_discount);
                       list.add(tu);
                    }
                    else 
                    {
                       int gia_discount = (int)(giaban*0.9);
                       gia_discount = (gia_discount/1000)*1000;
                       ThucUong_DTO tu = new ThucUong_DTO(id_thucuong,ten_thucuong,giaban,rank,url_image,note,discount,size,extra1,extra2,gia_discount);
                       list.add(tu);
                    }  
                }
                return list;
            }
        }catch(Exception e){ System.out.print(e);}
        return null;
    }
    
    public ArrayList<ThucUong_DTO> get_by_id(String result)
    {
        ArrayList<ThucUong_DTO> list = new ArrayList<ThucUong_DTO>();
        try
        {
            String sql = "SELECT * FROM db_thucuong WHERE id_thucuong like  '%"+result+"%' or ten_thucuong like '%"+result+"%'";
            db.connect();
            stm = db.getConn().createStatement();
            ResultSet rs = stm.executeQuery(sql);
            if(rs==null)
                return null;
            else
            {
                while(rs.next())
                {
                    int id_thucuong = rs.getInt("id_thucuong");
                    String ten_thucuong = rs.getString("ten_thucuong");
                    int giaban = rs.getInt("giaban");
                    int rank            = rs.getInt("rank");;
                    String url_image    = rs.getString("url_image");;
                    String note         = rs.getString("note");;
                    int discount        = rs.getInt("discount");;
                    String size         = rs.getString("size");;
                    String extra1       = rs.getString("extra1");;
                    String extra2       = rs.getString("extra2");;
                    
                    ThucUong_DTO tu = new ThucUong_DTO(id_thucuong,ten_thucuong,giaban,rank,url_image,note,discount,size,extra1,extra2);
                    
                    list.add(tu);
                }
                return list;
            }
        }catch(Exception e){ System.out.print(e);}
        return null;
    }
    
//    public ThucUong_DTO select_by_id(String result)
//    {
//        //ArrayList<ThucUong_DTO> list = new ArrayList<ThucUong_DTO>();
//        ThucUong_DTO tu = null;
//        try
//        {
//            String sql = "SELECT * FROM db_nhatuien WHERE id_thucuong = '"+result+"'";
//            db.connect();
//            stm = db.getConn().createStatement();
//            ResultSet rs = stm.executeQuery(sql);
//            if(rs==null)
//                return null;
//            else
//            {
//                while(rs.next())
//                {
//          
//                    int id_thucuong = rs.getInt("id_thucuong");
//                    String ten_thucuong = rs.getString("ten_thucuong");
//                    int giaban = rs.getInt("giaban");
//                    
//                    tu = new ThucUong_DTO(id_thucuong,ten_thucuong,giaban);;
//                    
//                }
//                
//            }
//        }catch(Exception e){ System.out.print(e);}
//        return tu;
//    }
    
    public boolean insert(ThucUong_DTO tu)
    {
        String sql = "insert into db_thucuong(ten_thucuong,giaban)\n" +
"values ('"+tu.getTen_thucuong()+"','"+tu.getGiaban()+"');";
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
    
    public boolean Delete(String matu) {
        try {
            String delete = "DELETE FROM db_thucuong WHERE id_thucuong='" + matu + "'";
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
    public boolean Update(ThucUong_DTO tu)
    {
        try {
            String delete ="UPDATE db_thucuong SET ten_thucuong='"+tu.getTen_thucuong()+"',giaban='"+tu.getGiaban()+"' where id_thucuong='"+tu.getId_thucuong()+"'";
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
