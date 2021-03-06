/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import DTO.Ban_DTO;
import DTO.ChiTietBan_DTO;
import DTO.NguoiDung_DTO;
import DTO.ThucUong_DTO;
import Model.Ban_Model;
import Model.ChiTietBan_Model;
import Model.Nguoidung_Model;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author ducdat
 */
@WebServlet(name = "Muahang_servlet", urlPatterns = {"/Muahang_servlet"})
public class Muahang_servlet extends HttpServlet {

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
            out.println("<title>Servlet Muahang_servlet</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet Muahang_servlet at " + request.getContextPath() + "</h1>");
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
        HttpSession session = request.getSession();
        if(session.getAttribute("UID") != null){
            response.getWriter().print("This here");
            int uid = (int)session.getAttribute("UID");
            Nguoidung_Model nd_model = new Nguoidung_Model();
            NguoiDung_DTO ngdung = nd_model.get_info(String.valueOf(uid));
            int U_Point = ngdung.getPoint_sum();
            String U_Plus = ngdung.getPlus();
            String muahang = request.getParameter("muahang");
            int chk;
            response.getWriter().print(session.getAttribute("list_cart"));
            if ("true".equals(muahang) && (session.getAttribute("list_cart") != null)){
               
                ArrayList<ThucUong_DTO> list_tc = (ArrayList<ThucUong_DTO>)session.getAttribute("list_cart");
                double tong = 0; double n = 1; 
                for (ThucUong_DTO items : list_tc) {
                    if(items.getdiscount()== 1 && "New".equals(items.getextra1())){
                        n = 0.85;
                    }else{
                        n = 1;
                    }
                    tong = tong +(items.getSoluong()*items.getGiaban()*n);
                }
                int T_Point = (int)(U_Point - tong);
                response.getWriter().print(T_Point);
                response.getWriter().print(T_Point < 0);
                if(T_Point < 0){
                   response.sendRedirect("/QLCF/checkout/cart.jsp?Msg=PL001");
                }else{
                    Ban_Model banmd = new Ban_Model();
                    Ban_DTO bandto = new Ban_DTO();
                    bandto.setId_customer(uid);
                    int plus = Integer.parseInt(U_Plus);
                    double tt = tong;
                    if(plus > 50000){
                        tt = tt*0.9;
                    }else if(plus > 100000){
                        tt = tt*0.85;
                    }
                    bandto.setTongtien((int)tt);
                    chk = banmd.insert(bandto);
                    if(chk != 0){
                        for (ThucUong_DTO items : list_tc) {
                            ChiTietBan_DTO ctban = new ChiTietBan_DTO();
                            ctban.setId_ban(chk); 
                            ctban.setId_thucuong(items.getId_thucuong());
                            ctban.setSoluong_thucuong(items.getSoluong());
                            ctban.setThanhtien(items.getGiaban());
                            ChiTietBan_Model ctb_md = new ChiTietBan_Model();
                            ctb_md.insert(ctban);
                        }
                        U_Point = T_Point;
                        int bonus = (int)(tong/100);
                        U_Plus = String.valueOf((Integer.parseInt(U_Plus)) + bonus);
                        ngdung.setPlus(U_Plus);
                        ngdung.setPoint_sum(U_Point);
                        // add info to DB
                        if(nd_model.Update_point(ngdung)){
                            //update point and bonus
                           session.setAttribute("POINT",U_Point);
                           session.setAttribute("PLUS",U_Plus);
                           session.removeAttribute("list_cart");
                           session.removeAttribute("sum_cart");
                           response.sendRedirect("/QLCF/checkout/buy_thanks.jsp");
                        }else{
                           response.sendRedirect("/QLCF/checkout/cart.jsp");
                        }    
                    }else{
                        response.sendRedirect("/QLCF/checkout/cart.jsp"); 
                    }
                }                
            }else{
                response.sendRedirect("/QLCF/index.jsp");
            }
        }else
        {
            session.setAttribute("auth_return","/QLCF/checkout/confirm.jsp");
            response.sendRedirect("/QLCF/Auth/Login.jsp");
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
//        processRequest(request, response);
        
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
