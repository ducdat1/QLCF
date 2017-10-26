/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import DTO.NguoiDung_DTO;
import Model.Nguoidung_Model;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.annotation.WebServlet;

/**
 *
 * @author ducdat
 */
@WebServlet(name = "Nguoidung_servlet", urlPatterns = {"/Nguoidung_servlet"})
public class Nguoidung_servlet extends HttpServlet {

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
            out.println("<title>Servlet Nguoidung_servlet</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet Nguoidung_servlet at " + request.getContextPath() + "</h1>");
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
        HttpSession session = request.getSession();
//        String delete = request.getParameter("idnv");
//        NguoiDung_Model nv_model = new NguoiDung_Model();
        if(request.getParameter("logout")!=null)
            {
                session.invalidate();
                response.sendRedirect("/QLCF/index.jsp");   
                return;
            }
//        if(request.getParameter("bangluong")!=null)
//        {
//            try {
//                nv_model.writeFileExcel();
//            } catch (WriteException ex) {
//                Logger.getLogger(NhanVien_servlet.class.getName()).log(Level.SEVERE, null, ex);
//            } catch (SQLException ex) {
//                Logger.getLogger(NhanVien_servlet.class.getName()).log(Level.SEVERE, null, ex);
//            }
//        }
//        nv_model.Delete(delete);
//        session.setAttribute("Thongbao", "Xóa thành công");
//        response.sendRedirect("Admin/QLNhanVien/NhanVien.jsp");
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
        try{
//            String result = request.getParameter("search");
            HttpSession session = request.getSession();
            Nguoidung_Model nd_model = new Nguoidung_Model();
            ArrayList<NguoiDung_DTO> list = new ArrayList<NguoiDung_DTO>();
            
           
            if (request.getParameter("login") != null) {
                String username = request.getParameter("username");
                String password = request.getParameter("password");
                NguoiDung_DTO result = nd_model.login(username, password);
                if (result != null) {
                    session.setAttribute("UID",result.getCus_account());
                    session.setAttribute("PLUS",result.getPlus());
                    session.setAttribute("POINT",result.getPoint_sum());
                    session.setAttribute("MEM_FLG","1");
                    response.sendRedirect("/QLCF/index.jsp");
                    return;
                }
                else
                {
                    session.invalidate();
                    response.sendRedirect("/QLCF/Auth/Login.jsp");
                    return;
                }
            }
            
//            if(result!=null)
//            {
//                list = nv_model.get_by_id(result);
//                session.setAttribute("result", list);
//                response.sendRedirect("/QLCF/Admin/QLNhanVien/KetQua.jsp");   
//                return;
//            }
            
            
            NguoiDung_DTO gv = new NguoiDung_DTO(); 
            //thêm vào csdl
//            gv.setTennv(request.getParameter("tennv"));
//            gv.setSdt(request.getParameter("sdt"));
//            gv.setDiachi(request.getParameter("diachi"));
//            gv.setTaikhoan(request.getParameter("taikhoan"));
//            gv.setMatkhau(request.getParameter("matkhau"));
//            gv.setNgaysinh(Date.valueOf(request.getParameter("ngaysinh")));
//            gv.setCapdo(Integer.parseInt(request.getParameter("capdo")));
//            if(request.getParameter("matkhau2")!=null)
//            {
//                if(request.getParameter("matkhau").equals(request.getParameter("matkhau2")))
//                {
//                    session.setAttribute("register", "success");
//                    nv_model.insert(gv);
//                    response.sendRedirect("/QLCF/index.jsp");  
//                    return;
//                }else
//                {
//                    session.setAttribute("register", "faild");
//                    response.sendRedirect("/QLCF/Auth/register.jsp");
//                    return;
//                }
//
//            }
//                
//            gv.setGiolam(Integer.parseInt(request.getParameter("giolam")));
//            gv.setLuong(Integer.parseInt(request.getParameter("giolam"))*8000);
//            if(request.getParameter("idnv")!=null){
//                gv.setId_nhanvien(Integer.parseInt(request.getParameter("idnv")));
//                if(nv_model.Update(gv))
//                {
//                    session.setAttribute("Thongbao", "Sửa thành công");
//                    response.sendRedirect("/QLCF/Admin/QLNhanVien/NhanVien.jsp");
//                    return;
//                }
//                else
//                {
//                    session.setAttribute("Thongbao", null);
//                    response.sendRedirect("/QLCF/Admin/QLNhanVien/NhanVien.jsp");
//                }
//            }
//            if(nv_model.insert(gv))
//            {
//                session.setAttribute("Thongbao", "Thêm thành công");
//                response.sendRedirect("/QLCF/Admin/QLNhanVien/NhanVien.jsp");   
//                return;
//            }else
//            {
//                session.setAttribute("Thongbao", null);
//                response.sendRedirect("/QLCF/Admin/QLNhanVien/NhanVien.jsp");
//            }
        }catch(Exception e)
        {
            response.sendRedirect("/QLCF/index.jsp");
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
