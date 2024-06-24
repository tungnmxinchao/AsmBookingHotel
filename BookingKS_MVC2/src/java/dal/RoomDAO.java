/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import static constant.constant.RECORD_PER_PAGE;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import model.Hotel;
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
    private List<Hotel> listHotel;

    public RoomDAO() {
        listRoom = new ArrayList<>();
        imageRoom = new ArrayList<>();
        listTrackBookingUser = new ArrayList<>();
        listHotel = new ArrayList<>();
    }

    public int findTotalRecord(int statusInput) {
        String sql = "select count(r.rid) from Room r\n"
                + "where r.[status] = ?";
        try ( Connection connection = new DBContext().connection) {
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
        try ( Connection connection = new DBContext().connection) {
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
        try ( Connection connection = new DBContext().connection) {
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

        try ( Connection connection = new DBContext().connection) {
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

    public int numberImageOfRoomID(int idRoom) {
        String sql = "select count(ri.id) from RoomImage ri\n"
                + "where ri.room_id = ?";
        try ( Connection connection = new DBContext().connection) {
            ps = connection.prepareStatement(sql);
            ps.setInt(1, idRoom);

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

    public boolean insertBookingRoom(int roomID, int idUser, String checkinDate,
            String checkoutDate, int numberAdults, int numberChild,
            int numberRoom, int totalPice, String bookingDate) {
        String sql = "INSERT INTO [dbo].[Booking]\n"
                + "           ([room_id], [bookingBy], [check_in_date], [check_out_date], [booking_date], [quantity], [totalPrice], [status])\n"
                + "     VALUES (?, ?, ?, ?, ?, ?, ?, ?)";
        try ( Connection connection = new DBContext().connection) {
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

    public ResponseTrackBookingUser findBookingRoomByID(int idBookingInput) {
        String sql = "select b.id, b.room_id, r.[name] as room_name, u.id as idUser, u.username, \n"
                + "b.check_in_date, b.check_out_date, b.booking_date, b.quantity, \n"
                + "b.totalPrice, r.adultAmount, r.childAmount, b.[status] from Booking b\n"
                + "join Room r\n"
                + "on b.room_id = r.rid\n"
                + "join Users u\n"
                + "on b.bookingBy = u.id\n"
                + "where b.id = ?";
        ResponseTrackBookingUser trackBooking = null;
        try ( Connection connection = new DBContext().connection) {
            ps = connection.prepareStatement(sql);
            ps.setInt(1, idBookingInput);

            rs = ps.executeQuery();

            if (rs.next()) {
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

                trackBooking = new ResponseTrackBookingUser(idBooking, roomID, roomName, userId,
                        username, checkIntDate, checkOutDate, bookingDate, quantity,
                        GetDataUtils.formatToVietnamCurrency(totalPrice),
                        adultAmount, childAmount, status);

            }

        } catch (SQLException e) {
            System.out.println(e.getMessage());
        } finally {
            DBContext.closeResultSetAndStatement(rs, ps);
        }
        return trackBooking;
    }

    public int findTotalRecordTrackingBooked(int idUser, int adminMode, int status) {
        String sql = "";
        if (adminMode == 1) {
            sql = "select count(b.id) from Booking b\n"
                    + "where b.[status] = ?";
        } else {
            sql = "select count(b.id) from Booking b\n"
                    + "where b.bookingBy = ?";
        }

        try ( Connection connection = new DBContext().connection) {
            ps = connection.prepareStatement(sql);
            if (adminMode == 1) {
                ps.setInt(1, status);
            } else {
                ps.setInt(1, idUser);
            }
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

    public List<ResponseTrackBookingUser> findTrackingBookedByPage(int page, int idUser, int adminMode, int statusInput) {
        String sql = "";
        if (adminMode == 1) {
            sql = "select b.id, b.room_id, r.[name] as room_name, u.id as idUser, u.username, \n"
                    + "b.check_in_date, b.check_out_date, b.booking_date, b.quantity, \n"
                    + "b.totalPrice, r.adultAmount, r.childAmount, b.[status] from Booking b\n"
                    + "join Room r\n"
                    + "on b.room_id = r.rid\n"
                    + "join Users u\n"
                    + "on b.bookingBy = u.id\n"
                    + "where b.[status] = ?\n"
                    + "ORDER BY b.id desc\n"
                    + "OFFSET ? ROWS\n"
                    + "FETCH NEXT ? ROWS ONLY";
        } else {
            sql = "select b.id, b.room_id, r.[name] as room_name, u.id as idUser, u.username, \n"
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
        }

        try ( Connection connection = new DBContext().connection) {
            ps = connection.prepareStatement(sql);

            if (adminMode == 1) {
                ps.setInt(1, statusInput);
            } else {
                ps.setInt(1, idUser);
            }

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

    public boolean updateStatusBooking(int status, int idBooking) {
        String sql = "UPDATE [dbo].[Booking]\n"
                + "SET [status] = ?\n"
                + "WHERE [id] = ?";
        try ( Connection connection = new DBContext().connection) {
            ps = connection.prepareStatement(sql);
            ps.setInt(1, status);
            ps.setInt(2, idBooking);

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

    public boolean updateAmountRoom(int roomID, int amountRoomUpdate) {
        String sql = "UPDATE [dbo].[Room]\n"
                + "SET [amountRoom] = ?\n"
                + "WHERE [rid] = ?";
        try ( Connection connection = new DBContext().connection) {
            ps = connection.prepareStatement(sql);
            ps.setInt(1, amountRoomUpdate);
            ps.setInt(2, roomID);

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

    public boolean updateStatusRoom(int status, int idRoom) {
        String sql = "UPDATE [dbo].[Room]\n"
                + "   SET [status] = ?\n"
                + " WHERE [rid] = ?";
        try ( Connection connection = new DBContext().connection) {
            ps = connection.prepareStatement(sql);
            ps.setInt(1, status);
            ps.setInt(2, idRoom);

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

    public List<Hotel> findAllHotel() {
        String sql = "select * from Hotel";
        try ( Connection connection = new DBContext().connection) {
            ps = connection.prepareStatement(sql);

            rs = ps.executeQuery();

            while (rs.next()) {
                int id = rs.getInt(1);
                String image = rs.getString(2);
                String hotelName = rs.getString(3);
                String address = rs.getString(4);
                String phoneNum = rs.getString(5);
                int rating = rs.getInt(6);

                Hotel hotel = new Hotel(id, image, hotelName, address, phoneNum, rating);

                listHotel.add(hotel);
            }
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        } finally {
            DBContext.closeResultSetAndStatement(rs, ps);
        }

        return listHotel;
    }

    public boolean insertRoom(int idHotel, String name, String description, int price,
            int status, int adultAmount, int childAmount, int amountRoom, String thumbnailRoom, List<String> imageRooms) {
        String sql = "INSERT INTO [dbo].[Room]\n"
                + "           ([hotel_id]\n"
                + "           ,[name]\n"
                + "           ,[description]\n"
                + "           ,[price]\n"
                + "           ,[status]\n"
                + "           ,[adultAmount]\n"
                + "           ,[childAmount]\n"
                + "           ,[thumbnail]\n"
                + "           ,[amountRoom])\n"
                + "     VALUES\n"
                + "           (?, ?, ?, ?, ?, ?, ?, ?, ?);";

        String sqlInsertRoomImage = "INSERT INTO [dbo].[RoomImage]\n"
                + "           ([image]\n"
                + "           ,[room_id])\n"
                + "     VALUES\n"
                + "           (?, ?);";

        String msg = "";

        try ( Connection connection = new DBContext().connection) {
            ps = connection.prepareStatement(sql, ps.RETURN_GENERATED_KEYS);
            ps.setInt(1, idHotel);
            ps.setString(2, name);
            ps.setString(3, description);
            ps.setInt(4, price);
            ps.setInt(5, status);
            ps.setInt(6, adultAmount);
            ps.setInt(7, childAmount);
            ps.setString(8, thumbnailRoom);
            ps.setInt(9, amountRoom);

            int rowAffected = ps.executeUpdate();

            try ( ResultSet generatedKeys = ps.getGeneratedKeys()) {
                if (generatedKeys.next()) {
                    int roomID = generatedKeys.getInt(1);
                    for (int i = 0; i < imageRooms.size(); i++) {
                        ps = connection.prepareStatement(sqlInsertRoomImage);
                        ps.setString(1, imageRooms.get(i));
                        ps.setInt(2, roomID);

                        int rowImagessAfected = ps.executeUpdate();
                        if (rowImagessAfected > 0) {
                            msg = "add order details successfully";
                        } else {
                            msg = "add order details failed";
                        }
                    }

                }
            }
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

    public boolean updateRoom(int idHotel, String name, String description, int price,
            int status, int adultAmount, int childAmount, int amountRoom, String thumbnailRoom,
            int updateMode, int roomID) {

        String sql = "";

        switch (updateMode) {
            case 1:
                sql = "UPDATE [dbo].[Room]\n"
                        + "   SET [hotel_id] = ?\n"
                        + "      ,[name] = ?\n"
                        + "      ,[description] = ?\n"
                        + "      ,[price] = ?\n"
                        + "      ,[status] = ?\n"
                        + "      ,[adultAmount] = ?\n"
                        + "      ,[childAmount] = ?\n"
                        + "      ,[amountRoom] = ?\n"
                        + " WHERE rid = ?";
                break;
            case 2:
                sql = "UPDATE [dbo].[Room]\n"
                        + "   SET [hotel_id] = ?\n"
                        + "      ,[name] = ?\n"
                        + "      ,[description] = ?\n"
                        + "      ,[price] = ?\n"
                        + "      ,[status] = ?\n"
                        + "      ,[adultAmount] = ?\n"
                        + "      ,[childAmount] = ?\n"
                        + "      ,[thumbnail] = ?\n"
                        + "      ,[amountRoom] = ?\n"
                        + " WHERE rid = ?";
                break;
            default:
                throw new AssertionError();
        }

        try ( Connection connection = new DBContext().connection) {
            ps = connection.prepareStatement(sql);

            ps.setInt(1, idHotel);
            ps.setString(2, name);
            ps.setString(3, description);
            ps.setInt(4, price);
            ps.setInt(5, status);
            ps.setInt(6, adultAmount);
            ps.setInt(7, childAmount);

            switch (updateMode) {
                case 1:
                    ps.setInt(8, amountRoom);
                    ps.setInt(9, roomID);
                    break;
                case 2:
                    ps.setString(8, thumbnailRoom);
                    ps.setInt(9, amountRoom);
                    ps.setInt(10, roomID);
                    break;
                default:
                    throw new AssertionError();
            }

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

    public boolean updateImageByID(int idRoomImage, String imageRoom, int roomID) {
        String sql = "UPDATE [dbo].[RoomImage]\n"
                + "   SET [image] = ?\n"
                + "      ,[room_id] = ?\n"
                + " WHERE [id] = ?";
        try ( Connection connection = new DBContext().connection) {
            ps = connection.prepareStatement(sql);

            ps.setString(1, imageRoom);
            ps.setInt(2, roomID);
            ps.setInt(3, idRoomImage);

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

}
