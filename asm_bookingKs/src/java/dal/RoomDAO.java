/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import static constant.constant.RECORD_PER_PAGE;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import model.ResponseRoom;
import model.ResponseRoomDetails;
import model.Room;
import model.RoomImage;
import utils.GetDataUtils;

/**
 *
 * @author TNO
 */
public class RoomDAO extends DBContext {

    private PreparedStatement ps;
    private ResultSet rs;
    private List<ResponseRoom> listRoom;
    private List<RoomImage> imageRoom;

    public RoomDAO() {
        listRoom = new ArrayList<>();
        imageRoom = new ArrayList<>();
    }

    public int findTotalRecord(int statusInput) {
        String sql = "select count(r.rid) from Room r\n"
                + "where r.[status] = ?";
        try (Connection connection = new DBContext().connection) {
            ps = connection.prepareStatement(sql);
            ps.setInt(1, statusInput);

            rs = ps.executeQuery();

            if (rs.next()) {
                return rs.getInt(1);
            }
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        } finally {
            DBContext.closeResultSetAndStatement(rs, ps);
        }
        return -1;

    }

    public List<ResponseRoom> findRoomByPage(int page, int statusInput) {
        String sql = "select r.rid, r.hotel_id, r.[name], r.[description], r.price, r.[status], h.[name], r.adultAmount, r.childAmount, r.thumbnail from Room r\n"
                + "join Hotel h\n"
                + "on r.hotel_id = h.id\n"
                + "where r.[status] = ?\n"
                + "order by r.rid\n"
                + "OFFSET ? ROWS\n"
                + "FETCH NEXT ? ROWS ONLY";
        try (Connection connection = new DBContext().connection) {
            ps = connection.prepareStatement(sql);
            ps.setInt(1, statusInput);
            ps.setInt(2, (page - 1) * RECORD_PER_PAGE);
            ps.setInt(3, RECORD_PER_PAGE);

            rs = ps.executeQuery();

            while (rs.next()) {
                int id = rs.getInt(1);
                int hotel_id = rs.getInt(2);
                String name = rs.getString(3);
                String description = rs.getString(4);
                int price = rs.getInt(5);
                boolean status = rs.getBoolean(6);
                String hotelName = rs.getString(7);
                int adultAmount = rs.getInt(8);
                int childAmount = rs.getInt(9);
                String thumbnail = rs.getString(10);

                ResponseRoom responseRoom = new ResponseRoom(id, hotel_id, name, description,
                        GetDataUtils.formatToVietnamCurrency(price), status, hotelName,
                        adultAmount, childAmount, thumbnail);

                listRoom.add(responseRoom);
            }

        } catch (SQLException e) {
            System.out.println(e.getMessage());
        } finally {
            DBContext.closeResultSetAndStatement(rs, ps);
        }

        return listRoom;

    }

    public ResponseRoom findRoomByID(int idInput) {
        String sql = "select r.rid, r.hotel_id, r.[name], r.[description], r.price, r.[status], r.adultAmount, \n"
                + "r.childAmount, r.thumbnail,h.[name], h.[address], h.phone_number, h.rating from Room r\n"
                + "join Hotel h\n"
                + "on r.hotel_id = h.id\n"
                + "where r.[status] = 1 and r.rid = ?";
        ResponseRoom room = null;
        try (Connection connection = new DBContext().connection) {
            ps = connection.prepareStatement(sql);
            ps.setInt(1, idInput);

            rs = ps.executeQuery();

            if (rs.next()) {
                int id = rs.getInt(1);
                int hotel_id = rs.getInt(2);
                String name = rs.getString(3);
                String description = rs.getString(4);
                int price = rs.getInt(5);
                boolean status = rs.getBoolean(6);
                int adultAmount = rs.getInt(7);
                int childAmount = rs.getInt(8);
                String thumbnail = rs.getString(9);
                String hotelName = rs.getString(10);
                String address = rs.getString(11);
                String phone = rs.getString(12);
                int rating = rs.getInt(13);

                room = new ResponseRoomDetails(address, phone, rating, id, hotel_id, name,
                        description, GetDataUtils.formatToVietnamCurrency(price), status,
                        hotelName, adultAmount, childAmount, thumbnail);

            }

        } catch (SQLException e) {
            System.out.println(e.getMessage());
        } finally {
            DBContext.closeResultSetAndStatement(rs, ps);
        }
        return room;
    }

    public static void main(String[] args) {
        RoomDAO r = new RoomDAO();

        ResponseRoom room = r.findRoomByID(1);

        System.out.println(room);
    }

    public List<RoomImage> findImageRoomByID(int idInput) {
        String sql = "select * from RoomImage ri\n"
                + "where ri.room_id = ?";

        RoomImage image = null;

        try (Connection connection = new DBContext().connection) {
            ps = connection.prepareStatement(sql);
            ps.setInt(1, idInput);

            rs = ps.executeQuery();

            while (rs.next()) {
                int id = rs.getInt(1);
                String imgage = rs.getString(2);
                int idRoom = rs.getInt(3);

                image = new RoomImage(id, imgage, idRoom);

                imageRoom.add(image);
            }

        } catch (SQLException e) {
            System.out.println(e.getMessage());
        } finally {
            DBContext.closeResultSetAndStatement(rs, ps);
        }
        return imageRoom;
    }
}
