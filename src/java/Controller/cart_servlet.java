/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import DTO.ThucUong_DTO;
import Model.ThucUong_Model;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Set;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author ducdat
 */
public class cart_servlet extends HttpServlet {
    ArrayList list_id = new ArrayList();
    HashMap<String, Integer> hashMap = new HashMap<>();
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
            out.println("<title>Servlet cart_servlet</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet cart_servlet at " + request.getContextPath() + "</h1>");
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
//        processRequest(request, response);
        try{
            HttpSession session = request.getSession();
            int sum_cart;
            if(session.getAttribute("sum_cart") != null)
            {
                sum_cart = (int)session.getAttribute("sum_cart");
            }
            else
            {
                sum_cart = 0;
            }
            String id_thucuong = request.getParameter("idthucuong").trim();
            if( ( id_thucuong == null || "".equals(id_thucuong) ) ){
               session.setAttribute("sum_cart",sum_cart);
               response.setContentType("text/plain");
               response.getWriter().print(sum_cart);
            }
            else if( id_thucuong != null )
            { 
//              list_id.add(id_thucuong);
                ThucUong_Model tc_model = new ThucUong_Model();
                ArrayList<ThucUong_DTO> list = new ArrayList<>();                
                if(hashMap.get(id_thucuong) == null){
                    hashMap.put(id_thucuong, 1);
                }else{
                    hashMap.put(id_thucuong, hashMap.get(id_thucuong)+1);
                }
                Set<String> keySet = hashMap.keySet();
                for (String key : keySet) {
//                    if(id_thucuong.equals(key)){
                        ThucUong_DTO tudto = tc_model.get_to_cart(key);
                        tudto.setSoluong(hashMap.get(key));
                        list.add(tudto);
//                    }
                }
                    
                session.setAttribute("list_cart",list);
                sum_cart = sum_cart + 1;
                session.setAttribute("sum_cart",sum_cart);
                response.setContentType("text/plain");
                response.getWriter().print(sum_cart);
            }
            
        }catch(IOException e){
            System.out.print(e);
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
        HttpSession session = request.getSession();
        String cartempty = request.getParameter("cartempty").trim();
        if(cartempty != null){
            hashMap.clear();
            session.invalidate();
            response.setContentType("text/plain");
            response.getWriter().print(0);
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
