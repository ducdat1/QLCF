/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import DTO.ChiTietBan_DTO;
import Model.Ban_Model;
import Model.ChiTietBan_Model;
import Model.ThucUong_Model;
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
public class ChiTietBan_servlet extends HttpServlet {

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
            out.println("<title>Servlet ChiTietBan_servlet</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ChiTietBan_servlet at " + request.getContextPath() + "</h1>");
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
         ChiTietBan_Model ctb_model = new ChiTietBan_Model();
         if(request.getParameter("idctb")!=null)
         {
        String delete = request.getParameter("idctb");
        
        ctb_model.Delete(delete);
        session.setAttribute("Thongbao", "Xóa thành công");
        response.sendRedirect("/QLCF/User/ChiTietBan.jsp?idban="+request.getParameter("idban"));
        return;
         }
        if(request.getParameter("delete_all")!=null&&request.getParameter("idban")!=null)
        {
            ctb_model.delete_details(request.getParameter("idban"));
            response.sendRedirect("/QLCF/User/Cafe.jsp");
            return;
        }
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
            HttpSession session = request.getSession();
            ChiTietBan_Model ctb_model = new ChiTietBan_Model();
            Ban_Model ban_model = new Ban_Model();
            ArrayList<ChiTietBan_DTO> list = new ArrayList<ChiTietBan_DTO>();
            
           
           
            
            
             ChiTietBan_DTO ctb = new ChiTietBan_DTO();
            
            
            
        //thêm vào csdl
              
                
                ctb.setId_ban(Integer.parseInt(request.getParameter("idban")));
                ctb.setId_thucuong(Integer.parseInt(request.getParameter("idtu")));
                ctb.setSoluong_thucuong(Integer.parseInt(request.getParameter("soluong")));
                ctb.setThanhtien(ctb.getSoluong_thucuong()*Float.parseFloat(request.getParameter("giaban")));
                if(request.getParameter("idctb")!=null){
                    ctb.setId_chitiet_ban(Integer.parseInt(request.getParameter("idctb")));
               if(ctb_model.Update(ctb))
               {                   
                   ban_model.tinhtien(ctb_model.tongtien(request.getParameter("idban")), request.getParameter("idban"));
                   session.setAttribute("Thongbao", "Sửa thành công");
                   response.sendRedirect("/QLCF/User/ChiTietBan.jsp?idban="+request.getParameter("idban"));
                   return;
               }
                else
               {
                   session.setAttribute("Thongbao", null);
                   response.sendRedirect("/QLCF/User/ChiTietBan.jsp?idban="+request.getParameter("idban"));
               }}
               if(ctb_model.insert(ctb))
               {
                    ban_model.tinhtien(ctb_model.tongtien(request.getParameter("idban")), request.getParameter("idban"));
                   session.setAttribute("Thongbao", "Thêm thành công");
                   response.sendRedirect("/QLCF/User/ChiTietBan.jsp?idban="+request.getParameter("idban"));   
                   return;
               }else
               {
                   session.setAttribute("Thongbao", null);
                   response.sendRedirect("/QLCF/User/ChiTietBan.jsp?idban="+request.getParameter("idban"));
               }
        }catch(Exception e)
        {
            response.sendRedirect("/QLCF/User/ChiTietBan.jsp?idban="+request.getParameter("idban"));
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
