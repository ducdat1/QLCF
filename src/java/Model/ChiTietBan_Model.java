/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Model;

import DTO.ChiTietBan_DTO;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

/**
 *
 * @author TiT_TM
 */
public class ChiTietBan_Model {

    Database db = new Database();
    Statement stm;

    public ArrayList<ChiTietBan_DTO> get_all() {
        ArrayList<ChiTietBan_DTO> list = new ArrayList<ChiTietBan_DTO>();
        try {
            String sql = "SELECT * FROM db_chitiet_ban";
            db.connect();
            stm = db.getConn().createStatement();
            ResultSet rs = stm.executeQuery(sql);
            if (rs == null) {
                return null;
            } else {
                while (rs.next()) {
                    int mactb = rs.getInt("id_chitiet_ban");
                    int tenctb = rs.getInt("id_ban");
                    int thucuong = rs.getInt("id_thucuong");
                    int soluong = rs.getInt("soluong_thucuong");
                    float thanhtien = rs.getFloat("thanhtien");
                    ChiTietBan_DTO ctb = new ChiTietBan_DTO(mactb, tenctb, thucuong, soluong, thanhtien);
                    list.add(ctb);
                }
                return list;
            }
        } catch (Exception e) {
            System.out.print(e);
        }
        return null;
    }

    public ArrayList<ChiTietBan_DTO> get_by_id(String result) {
        ArrayList<ChiTietBan_DTO> list = new ArrayList<ChiTietBan_DTO>();
        try {
            String sql = "SELECT * FROM db_chitiet_ban WHERE id_chitiet_ban like  '%" + result + "%' or id_ban like '%" + result + "%'";
            db.connect();
            stm = db.getConn().createStatement();
            ResultSet rs = stm.executeQuery(sql);
            if (rs == null) {
                return null;
            } else {
                while (rs.next()) {
                    int mactb = rs.getInt("id_chitiet_ban");
                    int tenctb = rs.getInt("id_ban");
                    int thucuong = rs.getInt("id_thucuong");
                    int soluong = rs.getInt("soluong_thucuong");
                    float thanhtien = rs.getFloat("thanhtien");
                    ChiTietBan_DTO ctb = new ChiTietBan_DTO(mactb, tenctb, thucuong, soluong, thanhtien);
                    list.add(ctb);
                }
                return list;
            }
        } catch (Exception e) {
            System.out.print(e);
        }
        return null;
    }

    public ChiTietBan_DTO select_by_id(String result) {
        //ArrayList<ChiTietBan_DTO> list = new ArrayList<ChiTietBan_DTO>();
        ChiTietBan_DTO ctb = null;
        try {
            String sql = "SELECT * FROM db_chitiet_ban WHERE id_chitiet_ban = '" + result + "'";
            db.connect();
            stm = db.getConn().createStatement();
            ResultSet rs = stm.executeQuery(sql);
            if (rs == null) {
                return null;
            } else {
                while (rs.next()) {

                    int mactb = rs.getInt("id_chitiet_ban");
                    int tenctb = rs.getInt("id_ban");
                    int thucuong = rs.getInt("id_thucuong");
                    int soluong = rs.getInt("soluong_thucuong");
                    float thanhtien = rs.getFloat("thanhtien");
                    ctb = new ChiTietBan_DTO(mactb, tenctb, thucuong, soluong, thanhtien);
                }

            }
        } catch (Exception e) {
            System.out.print(e);
        }
        return ctb;
    }

    public boolean insert(ChiTietBan_DTO ctb) {
        String sql = "insert into db_chitiet_ban(id_ban,id_thucuong,soluong_thucuong,thanhtien) value(" + ctb.getId_ban() + ",'" + ctb.getId_thucuong() + "','" + ctb.getSoluong_thucuong() + "','" + ctb.getThanhtien() + "');";
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

    public boolean Delete(String mactb) {
        try {
            String delete = "DELETE FROM db_chitiet_ban WHERE id_chitiet_ban='" + mactb + "'";
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

    public boolean Update(ChiTietBan_DTO ctb) {
        try {
            String delete = "UPDATE db_chitiet_ban SET id_ban='" + ctb.getId_ban() + "',id_thucuong='" + ctb.getId_thucuong() + "',soluong_thucuong='" + ctb.getSoluong_thucuong() + "',thanhtien='" + ctb.getThanhtien() + "' where id_chitiet_ban = '" + ctb.getId_chitiet_ban() + "'";
// "UPDATE db_lop SET Ten_Lop = '"+lop.getTenLop()+"', SiSo='"+lop.getSiSo()+"' where ID_Lop = '"+lop.getLop_ID()+"'";
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

    public String tongtien(String maban) {
        try {
            String tong = null;
            String sql = "select sum(thanhtien) as tongtien from db_chitiet_ban where id_ban = '"+maban+"';";
// "UPDATE db_lop SET Ten_Lop = '"+lop.getTenLop()+"', SiSo='"+lop.getSiSo()+"' where ID_Lop = '"+lop.getLop_ID()+"'";
            db.connect();
            stm = db.getConn().createStatement();
            ResultSet rs = stm.executeQuery(sql);
            if (rs == null) {
                return null;
            } else {
                while (rs.next()) {
                    tong = rs.getString("tongtien");

                }
                return tong;
            }
        } catch (SQLException e) {
            System.out.print(e.toString());
            return null;
        }
    }

    public boolean delete_details(String maban) {
        try {
            String sql = "select *  from db_chitiet_ban where id_ban = '"+maban+"';";
// "UPDATE db_lop SET Ten_Lop = '"+lop.getTenLop()+"', SiSo='"+lop.getSiSo()+"' where ID_Lop = '"+lop.getLop_ID()+"'";
            db.connect();
            stm = db.getConn().createStatement();
            ResultSet rs = stm.executeQuery(sql);
            if (rs == null) {
                return false;
            } else {
                while (rs.next()) {
                   Delete(rs.getString("id_chitiet_ban"));
                }
                String delete ="UPDATE db_ban SET tinhtrang='0',tongtien='0' where id_ban = '"+maban+"'";
                PreparedStatement pst = db.getConn().prepareStatement(delete);
            pst.executeUpdate();
            db.close();
                return true;
            }
        } catch (SQLException e) {
            System.out.print(e.toString());
            return false;
        }
    }

    
    
    
}
