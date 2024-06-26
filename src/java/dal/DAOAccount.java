/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import entity.Account;
import entity.Product;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Vector;

/**
 *
 * @author HP
 */
public class DAOAccount extends DBConnect {
    //hien thi ban hang
  public Vector<Account> getAllAccount() {
    String sql = "SELECT * FROM accounts WHERE 1=1";
    Vector<Account> list = new Vector<>();

    try (PreparedStatement st = connection.prepareStatement(sql)){
        try(ResultSet rs = st.executeQuery()) {
        while (rs.next()) {
            Account cus = new Account(
                    rs.getInt("account_id"), 
                    rs.getString("first_name"),
                    rs.getString("last_name"),
                    rs.getString("phone"),
                    rs.getString("email"),
                    rs.getString("password"),
                    rs.getString("account_image"),
                    rs.getString("address"),
                    rs.getBoolean("is_admin"),
                    rs.getBoolean("active")
            );
            list.add(cus);
         }
        }

    } catch (SQLException e) {
        System.out.println(e);
    }

    return list;
}

    
    public Account getAccountById(int id) {
        String sql = "SELECT * FROM accounts WHERE account_id = ?";
        Account cus = null;
         try (PreparedStatement st = connection.prepareStatement(sql)) {
            st.setInt(1, id);
           try(ResultSet rs = st.executeQuery()) {
            while (rs.next()) {
                cus = new Account(
                        rs.getInt("account_id"), 
                        rs.getString("first_name"),
                        rs.getString("last_name"),
                        rs.getString("phone"),
                        rs.getString("email"),
                        rs.getString("password"),
                        rs.getString("account_image"),
                        rs.getString("address"),
                        rs.getBoolean("is_admin"),
                        rs.getBoolean("active")
                );
              }
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return cus;
    }
    
    public Account getAccountByEmail(String email) {
        String sql = "SELECT * FROM accounts WHERE email = ?";
        Account cus = null;
        try (PreparedStatement st = connection.prepareStatement(sql)) {
            st.setString(1, email);
            try(ResultSet rs = st.executeQuery()) {
            while (rs.next()) {
                cus = new Account(
                        rs.getInt("account_id"), 
                        rs.getString("first_name"),
                        rs.getString("last_name"),
                        rs.getString("phone"),
                        rs.getString("email"),
                        rs.getString("password"),
                        rs.getString("account_image"),
                        rs.getString("address"),
                        rs.getBoolean("is_admin"),
                        rs.getBoolean("active")
                );
             }
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return cus;
    }
    public Account validateCustomer(String email, String password) {
        String sql = "SELECT * FROM accounts where email = ? and password = ?";
        Account acc =  null;
        try(PreparedStatement st = connection.prepareStatement(sql)) {
            st.setString(1, email);
            st.setString(2, password);
            try(ResultSet rs = st.executeQuery()) {
            while (rs.next()) {
                acc = new Account(
                        rs.getInt("account_id"), 
                        rs.getString("first_name"),
                        rs.getString("last_name"),
                        rs.getString("phone"),
                        rs.getString("email"),
                        rs.getString("password"),
                        rs.getString("account_image"),
                        rs.getString("address"),
                        rs.getBoolean("is_admin"),
                        rs.getBoolean("active")
                );
              }
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return acc;
    }
 public String validateCustomerstl(String email, String password) {
        String sql = "SELECT * FROM accounts where email = '"+email+"' and password = "+password;
        return sql;
    }

    public boolean updatePassword(String newPassword, int accountId) {
        String sql = "UPDATE [dbo].[accounts]\n"
                + " SET [password] = ?\n"
                + " WHERE [account_id] = ?";
        int n = 0;
        try (PreparedStatement st = connection.prepareStatement(sql)){
            st.setString(1, newPassword);
            st.setInt(2, accountId);
            n = st.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
        return n > 0;
    }
    
    public void updateAccountImg(String newImg, int accountId) {
        String sql = "UPDATE [dbo].[accounts]\n"
                + " SET [account_image] = ?\n"
                + " WHERE [account_id] = ?";
        int n = 0;
        try (PreparedStatement st = connection.prepareStatement(sql)){
            st.setString(1, newImg);
            st.setInt(2, accountId);
            n = st.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }
    
    public boolean updateAccount(int account_id, String email, String first_name, 
        String last_name, String phone, String address) {
        String sql = "UPDATE [dbo].[accounts]\n"
                + "   SET [email] = ?\n"
                + "      ,[first_name] = ?\n"
                + "      ,[last_name] = ?\n"
                + "      ,[phone] = ?\n"
                + "      ,[address] = ?\n"
                + " WHERE [account_id] = ?";
        int n = 0;
        try (PreparedStatement st = connection.prepareStatement(sql)){
            st.setString(1, email);
            st.setString(2, first_name);
            st.setString(3, last_name);
            st.setString(4, phone);
            st.setString(5, address);
            st.setInt(6, account_id);
            n = st.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
        return n > 0;
    }
    
    public boolean addAccount(Account acc) {
        String sql = "INSERT INTO [dbo].[accounts]\n"
                + "           ([account_id]\n"
                + "           ,[email]\n"
                + "           ,[first_name]\n"
                + "           ,[last_name]\n"
                + "           ,[phone]\n"
                + "           ,[password]\n"
                + "           ,[is_admin]\n"
                + "           ,[active])\n"
                + "     VALUES\n"
                + "           (?, ?, ?, ?, ?, ?, 0, 0)\n";
        int n = 0;
        try (PreparedStatement st = connection.prepareStatement(sql)){
            st.setInt(1, acc.getAccount_id());
            st.setString(2, acc.getEmail());
            st.setString(3, acc.getFirst_name());
            st.setString(4, acc.getLast_name());
            st.setString(5, acc.getPhone());
            st.setString(6, acc.getPassword());
            n = st.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
        return n > 0;
    }
}
