/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package controller;

import dal.DAOAccount;
import dal.DAOOrder;
import dal.DAOOrderItem;
import entity.Account;
import entity.Order;
import entity.OrderItem;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.sql.SQLException;
import java.util.Vector;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

/**
 *
 * @author HP
 */
public class ProfileServlet extends HttpServlet {
   
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
        HttpSession session = request.getSession();
        String[] listService = {"Account info", "My order", "Change password"};
        request.setAttribute("listService", listService);
        
        Account acc = (Account)session.getAttribute("account");
        String service = request.getParameter("Service");
        
        if (acc != null) {
            if (service == null) {
                service = listService[0];
            }
            
            if(service.equals(listService[1])) {
                DAOOrderItem doi = new DAOOrderItem();
                DAOOrder dorder = new DAOOrder();
                int accId = acc.getAccount_id();
                Vector<Order> myOrder = dorder.getAllOrderByAccount(accId);
                Vector<OrderItem> orderItems = doi.getAllOrderDetail();
                request.setAttribute("myOrder", myOrder);
                request.setAttribute("myOrderItem", orderItems);
            }
            request.setAttribute("current", service);
            request.getRequestDispatcher("views/Profile.jsp").forward(request, response);
            return;
        } else {
         response.sendRedirect("login");
        }
        
    } 
//    private void setCommonAttributes(HttpServletRequest request, DAOProduct d) throws SQLException {
//        
//    }
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
        processRequest(request, response);
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
        DAOAccount d = new DAOAccount();
        String service = request.getParameter("Service");
        HttpSession session = request.getSession();
        Account acc = (Account) session.getAttribute("account");
        String mess = "";
        boolean haveUpdate = false;
        if (service.equals("updateInfo")) {
            String first_name = request.getParameter("first_name");
            String last_name = request.getParameter("last_name");
            String account_email = request.getParameter("account_email");
            String account_address = request.getParameter("account_address");
            String account_phone = request.getParameter("account_phone");
            if(first_name.isEmpty() || last_name.isEmpty() || account_address.isEmpty()
                    || account_phone.isEmpty()) {
              mess = "please fill all of field";
            } else {
                if(!isValidPhoneNumber(account_phone)) {
                mess = "phone number invalid";
                } else {
                haveUpdate = d.updateAccount(
                        acc.getAccount_id(), account_email, first_name, last_name,
                        account_phone, account_address
                );
                mess = "update success";
                Account updatedAccount = d.getAccountById(acc.getAccount_id());
                session.removeAttribute("account");
                session.setAttribute("account", updatedAccount);
                }
            }
            
            request.setAttribute("mess", mess);
            request.setAttribute("isSuccess", haveUpdate);
            setCommonAttributes(request, d);
            request.setAttribute("current", "Account info");
            request.getRequestDispatcher("views/Profile.jsp").forward(request, response);
        }
        if (service.equals("updatePassword")) {
            String currentPassword = request.getParameter("currentPassword");
            String newPassword = request.getParameter("newPassword");
            String confirmPassword = request.getParameter("confirmPassword");
            //check currentPassword
            if (acc == null) {
                response.sendRedirect("login");
            } else {
                if (d.validateCustomer(acc.getEmail(), currentPassword) != null) {
                    if (newPassword.equals(confirmPassword)) {
                        d.updatePassword(newPassword, acc.getAccount_id());
                        mess = "Change password success";
                        haveUpdate = true;
                    } else {
                        mess = "The confirm password incorrect";
                    }
                } else {
                    mess = "The current password incorrect";
                }
                request.setAttribute("mess", mess);
                setCommonAttributes(request, d);
                request.setAttribute("isSuccess", haveUpdate);
                request.setAttribute("current", "Change password");
                request.getRequestDispatcher("views/Profile.jsp").forward(request, response);
            }
        }
    }
 private void setCommonAttributes(HttpServletRequest request, DAOAccount d) {
         String[] listService = {"Account info", "My order", "Change password"};
         request.setAttribute("listService", listService);
    }
 
   public boolean isValidPhoneNumber(String phoneNumber) {
        Pattern pattern = Pattern.compile("^\\d{10}$");
        Matcher matcher = pattern.matcher(phoneNumber);
        return matcher.matches();
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
        DAOOrderItem doi = new DAOOrderItem();
                DAOOrder dorder = new DAOOrder();
                Vector<Order> myOrder = dorder.getAllOrderByAccount(2);
                for (Order order : myOrder) {
                    System.out.println(order);
        }
    }
}
