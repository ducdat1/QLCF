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
            String sql = "select b.id_ban, concat(c.lastname,' ',c.firstname) as fullname,"
                        + "b.tinhtrang,b.tongtien,b.dc_nhan,b.payment,"
                        + "date_format(b.createdate, \"%h:%m %d-%m-%Y\") as createdate \n" 
                        + "from db_ban b join db_customer c on c.id_customer = b.id_customer\n" 
                        + "where b.tinhtrang != 4";
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
                    String customer = rs.getString("fullname");
                    int tinhtrang = rs.getInt("tinhtrang");
                    String dc_nhan = rs.getString("dc_nhan");
                    int tongtien = rs.getInt("tongtien");
                    int payment = rs.getInt("payment");
                    String ngaytao = rs.getString("createdate");
                   Ban_DTO ban = new Ban_DTO(idban,customer,tinhtrang,tongtien,dc_nhan,payment,ngaytao);
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
    
    /**
     *
     * @param a
     * @param date
     * @return 
     */
    public ArrayList<Ban_DTO> get_all(int a, String date)
    {
        ArrayList<Ban_DTO> list = new ArrayList<Ban_DTO>();
        try
        {
            String select = "";
            if(a == 0){
                select = "b.tinhtrang != 5 ";
            }else if(a == 1){
                select = "b.tinhtrang = 1 ";
            }else if(a == 2){
                select = "b.tinhtrang = 2 ";
            }else if(a == 3){
                select = "b.tinhtrang = 3 ";
            }else if(a == 4){
                select = "b.tinhtrang = 4 ";
            }
            String sql = "select b.id_customer, b.id_ban, concat(c.lastname,' ',c.firstname) as fullname,"
                        + "b.tinhtrang,b.tongtien,b.dc_nhan,b.payment,"
                        + "date_format(b.createdate, \"%h:%m %d-%m-%Y\") as createdate \n" 
                        + "from db_ban b join db_customer c on c.id_customer = b.id_customer\n"
                        + "where "+ select +""
                        + "order by b.id_ban desc";
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
                    String name_cus = rs.getString("fullname");
                    String dc_nhan = rs.getString("dc_nhan"); 
                    int tinhtrang = rs.getInt("tinhtrang");
                    int tongtien = rs.getInt("tongtien");
                    int payment = rs.getInt("payment");
                    String ngaymua = rs.getString("createdate");
                   Ban_DTO ban = new Ban_DTO(idban, name_cus, tinhtrang, tongtien, dc_nhan, payment, ngaymua);
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
    
    public int insert(Ban_DTO ban)
    {
        String sqlchk = "";
        int last_id = 0;
        String sql = "INSERT INTO `qlcf`.`db_ban` (`id_customer`, `tinhtrang`, `tongtien`, `payment`, `createdate`) "
                + "VALUES ('"+ban.getId_customer()+"', '2', '"+ban.getTongtien()+"', '2', sysdate());";
//                + "VALUES ('1', '2', '11111', '2', sysdate());";     
        String lastid = "select LAST_INSERT_ID() as last_id";
                try {
            db.connect();
            stm = db.getConn().createStatement();
            stm.executeUpdate(sql);
            ResultSet rs=stm.executeQuery("select * from `qlcf`.`db_ban`");
            if(rs.last()){
               last_id=rs.getInt("id_ban");
            }
            db.close();
            return last_id;
        } catch (SQLException e) {
            System.out.println("Error " + e.toString());
        }
        return last_id;
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
    
    public boolean change_status(String status, String id, int idnv)
    {
        int chg_status = 2;
        if("1".equals(status) || "3".equals(status)){
            chg_status = 4;
        }else{
            chg_status = 3;
        }
        try {
            String delete ="UPDATE db_ban SET tinhtrang='"+chg_status+"', id_nhanvien='"+idnv+"' where id_ban = '"+id+"'";
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
