/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Model;

import DTO.NhanVien_DTO;
import java.io.File;
import java.io.*;
import java.io.IOException;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import jxl.Workbook;
import jxl.write.Label;
import jxl.write.WritableSheet;
import jxl.write.WritableWorkbook;
import jxl.write.WriteException;
import jxl.write.biff.RowsExceededException;

/**
 *
 * @author ducdat
 */
public class NhanVien_Model {
    Database db = new Database();
    Statement stm;
    
    
    
    public NhanVien_DTO login(String username, String password)
    {
        //ArrayList<NhanVien_DTO> list = new ArrayList<NhanVien_DTO>();
        NhanVien_DTO nv = new NhanVien_DTO();
        try
        {
            String sql = "SELECT id_nv, tennv, giolam, capdo FROM db_nhanvien WHERE taikhoan = '"+username+"' and matkhau = '"+password+"'";
            db.connect();
            stm = db.getConn().createStatement();
            ResultSet rs = stm.executeQuery(sql);
            if(rs==null)
            {
                return null;
            }
//            else if(rs.getFetchSize() > 1){
//                return null;
//            }
            else{
                while(rs.next())
                    {
                        int manv = rs.getInt("id_nv");
                        String tennv = rs.getString("tennv");
                        int giolam = rs.getInt("giolam");
                        int capdo = rs.getInt("capdo");
                        nv.setId_nhanvien(manv);
                        nv.setTennv(tennv);
                        nv.setGiolam(giolam);
                        nv.setCapdo(capdo);
                    }   
            }
        }catch(Exception e){ System.out.print(e);}
        return nv;
    }
    
    
    public ArrayList<NhanVien_DTO> get_all()
    {
        ArrayList<NhanVien_DTO> list = new ArrayList<NhanVien_DTO>();
        try
        {
            String sql = "SELECT * FROM db_nhanvien";
            db.connect();
            stm = db.getConn().createStatement();
            ResultSet rs = stm.executeQuery(sql);
            if(rs==null)
                return null;
            else
            {
                while(rs.next())
                {
                    int manv = rs.getInt("id_nv");
                    String tennv = rs.getString("tennv");
                    int giolam = rs.getInt("giolam");
                    Date ngaysinh = rs.getDate("ngaysinh");
                    String sdt = rs.getString("sdt");
                    String diachi = rs.getString("diachi");
                    float luong = rs.getFloat("luong");
                    int capdo = rs.getInt("capdo");
                    String taikhoan = rs.getString("TaiKhoan");
                    String matkhau = rs.getString("MatKhau");
                    NhanVien_DTO nv = new NhanVien_DTO(manv,tennv,giolam,ngaysinh,sdt,diachi,luong,capdo,taikhoan,matkhau);
                    list.add(nv);
                }
                return list;
            }
        }catch(Exception e){ System.out.print(e);}
        return null;
    }
    
    
    public ArrayList<NhanVien_DTO> get_by_id(String result)
    {
        ArrayList<NhanVien_DTO> list = new ArrayList<NhanVien_DTO>();
        try
        {
            String sql = "SELECT * FROM db_nhanvien WHERE id_nv like  '%"+result+"%' or tennv like '%"+result+"%'";
            db.connect();
            stm = db.getConn().createStatement();
            ResultSet rs = stm.executeQuery(sql);
            if(rs==null)
                return null;
            else
            {
                while(rs.next())
                {
                   int manv = rs.getInt("id_nv");
                    String tennv = rs.getString("tennv");
                    int giolam = rs.getInt("giolam");
                    Date ngaysinh = rs.getDate("ngaysinh");
                    String sdt = rs.getString("sdt");
                    String diachi = rs.getString("diachi");
                    float luong = rs.getFloat("luong");
                    int capdo = rs.getInt("capdo");
                    String taikhoan = rs.getString("TaiKhoan");
                    String matkhau = rs.getString("MatKhau");
                    NhanVien_DTO nv = new NhanVien_DTO(manv,tennv,giolam,ngaysinh,sdt,diachi,luong,capdo,taikhoan,matkhau);
                    list.add(nv);
                }
                return list;
            }
        }catch(Exception e){ System.out.print(e);}
        return null;
    }
    
    public NhanVien_DTO select_by_id(String result)
    {
        //ArrayList<NhanVien_DTO> list = new ArrayList<NhanVien_DTO>();
        NhanVien_DTO nv = null;
        try
        {
            String sql = "SELECT * FROM db_nhanvien WHERE id_nv = '"+result+"'";
            db.connect();
            stm = db.getConn().createStatement();
            ResultSet rs = stm.executeQuery(sql);
            if(rs==null)
                return null;
            else
            {
                while(rs.next())
                {
          
                    int manv = rs.getInt("id_nv");
                    String tennv = rs.getString("tennv");
                    int giolam = rs.getInt("giolam");
                    Date ngaysinh = rs.getDate("ngaysinh");
                    String sdt = rs.getString("sdt");
                    String diachi = rs.getString("diachi");
                    float luong = rs.getFloat("luong");
                    int capdo = rs.getInt("capdo");
                    String taikhoan = rs.getString("TaiKhoan");
                    String matkhau = rs.getString("MatKhau");
                    nv = new NhanVien_DTO(manv,tennv,giolam,ngaysinh,sdt,diachi,luong,capdo,taikhoan,matkhau);
                }
                
            }
        }catch(Exception e){ System.out.print(e);}
        return nv;
    }
    
    public boolean insert(NhanVien_DTO nv)
    {
        String sql = "insert into "
                   + "db_nhanvien(tennv,giolam,ngaysinh,sdt,diachi,luong,capdo,taikhoan,matkhau)\n"
                   + "values ('"+nv.getTennv()+"','"+nv.getGiolam()+"','"+nv.getNgaysinh()+"','"+nv.getSdt()+"','"+nv.getDiachi()+"','"+nv.getLuong()+"','"+nv.getCapdo()+"','"+nv.getTaikhoan()+"','"+nv.getMatkhau()+"')";
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
    
    public boolean Delete(String manv) {
        try {
            String delete = "DELETE FROM db_nhanvien WHERE ID_nv='" + manv + "'";
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
    public boolean Update(NhanVien_DTO nv)
    {
        try {
            String update ="UPDATE db_nhanvien "
                          + "SET luong = '"+nv.getLuong()+"',"
                          + "giolam='"+nv.getGiolam()+"',tennv='"+nv.getTennv()+"',"
                          + "sdt='"+nv.getSdt()+"',diachi='"+nv.getDiachi()+"',taikhoan='"+nv.getTaikhoan()+"',"
                          + "matkhau='"+nv.getMatkhau()+"',capdo='"+nv.getCapdo()+"' "
                          + "where id_nv = '"+nv.getId_nhanvien()+"'";
// "UPDATE db_lop SET Ten_Lop = '"+lop.getTenLop()+"', SiSo='"+lop.getSiSo()+"' where ID_Lop = '"+lop.getLop_ID()+"'";
                db.connect();
            PreparedStatement pst = db.getConn().prepareStatement(update);
            pst.executeUpdate();
            db.close();
            return true;
        } catch (SQLException e) {
            System.out.print(e.toString());
            return false;
        }
    }
    
    
    public void writeFileExcel() throws WriteException, SQLException {
        WritableWorkbook workbook;
        // create workbook
       String fileName = "C:\\Users\\ducdat\\Desktop\\BangLuong.xls";
        try {
            workbook = Workbook.createWorkbook(new File(fileName));
 
            // create sheet
            WritableSheet sheet1 = workbook.createSheet("Luong", 0);
 
            // create Label and add to sheet
            sheet1.addCell(new Label(0, 0, "Bảng lương nhân viên"));
 
            // row begin write data
            ArrayList<String[]> list = new ArrayList<String[]>();
            String[] colm = {"Mã nhân viên","Tên nhân viên","Ngày sinh"
    				,"Địa chỉ","Giờ làm","Số điện thoại","Lương","Cấp độ","Tài khoản","Mật khẩu"};
            list.add(colm);
    		String sql = "SELECT * FROM db_nhanvien";
            db.connect();
            stm = db.getConn().createStatement();
            ResultSet rs = stm.executeQuery(sql);
            if (rs == null) {
                return;
            } else {
                while (rs.next()) {
                    String str[] = {
                    String.valueOf(rs.getInt("id_nv")),
                    rs.getString("tennv"),
                    rs.getString("ngaysinh"),
                    rs.getString("diachi"),
                    String.valueOf(rs.getInt("giolam")),
                    
                    rs.getString("sdt"),
                                        
                    String.valueOf(rs.getFloat("luong")),
                    String.valueOf(rs.getInt("capdo")),
                    rs.getString("taikhoan"),
                    rs.getString("matkhau")};
                    list.add(str);
                }
                
            }
    			int rowBegin = 2;
                int colBegin = 0;
     
                for (int row = rowBegin, i = 0; row < list.size() + rowBegin; row++, i++) {
                    for (int col = colBegin, j = 0; col < list.get(0).length + colBegin; col++, j++) {
                        sheet1.addCell(new Label(col, row, list.get(i)[j]));
                    }
                }

    		
            // write file
            workbook.write();
 
            // close
            workbook.close();
        } catch (IOException e) {
            System.out.println("Error create file\n" + e.toString());
        } catch (RowsExceededException e) {
            System.out.println("Error write file\n" + e.toString());
        } catch (WriteException e) {
            System.out.println("Error write file\n" + e.toString());
        }
        System.out.println("create and write success");
    }
}
