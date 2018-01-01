/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Model;

import DTO.ChiTietBan_DTO;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

/**
 *
 * @author ducdat
 */
public class ChiTietBan_Model {

    Database db = new Database();
    Statement stm;

    public ArrayList<ChiTietBan_DTO> get_all() {
        ArrayList<ChiTietBan_DTO> list = new ArrayList<>();
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
        } catch (SQLException e) {
            System.out.print(e);
        }
        return null;
    }

    public ArrayList<ChiTietBan_DTO> get_by_id(String result) {
        ArrayList<ChiTietBan_DTO> list = new ArrayList<>();
        try {
            String sql = "SELECT c.id_chitiet_ban, t.ten_thucuong, c.soluong_thucuong, c.thanhtien, "
                              + "t2.ten_thucuong as sp_kemtheo, c.sl_spkemtheo, t.extra2 " 
                       + "FROM db_chitiet_ban c join db_thucuong t on c.id_thucuong = t.id_thucuong "
                            + "join db_thucuong t2 on t2.id_thucuong = c.sp_kemtheo "
                       + "WHERE c.id_ban =  '" + result + "'";
            db.connect();
            stm = db.getConn().createStatement();
            ResultSet rs = stm.executeQuery(sql);
            if (rs == null) {
                return null;
            } else {
                while (rs.next()) {
                    ChiTietBan_DTO ctb = new ChiTietBan_DTO();
                    ctb.setId_chitiet_ban(rs.getInt("id_chitiet_ban"));
                    ctb.setTen_thucuong(rs.getString("ten_thucuong"));
                    ctb.setSoluong_thucuong(rs.getInt("soluong_thucuong"));
                    if(rs.getInt("extra2") == 2){
                        ctb.setTen_spkemtheo(rs.getString("sp_kemtheo"));
                        ctb.setSl_spkemtheo(rs.getInt("sl_spkemtheo"));
                    }else{
                        ctb.setTen_spkemtheo("Không bán kèm");
                        ctb.setSl_spkemtheo(0);
                    }
                    ctb.setThanhtien(rs.getFloat("thanhtien"));
                    list.add(ctb);
                }
                return list;
            }
        } catch (SQLException e) {
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
        } catch (SQLException e) {
            System.out.print(e);
        }
        return ctb;
    }

    public boolean insert(ChiTietBan_DTO ctb) {
        String sql = "insert into db_chitiet_ban(id_ban,id_thucuong,soluong_thucuong,thanhtien) "
                + "value(" + ctb.getId_ban() + ",'" + ctb.getId_thucuong() + "','" + ctb.getSoluong_thucuong() + "','" + ctb.getThanhtien() + "');";
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
