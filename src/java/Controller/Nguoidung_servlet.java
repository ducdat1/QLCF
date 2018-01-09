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
        response.setContentType("text/html;charset=UTF-8");
        request.setCharacterEncoding("utf-8");
        HttpSession session = request.getSession();
        if(request.getParameter("logout")!=null)
            {
                session.removeAttribute("UID");
                session.removeAttribute("USERNAME");
                session.removeAttribute("PLUS");
                session.removeAttribute("POINT");
                session.removeAttribute("MEM_FLG");
                response.sendRedirect("/QLCF/Auth/Login.jsp");   
            }
         if("Register".equals(request.getParameter("Register")))
            {
                String f_name = request.getParameter("firstname");
                String l_name = request.getParameter("lastname");
                String email = request.getParameter("email");
                String account = request.getParameter("account");
                String password = request.getParameter("password");
                Nguoidung_Model nd_model = new Nguoidung_Model();
                NguoiDung_DTO nd_DTO = new NguoiDung_DTO();
                nd_DTO.setFirstname(f_name);
                nd_DTO.setLastname(l_name);
                nd_DTO.setCus_email(email);
                nd_DTO.setCus_account(account);
                nd_DTO.setCus_password(password);
                Boolean chk_ins = nd_model.insert(nd_DTO);
                if(chk_ins == true){
                    session.setAttribute("FLG","success001");
                    response.sendRedirect("/QLCF/index.jsp");
                }else if(chk_ins == false){
                    session.setAttribute("ANS",nd_DTO);
                    session.setAttribute("FLG","fail001"); 
                    response.sendRedirect("/QLCF/Auth/register.jsp");
                }
            }
          if("Buy".equals(request.getParameter("btnadd")))
            {
                if(session.getAttribute("UID") != null){
                    int uid = (int)session.getAttribute("UID");
                    Nguoidung_Model nd_model = new Nguoidung_Model();
                    NguoiDung_DTO ngdung = nd_model.get_info(String.valueOf(uid));
                    int U_Point = ngdung.getPoint_sum();
                    int T_Point;
                    String value = request.getParameter("point");
                    int val = Integer.parseInt(value);
                    switch(val){
                        case 1:
                            T_Point = U_Point + 50000;
                            break;
                        case 2:
                            T_Point = U_Point + 100000;
                            break;
                        case 3:
                            T_Point = U_Point + 200000;
                            break;
                        case 4:
                            T_Point = U_Point + 300000;
                            break;
                        case 5:
                            T_Point = U_Point + 500000;
                            break;
                        case 6:
                            T_Point = U_Point + 1000000;
                            break;
                        case 7:
                            T_Point = U_Point + 2000000;
                            break;
                        default:
                            T_Point = U_Point;break;
                    }
                    ngdung.setPoint_sum(T_Point);
                    // add info to DB
                    if(nd_model.Update_point(ngdung)){
                        session.setAttribute("FLG","success001");
                        response.sendRedirect("/QLCF/Auth/buy_point.jsp");
                    }else{
                        session.setAttribute("FLG","fail001"); 
                        response.sendRedirect("/QLCF/Auth/buy_point.jsp");
                    }
                }
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
        try{
            HttpSession session = request.getSession();
            Nguoidung_Model nd_model = new Nguoidung_Model();
            ArrayList<NguoiDung_DTO> list = new ArrayList<>();
                       
            if (request.getParameter("login") != null) {
                String username = request.getParameter("username");
                String password = request.getParameter("password");
                NguoiDung_DTO result = nd_model.login(username, password);
                if (result != null) {
                    session.setAttribute("UID",result.getId_customer());
                    session.setAttribute("USERNAME",result.getCus_account());
                    session.setAttribute("PLUS", result.getPlus());
                    session.setAttribute("POINT",result.getPoint_sum());
                    session.setAttribute("MEM_FLG","1");
                    String auth_return = (String)session.getAttribute("auth_return");
                    if(auth_return != null){
                       response.sendRedirect(auth_return);
                       return; 
                    }else{
                       response.sendRedirect("/QLCF/index.jsp");
                       return; 
                    }
                    
                }
                else
                {
                    session.removeAttribute("UID");
                    session.removeAttribute("USERNAME");
                    session.removeAttribute("PLUS");
                    session.removeAttribute("POINT");
                    session.removeAttribute("MEM_FLG");
                    response.sendRedirect("/QLCF/Auth/Login.jsp");
                    return;
                }
            }
        
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
        }catch(IOException e)
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
