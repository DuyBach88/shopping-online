/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import entity.Product;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.Vector;

/**
 *
 * @author HP
 */
public class DAOProduct extends DBConnect {

    //hien thi ban hang
    public Vector<Product> getAllProduct(String orderType) throws SQLException {
        String sql = "Select * from Products P\n";
        if (orderType != null && !orderType.equals("")) {
            sql += " order by P.list_price " + orderType;
        }
        Vector<Product> list = new Vector<>();
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Product p = new Product(
                        rs.getInt("product_id"),
                        rs.getInt("discount"),
                        rs.getString("product_name"),
                        rs.getString("product_img"),
                        rs.getString("product_desc"),
                        rs.getDouble("list_price"),
                        rs.getDate("date_added"),
                        rs.getInt("quantity"),
                        rs.getInt("category_id")
                );
                list.add(p);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }

   
    public Vector<String> getAllCategory() {
        String sql = "select Distinct category_name from products";
        Vector<String> list = new Vector<>();
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                list.add(rs.getString("category_name"));
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }

    public Vector<String> getAllBrand() {
        String sql = "select Distinct brand_name from products";
        Vector<String> list = new Vector<>();
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                list.add(rs.getString("brand_name"));
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }

    public Product getProductById(int id) {
        String sql = "Select * from Products\n"
                + "WHERE product_id = ?";
        Product p = null;
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, id);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                p = new Product(
                        rs.getInt("product_id"),
                        rs.getInt("discount"),
                        rs.getString("product_name"),
                        rs.getString("product_img"),
                        rs.getString("product_desc"),
                        rs.getDouble("list_price"),
                        rs.getDate("date_added"),
                        rs.getInt("quantity"),
                        rs.getInt("category_id")
                );
                return p;
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return p;
    }

    public Vector<Product> getProductByName(String name) {
        String sql = "Select * from Products\n"
               +"WHERE product_name like N'%" + name + "%'";
        Vector<Product> list = new Vector<>();
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Product p = new Product(
                        rs.getInt("product_id"),
                        rs.getInt("discount"),
                        rs.getString("product_name"),
                        rs.getString("product_img"),
                        rs.getString("product_desc"),
                        rs.getDouble("list_price"),
                        rs.getDate("date_added"),
                        rs.getInt("quantity"),
                        rs.getInt("category_id")
                );
                list.add(p);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }

    public Vector<Product> search(int cateId) {
        Vector<Product> list = new Vector<>();
        String sql = "Select * from Products\n"
                + "where category_id = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, cateId);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Product p = new Product(
                        rs.getInt("product_id"),
                        rs.getInt("discount"),
                        rs.getString("product_name"),
                        rs.getString("product_img"),
                        rs.getString("product_desc"),
                        rs.getDouble("list_price"),
                        rs.getDate("date_added"),
                        rs.getInt("quantity"),
                        rs.getInt("category_id")
                );
                list.add(p);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }

        return list;
    }

    public boolean addProduct(Product pro) {
        String sql = "INSERT INTO [dbo].[products]\n"
                + "           ([product_id]\n"
                + "           ,[product_name]\n"
                + "           ,[list_price]\n"
                + "           ,[discount]\n"
                + "           ,[category_id]\n"
                + "           ,[brand_id]\n"
                + "           ,[product_img]\n"
                + "           ,[date_added]\n"
                + "           ,[product_desc]\n"
                + "           ,[quantity])\n"
                + "     VALUES(?, ?, ?, ?, ?, ?, ?, ?, ?, ?)\n";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, pro.getProduct_id());
            st.setString(2, pro.getProduct_name());
            st.setDouble(3, pro.getList_price());
            st.setDouble(4, pro.getDiscount());
            st.setInt(5, pro.getCategory_id());
            st.setInt(6, pro.getBrand_id());
            st.setString(7, pro.getProduct_img());
            st.setTimestamp(8, Timestamp.valueOf(getFormatDate()));
            st.setString(9, pro.getProduct_desc());
            st.setInt(10, pro.getQuantity());
            return st.executeUpdate() > 0;
        } catch (SQLException ex) {
            System.out.println(ex);
        }
        return false;
    }
    
     public String getFormatDate() {
        LocalDateTime myDateObj = LocalDateTime.now();  
        DateTimeFormatter myFormatObj = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss");  
        String formattedDate = myDateObj.format(myFormatObj);  
        return formattedDate;
   }
    public int updateProduct(Product pro) {
        String sql = "UPDATE [dbo].[products]\n"
                + "   SET [product_name] = ?\n"
                + "      ,[list_price] = ?\n"
                + "      ,[discount] = ?\n"
                + "      ,[category_id] = ?\n"
                + "      ,[product_img] = ?\n"
                + "      ,[date_added] = ?\n"
                + "      ,[product_desc] = ?\n"
                + "      ,[quantity] = ?\n"
                + " WHERE [product_id] = ?";
        int n = -1;
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, pro.getProduct_name());
            st.setDouble(2, pro.getList_price());
            st.setInt(3, pro.getDiscount());
            st.setInt(4, pro.getCategory_id());
            st.setString(5, pro.getProduct_img());
            st.setTimestamp(6, Timestamp.valueOf(getFormatDate()));
            st.setString(7, pro.getProduct_desc());
            st.setInt(8, pro.getQuantity());
            st.setInt(9, pro.getProduct_id());
            n = st.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
        return n;
    }

    public int deleteProduct(int pid) {
        String sql = "DELETE FROM [dbo].[products]\n"
                + " WHERE product_id = ?";
        int n = -1;
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, pid);
            n = st.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
        return n;
    }
    public static void main(String[] args) {
        DAOProduct d = new DAOProduct();
        System.out.println(d.getProductById(1));
    }
}
