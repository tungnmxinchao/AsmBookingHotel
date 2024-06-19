/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

/**
 *
 * @author TNO
 */
import java.sql.*;
import model.Users;

public class UserDAO extends DBContext {

    private PreparedStatement ps;
    private ResultSet rs;

    public Users login(String usernameInput, String pass) {
        String sql = "select * from Users u\n"
                + "where u.username = ? and u.[password] = ? ";

        Users users = null;
        try (Connection connection = new DBContext().connection) {
            ps = connection.prepareStatement(sql);
            ps.setString(1, usernameInput);
            ps.setString(2, pass);

            rs = ps.executeQuery();

            if (rs.next()) {
                int id = rs.getInt(1);
                String username = rs.getString(2);
                String password = rs.getString(3);
                String fullName = rs.getString(4);
                String email = rs.getString(5);
                boolean gender = rs.getBoolean(6);
                String phone = rs.getString(7);
                String address = rs.getString(8);
                int role = rs.getInt(9);
                boolean status = rs.getBoolean(10);

                users = new Users(id, username, password, fullName, email, gender, phone, address, role, status);

            }
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        } finally {
            DBContext.closeResultSetAndStatement(rs, ps);
        }
        return users;
    }

}
