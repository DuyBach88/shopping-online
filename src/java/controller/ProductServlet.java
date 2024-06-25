/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dal.DAOBrand;
import dal.DAOCategory;
import dal.DAOProduct;
import entity.Brand;
import entity.Category;
import entity.Product;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.sql.SQLException;
import java.util.Vector;

/**
 *
 * @author HP
 */
@WebServlet(name = "ProductServlet", urlPatterns = {"/ProductURL"})
public class ProductServlet extends HttpServlet {

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
        PrintWriter out = response.getWriter();
        DAOProduct d = new DAOProduct();
        try {
            String service = request.getParameter("Service");
            if (service == null) {
                service = "getAll";
            }
            
            //default will getAll
            if (service.equals("getAll")) {
                Vector<Product> list = d.getAllProduct(null);
                request.setAttribute("listProduct", list);
                setCommonAttributes(request, d);
                request.getRequestDispatcher("/views/Home.jsp").forward(request, response);
            }
            //default will getAll
            if (service.equals("orderBy")) {
                String order = request.getParameter("value");
                Vector<Product> list = d.getAllProduct(order);
                request.setAttribute("listProduct", list);
                request.setAttribute("order", order);
                setCommonAttributes(request, d);
                request.getRequestDispatcher("/views/Home.jsp").forward(request, response);
            }
            
            //filter product
            if (service.equals("filter")) {
                Vector<Product> list = new Vector<>();
                String categoryId = request.getParameter("cid");
                
                request.setAttribute("category_select", categoryId);
                list = d.search(Integer.parseInt(categoryId));
                    
                setCommonAttributes(request, d);
                request.setAttribute("listProduct", list);
                request.getRequestDispatcher("/views/Home.jsp").forward(request, response);
            }

            //dieu huong den trang product detail
            if(service.equals("ProductDetail")) {
             String pid_raw = request.getParameter("Pid");
             int pid = Integer.parseInt(pid_raw);
             Product currentP = d.getProductById(pid);
             request.setAttribute("currentProduct", currentP);
             request.getRequestDispatcher("/views/ProductDetail.jsp").forward(request, response);
            }
            //tra ve danh sach product co like name
            if (service.equals("search")) {
              String nameTxt = request.getParameter("keyword");
              Vector<Product> list = d.getProductByName(nameTxt);
              request.setAttribute("listProduct", list);
              setCommonAttributes(request, d);
              request.getRequestDispatcher("/views/Home.jsp").forward(request, response);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
    }

    private void setCommonAttributes(HttpServletRequest request, DAOProduct d) throws SQLException {
        DAOCategory dCat = new DAOCategory();
        DAOBrand dbrand = new DAOBrand();
        Vector<Brand> list_brand = dbrand.getAllBrand();
        Vector<Category> list_category = dCat.getAllCategory();
        int[] Listdiscount = {1, 10, 20, 30, 40};
        request.setAttribute("listBrand", list_brand);
        request.setAttribute("listCategory", list_category);
        request.setAttribute("ListDiscount", Listdiscount);
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
        processRequest(request, response);
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
        processRequest(request, response);
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
//        Vector<Brand> list_brand = dbrand.getAllBrand();

    public static void main(String[] args) throws SQLException {
       DAOProduct d = new DAOProduct();
       System.out.println(d.getAllProduct("desc"));
    }
}
