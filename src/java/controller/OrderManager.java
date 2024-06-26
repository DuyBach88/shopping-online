/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package controller;

import dal.DAOOrder;
import dal.DAOOrderItem;
import entity.Account;
import entity.Order;
import entity.OrderItem;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.Vector;

/**
 *
 * @author HP
 */
@WebServlet(name="OrderManager", urlPatterns={"/orderManager"})
public class OrderManager extends HttpServlet {
   
    /** 
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code> methods.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        DAOOrder o = new DAOOrder();
        String service = request.getParameter("Service");
        
        if(service == null) {
         service = "getAll";
        }
        
        if(service.equals("getAll")) {
          Vector<Order> listOrder = o.getAllOrder();
          request.setAttribute("listOrder", listOrder);
          request.getRequestDispatcher("views/OrderManager.jsp").forward(request, response);
        }
        
        if (service.equals("searchOrder")) {
            int oid = -1;
            String pid_raw = request.getParameter("searchId");
            try {
                oid = Integer.parseInt(pid_raw);
            } catch (NumberFormatException e) {
                oid = -1;
            }
            Order order = o.getOrderById(oid);
            //if not found will return the get all order
            Vector<Order> listOrder = new Vector<>();
            if (order == null) {
                request.setAttribute("mess", "Not found this product");
                listOrder = o.getAllOrder();
            } else {
                //if have order found will add to list
                listOrder.add(order);
            }
            request.setAttribute("listOrder", listOrder);
            request.setAttribute("valueSearch", pid_raw);
            request.getRequestDispatcher("/views/OrderManager.jsp").forward(request, response);
        }
        if(service.equals("searchByStatus")) {
          String status = request.getParameter("status");
          Vector<Order> listOrder = o.getOrderByStatus(status);
          request.setAttribute("listOrder", listOrder);
          request.setAttribute("statusSearch", status);
          request.getRequestDispatcher("/views/OrderManager.jsp").forward(request, response);
        }
        
        if (service.equals("updateStatus")) {
            String oId_raw = request.getParameter("oId");
            int oId = Integer.parseInt(oId_raw);
            String status = request.getParameter("status");
            
            boolean n = o.updateStatusOrder(status, oId);
            if (n) {
                request.setAttribute("mess", "update success");
            } else {
                request.setAttribute("mess", "update unsuccess");
            }
            response.sendRedirect("orderManager");
        }
        
        if(service.equals("detailOrder")) {
         String orderId_raw = request.getParameter("OId");
         int orderId = Integer.parseInt(orderId_raw);
         DAOOrderItem DOI = new DAOOrderItem();
         Vector<OrderItem> orderDetails = DOI.getOrderDetail(orderId);
         request.setAttribute("orderDetails", orderDetails);
         request.setAttribute("OrderId", orderId);
         request.setAttribute("customer", o.getCustomerByOderId(orderId));
         request.getRequestDispatcher("views/OrderDetail.jsp").forward(request, response);
        }
    } 

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /** 
     * Handles the HTTP <code>GET</code> method.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        HttpSession session = request.getSession();
        Account acc = (Account) session.getAttribute("account");
        if (acc != null) {
            if (acc.getIs_admin()) {
                processRequest(request, response);
            } else {
                response.sendRedirect("ProductURL");
            }
        } else {
            response.sendRedirect("login");
        }
    } 

    /** 
     * Handles the HTTP <code>POST</code> method.
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
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

    public static void main(String[] args) {
        DAOOrderItem DOI = new DAOOrderItem();
        Vector<OrderItem> list = DOI.getOrderDetail(7);
        for (OrderItem orderItem : list) {
            System.out.println(orderItem);
        }
    }
}
