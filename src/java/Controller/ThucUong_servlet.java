/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import DTO.NhanVien_DTO;
import DTO.ThucUong_DTO;
import Model.*;
import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.io.FileOutputStream;
import java.io.InputStream;
import java.io.OutputStream;
import static java.lang.System.out;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;
/**
 *
 * @author ducdat
 */
@MultipartConfig(fileSizeThreshold = 1024 * 1024 * 2,
        maxFileSize = 1024 * 1024 * 10,
        maxRequestSize = 1024 * 1024 * 50)
public class ThucUong_servlet extends HttpServlet {
    private static final String  UPLOAD_DIR = "images/thucuong";
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
            out.println("<title>Servlet ThucUong_servlet</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ThucUong_servlet at " + request.getContextPath() + "</h1>");
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
        String delete = request.getParameter("idtu");
        ThucUong_Model tu_model = new ThucUong_Model();
        
        tu_model.Delete(delete);
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

        try{
            HttpSession session = request.getSession();
            ThucUong_Model tu_model = new ThucUong_Model();
//            ArrayList<ThucUong_DTO> list = new ArrayList<ThucUong_DTO>();
            
//            String result = request.getParameter("search");           
//            if(result!=null)
//            {
//                list = tu_model.get_by_id(result);
//                session.setAttribute("result", list);
//                response.sendRedirect("/QLCF/Admin/QLThucUong/KetQua.jsp");   
//                return;
//            }
//            ThucUong_DTO gv = new ThucUong_DTO();


              //thêm vào csdl            
            if("confirm".equals(request.getParameter("update")))
            {
                
                Part filePart = request.getPart("file");
                String fileName = (String) getFileName(filePart);
                ThucUong_DTO gv = new ThucUong_DTO(Integer.parseInt(request.getParameter("thucuong_id")),
                                                   request.getParameter("tentu"),
                                                   Integer.parseInt(request.getParameter("giaban")),
                                                   1,
                                                   fileName,
    //                                               request.getPart("file"),
                                                   request.getParameter("note"),
                                                   Integer.parseInt(request.getParameter("discount")),
                                                   request.getParameter("size"),
                                                   request.getParameter("bonus1"),
                                                   request.getParameter("bonus2")
                                                   );
                if(request.getParameter("thucuong_id")!=null){
                    if(tu_model.Update(gv))
                    {
                        uploadFile(request);
                        session.setAttribute("Thongbao", "Sửa thành công");
                        response.sendRedirect("/QLCF/Admin/QLThucUong/ThucUong.jsp");
                    }
                    else
                    {
                        session.setAttribute("Thongbao", null);
                        response.sendRedirect("/QLCF/Admin/QLThucUong/ThucUong.jsp");
                    }               
                }
                else{
                    System.out.print("failed");
                }
            }
            //insert new drink
            if("insert".equals(request.getParameter("form")))
            {
                Part filePart = request.getPart("file");
                String fileName = (String) getFileName(filePart);
                ThucUong_DTO gv = new ThucUong_DTO();      
                gv.setTen_thucuong(request.getParameter("tentu"));
                gv.setGiaban(Integer.parseInt(request.getParameter("giaban")));
                gv.seturl_image(fileName);
                gv.setnote(request.getParameter("note"));
                gv.setsize(request.getParameter("size"));
                gv.setextra1(request.getParameter("bonus1"));
                gv.setextra2(request.getParameter("bonus2"));
                if(tu_model.insert(gv))
                {
                    String uploadFile = uploadFile(request);
                    session.setAttribute("Thongbao", "Thêm thành công");
                    response.sendRedirect("/QLCF/Admin/QLThucUong/ThucUong.jsp");   
                }else
                {
                    session.setAttribute("Thongbao", null);
                    response.sendRedirect("/QLCF/Admin/index.jsp");
                }
            }
        }catch(IOException | NumberFormatException e)
        {
            response.sendRedirect("/QLCF/Admin/index.jsp");
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
    private String uploadFile(HttpServletRequest request) throws IOException, ServletException{
        String fileName="";
        try{
            String tentu = request.getParameter("tentu");
            Part filePart = request.getPart("file");
            fileName = (String) getFileName(filePart);
            String applicationPath = request.getServletContext().getRealPath("");
            String basePath = applicationPath + File.separator + UPLOAD_DIR + File.separator;
            InputStream inputStream = null;
            OutputStream outputStream = null;
            try {
                File outputFilePath = new  File(basePath + fileName);
                inputStream = filePart.getInputStream();
                outputStream = new FileOutputStream(outputFilePath);
                int read = 0;
                final byte[] bytes =  new  byte[1024];
                while((read = inputStream.read(bytes)) != -1){
                    outputStream.write(bytes, 0, read);
                }
            } catch (Exception e) {
                e.printStackTrace();
                fileName = "";
            }finally{
                if(inputStream != null){
                    inputStream.close();
                }
                if(outputStream != null){
                    outputStream.close();
                }
            }
            
        }catch(Exception e){
            fileName = "";
        }
        return fileName;
    }
    private String  getFileName(Part part){
        final String  partHeader = part.getHeader("content-disposition");
        System.out.println("*****partHeader :"+ partHeader);
        for(String content : part.getHeader("content-disposition").split(";")){
            if(content.trim().startsWith("filename")){
                return content.substring(content.indexOf('=')+1).trim().replace("\"", "" );
            }
        }
        
        return null;
    }

}
