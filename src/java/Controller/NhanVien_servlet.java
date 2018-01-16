/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import DTO.NhanVien_DTO;
import Model.NhanVien_Model;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Date;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import jxl.write.WriteException;

/**
 *
 * @author ducdat
 */
public class NhanVien_servlet extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet NhanVien_servlet</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet NhanVien_servlet at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        //processRequest(request, response);
        response.setContentType("text/html;charset=UTF-8");
        request.setCharacterEncoding("utf-8");
        HttpSession session = request.getSession();
        String delete = request.getParameter("idnv");
        NhanVien_Model nv_model = new NhanVien_Model();
        if(request.getParameter("logout")!=null)
            {
                session.invalidate();
                response.sendRedirect("/QLCF/Admin/index.jsp");   
                return;
            }
        if(request.getParameter("bangluong")!=null)
        {
            try {
                nv_model.writeFileExcel();
            } catch (WriteException | SQLException ex) {
                Logger.getLogger(NhanVien_servlet.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
        nv_model.Delete(delete);
        session.setAttribute("Thongbao", "Xóa thành công");
        response.sendRedirect("Admin/QLNhanVien/NhanVien.jsp");
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        request.setCharacterEncoding("utf-8");
        //processRequest(request, response);
        try{
            String result = request.getParameter("search");
            String form = request.getParameter("form");
            HttpSession session = request.getSession();
            NhanVien_Model nv_model = new NhanVien_Model();
            ArrayList<NhanVien_DTO> list = new ArrayList<NhanVien_DTO>();
            if ( form != null && "login".equals(form) ){
                session.setAttribute("log_flg", "0");
                String username = request.getParameter("username");
                String password = request.getParameter("password");
                NhanVien_DTO nv = nv_model.login(username, password);
                if (nv != null) {
                    session.setAttribute("flg_nv", nv);
                    session.setAttribute("log_flg", "1");
                    response.sendRedirect("/QLCF/Admin/index.jsp");
                    return;
                }
            }else if ( form != null && "insert".equals(form) ){
                NhanVien_DTO gv = new NhanVien_DTO(); 
                gv.setTennv(request.getParameter("tennv"));
                gv.setSdt(request.getParameter("sdt"));
                gv.setDiachi(request.getParameter("diachi"));
                gv.setTaikhoan(request.getParameter("taikhoan"));
                gv.setMatkhau(request.getParameter("matkhau"));
                gv.setNgaysinh(Date.valueOf(request.getParameter("ngaysinh")));
                gv.setCapdo(Integer.parseInt(request.getParameter("capdo")));
                gv.setGiolam(Integer.parseInt(request.getParameter("giolam")));
                gv.setLuong(Integer.parseInt(request.getParameter("luong")));
                Boolean chk = nv_model.insert(gv);
                Thread.sleep(5000);
                if(chk == true){              
                    session.setAttribute("Thongbao", "Thêm thành công");
                    response.sendRedirect("/QLCF/Admin/QLNhanVien/NhanVien.jsp");   
                    return;
                }else
                {
                    session.setAttribute("Thongbao", null);
                    response.sendRedirect("/QLCF/Admin/QLNhanVien/NhanVien.jsp");
                }
// fix lại giao dien update
            }else if ( form != null && "update".equals(form) ){
                NhanVien_DTO gv = new NhanVien_DTO(); 
                gv.setTennv(request.getParameter("tennv"));
                gv.setSdt(request.getParameter("sdt"));
                gv.setDiachi(request.getParameter("diachi"));
                gv.setTaikhoan(request.getParameter("taikhoan"));
                gv.setMatkhau(request.getParameter("matkhau"));
                gv.setNgaysinh(Date.valueOf(request.getParameter("ngaysinh")));
                gv.setCapdo(Integer.parseInt(request.getParameter("capdo")));
                gv.setGiolam(Integer.parseInt(request.getParameter("giolam")));
                gv.setLuong(Integer.parseInt(request.getParameter("luong")));
                gv.setId_nhanvien(Integer.parseInt(request.getParameter("idnv")));
                if(nv_model.Update(gv))
                {
                    session.setAttribute("Thongbao", "Sửa thành công");
                    response.sendRedirect("/QLCF/Admin/QLNhanVien/NhanVien.jsp");
                    return;
                }
                else
                {
                    session.setAttribute("Thongbao", null);
                    response.sendRedirect("/QLCF/Admin/QLNhanVien/NhanVien.jsp");
                }
            }
            if(result!=null)
            {
                list = nv_model.get_by_id(result);
                session.setAttribute("result", list);
                response.sendRedirect("/QLCF/Admin/QLNhanVien/KetQua.jsp");   
                return;
            }
            response.sendRedirect("/QLCF/Admin/index.jsp");
        }catch(IOException | NumberFormatException e)
        {
            response.sendRedirect("/QLCF/Admin/index.jsp");
        } catch (InterruptedException ex) {
            Logger.getLogger(NhanVien_servlet.class.getName()).log(Level.SEVERE, null, ex);
        } 
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
