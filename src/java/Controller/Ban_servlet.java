/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import DTO.Ban_DTO;
import Model.Ban_Model;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author ducdat
 */
public class Ban_servlet extends HttpServlet {

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
            out.println("<title>Servlet Ban_servlet</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet Ban_servlet at " + request.getContextPath() + "</h1>");
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
        String delete = request.getParameter("idban");
        Ban_Model ban_model = new Ban_Model();
        ban_model.Delete(delete);
        session.setAttribute("Thongbao", "Xóa thành công");
        response.sendRedirect("Admin/QLBan/Ban.jsp");
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
        //processRequest(request, response);
        try{
            String result = request.getParameter("search");
            HttpSession session = request.getSession();
            session.setAttribute("ThongBao", "ThanhCong");
            Ban_Model ban_model = new Ban_Model();
            ArrayList<Ban_DTO> list = new ArrayList<Ban_DTO>();
            if(result!=null)
            {
                list = ban_model.get_by_id(result);
                session.setAttribute("result", list);
                response.sendRedirect("/QLCF/Admin/QLBan/KetQua.jsp");   
                return;
            }
        //thêm vào csdl
                Ban_DTO ban = new Ban_DTO();
                ban.setTrangthai(0);
                   ban.setTongtien(0);
                if(request.getParameter("idban")!=null){
                ban.setId_ban(Integer.parseInt(request.getParameter("idban")));
               if(ban_model.Update(ban))
               {
                   ban.setTrangthai(Integer.parseInt(request.getParameter("trangthai")));
                   ban.setTongtien(Float.parseFloat(request.getParameter("tongtien")));
                   session.setAttribute("Thongbao", "Sửa thành công");
                   response.sendRedirect("/QLCF/Admin/QLBan/Ban.jsp");
                   return;
               }
               else
               {
                   session.setAttribute("Thongbao", null);
                   response.sendRedirect("/QLCF/Admin/QLBan/Ban.jsp");
               }}
               if(ban_model.insert(ban))
               {
                   session.setAttribute("Thongbao", "Thêm thành công");
                   response.sendRedirect("/QLCF/Admin/QLBan/Ban.jsp");   
                   return;
               }else
               {
                   session.setAttribute("Thongbao", null);
                   response.sendRedirect("/QLCF/Admin/QLBan/Ban.jsp");
               }
        }catch(Exception e)
        {
            System.out.print(e);
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
