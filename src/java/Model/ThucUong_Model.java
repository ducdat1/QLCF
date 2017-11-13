/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Model;

import DTO.*;
import java.io.File;
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
    
    /**
     *
     * @param id
     * @return
     */
    public ArrayList<ThucUong_DTO> get_all(int id,int flg)
    {
        ArrayList<ThucUong_DTO> list = new ArrayList<ThucUong_DTO>();
        try
        {
            String sql;
            if(id == 0){
               sql = "SELECT * FROM db_thucuong";
            }else{
               if(flg == 1){
                   sql = "SELECT * FROM db_thucuong where extra2 ="+id+" order by id_thucuong desc";
               }else{
                   sql = "SELECT * FROM db_thucuong where extra2 ="+id+" order by id_thucuong desc limit 8";
               }
               
            }
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
                    int rank            = rs.getInt("rank");
                    String url_image    = rs.getString("url_image");
                    String note         = rs.getString("note");
                    int discount        = rs.getInt("discount");
                    String size         = rs.getString("size");
                    String extra1       = rs.getString("extra1");
                    String extra2       = rs.getString("extra2");
                    if(url_image == null){
                        url_image = "noimg.png";
                    }
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
                    int rank            = rs.getInt("rank");
                    String url_image    = rs.getString("url_image");
                    String note         = rs.getString("note");
                    int discount        = rs.getInt("discount");
                    String size         = rs.getString("size");
                    String extra1       = rs.getString("extra1");
                    String extra2       = rs.getString("extra2");
                    
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
            String sql = "SELECT * FROM db_thucuong where extra2 ='1' or extra2 ='2' ORDER BY id_thucuong DESC LIMIT 1";
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
                    int rank            = rs.getInt("rank");
                    String url_image    = rs.getString("url_image");
                    String note         = rs.getString("note");
                    int discount        = rs.getInt("discount");
                    String size         = rs.getString("size");
                    String extra1       = rs.getString("extra1");
                    String extra2       = rs.getString("extra2");
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
        }catch(SQLException e){ System.out.print(e);}
        return null;
    }
    
    public ArrayList<ThucUong_DTO> get_by_id(String result)
    {
        ArrayList<ThucUong_DTO> list = new ArrayList<ThucUong_DTO>();
        try
        {
            String sql = "SELECT * FROM db_thucuong WHERE id_thucuong = '"+result+"'";
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
                    int rank            = rs.getInt("rank");
                    String url_image    = rs.getString("url_image");
                    String note         = rs.getString("note");
                    int discount        = rs.getInt("discount");
                    String size         = rs.getString("size");
                    String extra1       = rs.getString("extra1");
                    String extra2       = rs.getString("extra2");
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
        }catch(SQLException e){ System.out.print(e);}
        return null;
    }
    
    public ThucUong_DTO get_to_cart(String result)
    {
        try
        {
            String sql = "SELECT * FROM db_thucuong WHERE id_thucuong = '"+result+"'";
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
                    int rank            = rs.getInt("rank");
                    String url_image    = rs.getString("url_image");
                    String note         = rs.getString("note");
                    int discount        = rs.getInt("discount");
                    String size         = rs.getString("size");
                    String extra1       = rs.getString("extra1");
                    String extra2       = rs.getString("extra2");
                    if(discount == 1)
                    {
                       int gia_discount = (int)(giaban - (giaban*0.15));
                       gia_discount = (gia_discount/1000)*1000;
                       ThucUong_DTO tu = new ThucUong_DTO(id_thucuong,ten_thucuong,giaban,rank,url_image,note,discount,size,extra1,extra2,gia_discount);
                       return tu;
                    }
                    else 
                    {
                       int gia_discount = (int)(giaban*0.9);
                       gia_discount = (gia_discount/1000)*1000;
                       ThucUong_DTO tu = new ThucUong_DTO(id_thucuong,ten_thucuong,giaban,rank,url_image,note,discount,size,extra1,extra2,gia_discount);
                       return tu;
                    }
                }
                
            }
        }catch(SQLException e){ System.out.print(e);}
        return null;
    }
    
    public ThucUong_DTO select_by_id(String result)
    {
        try
        {
            String sql = "SELECT * FROM db_thucuong WHERE id_thucuong = '"+result+"'";
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
                    int rank            = rs.getInt("rank");
                    String url_image    = rs.getString("url_image");
                    String note         = rs.getString("note");
                    int discount        = rs.getInt("discount");
                    String size         = rs.getString("size");
                    String extra1       = rs.getString("extra1");
                    String extra2       = rs.getString("extra2");
                    ThucUong_DTO tu = new ThucUong_DTO(id_thucuong,ten_thucuong,giaban,rank,url_image,note,discount,size,extra1,extra2);
                    return tu;
                }
            }
        }catch(SQLException e){ System.out.print(e);}
        return null;
    }
    
    public boolean insert(ThucUong_DTO tu)
    {
        
        String sql = "INSERT INTO db_thucuong (`ten_thucuong`, `giaban`, `url_image`, `note`, `discount`, `size`, `extra1`, `extra2`, `createdate`) "
                + "VALUES ('"+tu.getTen_thucuong()+"', '"
                +tu.getGiaban()+"', '"+tu.geturl_image()+"', '"
                +tu.getnote()+"', '2', '"+tu.getsize()+"', '"
                +tu.getextra1()+"', '"+tu.getextra2()+"', sysdate()"
                + ")";
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
        String url = null;
        if(tu.geturl_image().length() > 0)
        {
            url = "url_image='"+tu.geturl_image()+"', ";
        }
        try {
            String delete ="UPDATE db_thucuong SET "
                    + "ten_thucuong='"+tu.getTen_thucuong()+"',"
                    + "giaban='"+tu.getGiaban()+"', "
                    + url
                    + "note='"+tu.getnote()+"', "
                    + "discount='"+tu.getdiscount()+"', "
                    + "size='"+tu.getsize()+"', "
                    + "extra1='"+tu.getextra1()+"', "
                    + "extra2='"+tu.getextra2()+"' "
                    + "where id_thucuong='"+tu.getId_thucuong()+"'";
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
