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
import model.ResponseTrackBookingUser;
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
    private List<ResponseTrackBookingUser> listTrackBookingUser;

    public RoomDAO() {
        listRoom = new ArrayList<>();
        imageRoom = new ArrayList<>();
        listTrackBookingUser = new ArrayList<>();
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
        String sql = "select r.rid, r.hotel_id, r.[name], r.[description], r.price, r.[status], h.[name], r.adultAmount, r.childAmount, r.thumbnail, r.amountRoom from Room r\n"
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
                int amountRoom = rs.getInt(11);

                ResponseRoom responseRoom = new ResponseRoom(id, hotel_id, name, description,
                        GetDataUtils.formatToVietnamCurrency(price), status, hotelName,
                        adultAmount, childAmount, thumbnail, amountRoom);

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
                + "r.childAmount, r.thumbnail,r.amountRoom, h.[name], h.[address], h.phone_number, h.rating  from Room r\n"
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
                int amountRoom = rs.getInt(10);
                String hotelName = rs.getString(11);
                String address = rs.getString(12);
                String phone = rs.getString(13);
                int rating = rs.getInt(14);

                room = new ResponseRoomDetails(address, phone, rating, id, hotel_id,
                        name, description, GetDataUtils.formatToVietnamCurrency(price),
                        status, hotelName, adultAmount,
                        childAmount, thumbnail, amountRoom);

            }

        } catch (SQLException e) {
            System.out.println(e.getMessage());
        } finally {
            DBContext.closeResultSetAndStatement(rs, ps);
        }
        return room;
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

    public boolean insertBookingRoom(int roomID, int idUser, String checkinDate,
            String checkoutDate, int numberAdults, int numberChild,
            int numberRoom, int totalPice, String bookingDate) {
        String sql = "INSERT INTO [dbo].[Booking]\n"
                + "           ([room_id], [bookingBy], [check_in_date], [check_out_date], [booking_date], [quantity], [totalPrice], [status])\n"
                + "     VALUES (?, ?, ?, ?, ?, ?, ?, ?)";
        try (Connection connection = new DBContext().connection) {
            ps = connection.prepareStatement(sql);
            ps.setInt(1, roomID);
            ps.setInt(2, idUser);
            ps.setString(3, checkinDate);
            ps.setString(4, checkoutDate);
            ps.setString(5, bookingDate);
            ps.setInt(6, numberRoom);
            ps.setInt(7, totalPice);

            //status : 1 đang chờ admin phê duyệt
            ps.setInt(8, 1);

            int rowAffected = ps.executeUpdate();

            if (rowAffected > 0) {
                return true;
            }

        } catch (SQLException e) {
            System.out.println(e.getMessage());
        } finally {
            DBContext.closeResultSetAndStatement(rs, ps);
        }
        return false;
    }

    public List<ResponseTrackBookingUser> getListBookingUserByUserId(int idUser) {
        String sql = "select b.id, b.room_id, r.[name] as room_name, u.id as idUser, u.username, \n"
                + "b.check_in_date, b.check_out_date, b.booking_date, b.quantity, \n"
                + "b.totalPrice, r.adultAmount, r.childAmount, b.[status] from Booking b\n"
                + "join Room r\n"
                + "on b.room_id = r.rid\n"
                + "join Users u\n"
                + "on b.bookingBy = u.id\n"
                + "where b.bookingBy = ?";
        try (Connection connection = new DBContext().connection) {
            ps = connection.prepareStatement(sql);
            ps.setInt(1, idUser);

            rs = ps.executeQuery();

            while (rs.next()) {
                int idBooking = rs.getInt(1);
                int roomID = rs.getInt(2);
                String roomName = rs.getString(3);
                int userId = rs.getInt(4);
                String username = rs.getString(5);
                Date checkIntDate = rs.getDate(6);
                Date checkOutDate = rs.getDate(7);
                Date bookingDate = rs.getDate(8);
                int quantity = rs.getInt(9);
                int totalPrice = rs.getInt(10);
                int adultAmount = rs.getInt(11);
                int childAmount = rs.getInt(12);
                int status = rs.getInt(13);

                ResponseTrackBookingUser trackBooking = new ResponseTrackBookingUser(idBooking, roomID, roomName, userId,
                        username, checkIntDate, checkOutDate, bookingDate, quantity,
                        GetDataUtils.formatToVietnamCurrency(totalPrice),
                        adultAmount, childAmount, status);

                listTrackBookingUser.add(trackBooking);
            }

        } catch (SQLException e) {
            System.out.println(e.getMessage());
        } finally {
            DBContext.closeResultSetAndStatement(rs, ps);
        }
        return listTrackBookingUser;
    }

    public int findTotalRecordTrackingBooked(int idUser) {
        String sql = "select count(b.id) from Booking b\n"
                + "where b.bookingBy = ?";
        try (Connection connection = new DBContext().connection) {
            ps = connection.prepareStatement(sql);
            ps.setInt(1, idUser);

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

    public List<ResponseTrackBookingUser> findTrackingBookedByPage(int page, int idUser) {
        String sql = "select b.id, b.room_id, r.[name] as room_name, u.id as idUser, u.username, \n"
                + "b.check_in_date, b.check_out_date, b.booking_date, b.quantity, \n"
                + "b.totalPrice, r.adultAmount, r.childAmount, b.[status] from Booking b\n"
                + "join Room r\n"
                + "on b.room_id = r.rid\n"
                + "join Users u\n"
                + "on b.bookingBy = u.id\n"
                + "where b.bookingBy = ?\n"
                + "ORDER BY b.id desc\n"
                + "OFFSET ? ROWS\n"
                + "FETCH NEXT ? ROWS ONLY";
        try (Connection connection = new DBContext().connection) {
            ps = connection.prepareStatement(sql);
            ps.setInt(1, idUser);
            ps.setInt(2, (page - 1) * RECORD_PER_PAGE);
            ps.setInt(3, RECORD_PER_PAGE);

            rs = ps.executeQuery();

            while (rs.next()) {
                int idBooking = rs.getInt(1);
                int roomID = rs.getInt(2);
                String roomName = rs.getString(3);
                int userId = rs.getInt(4);
                String username = rs.getString(5);
                Date checkIntDate = rs.getDate(6);
                Date checkOutDate = rs.getDate(7);
                Date bookingDate = rs.getDate(8);
                int quantity = rs.getInt(9);
                int totalPrice = rs.getInt(10);
                int adultAmount = rs.getInt(11);
                int childAmount = rs.getInt(12);
                int status = rs.getInt(13);

                ResponseTrackBookingUser trackBooking = new ResponseTrackBookingUser(idBooking, roomID, roomName, userId,
                        username, checkIntDate, checkOutDate, bookingDate, quantity,
                        GetDataUtils.formatToVietnamCurrency(totalPrice),
                        adultAmount, childAmount, status);

                listTrackBookingUser.add(trackBooking);
            }

        } catch (SQLException e) {
            System.out.println(e.getMessage());
        } finally {
            DBContext.closeResultSetAndStatement(rs, ps);
        }
        return listTrackBookingUser;
    }

}
