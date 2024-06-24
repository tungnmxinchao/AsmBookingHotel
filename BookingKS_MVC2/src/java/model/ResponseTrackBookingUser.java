/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;
import java.sql.Date;
/**
 *
 * @author TNO
 */
public class ResponseTrackBookingUser {
    private int id;
    private int roomId;
    private String roomName;
    private int idUser;
    private String username;
    private Date dateCheckIn;
    private Date dateCheckOut;
    private Date bookingDate;
    private int quantity;
    private String totalPrice;
    private int adultAmount;
    private int childAmount;
    private int status;

    public ResponseTrackBookingUser() {
    }

    public ResponseTrackBookingUser(int id, int roomId, String roomName, int idUser, String username, Date dateCheckIn, Date dateCheckOut, Date bookingDate, int quantity, String totalPrice, int adultAmount, int childAmount, int status) {
        this.id = id;
        this.roomId = roomId;
        this.roomName = roomName;
        this.idUser = idUser;
        this.username = username;
        this.dateCheckIn = dateCheckIn;
        this.dateCheckOut = dateCheckOut;
        this.bookingDate = bookingDate;
        this.quantity = quantity;
        this.totalPrice = totalPrice;
        this.adultAmount = adultAmount;
        this.childAmount = childAmount;
        this.status = status;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getRoomId() {
        return roomId;
    }

    public void setRoomId(int roomId) {
        this.roomId = roomId;
    }

    public String getRoomName() {
        return roomName;
    }

    public void setRoomName(String roomName) {
        this.roomName = roomName;
    }

    public int getIdUser() {
        return idUser;
    }

    public void setIdUser(int idUser) {
        this.idUser = idUser;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public Date getDateCheckIn() {
        return dateCheckIn;
    }

    public void setDateCheckIn(Date dateCheckIn) {
        this.dateCheckIn = dateCheckIn;
    }

    public Date getDateCheckOut() {
        return dateCheckOut;
    }

    public void setDateCheckOut(Date dateCheckOut) {
        this.dateCheckOut = dateCheckOut;
    }

    public Date getBookingDate() {
        return bookingDate;
    }

    public void setBookingDate(Date bookingDate) {
        this.bookingDate = bookingDate;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public String getTotalPrice() {
        return totalPrice;
    }

    public void setTotalPrice(String totalPrice) {
        this.totalPrice = totalPrice;
    }

    public int getAdultAmount() {
        return adultAmount;
    }

    public void setAdultAmount(int adultAmount) {
        this.adultAmount = adultAmount;
    }

    public int getChildAmount() {
        return childAmount;
    }

    public void setChildAmount(int childAmount) {
        this.childAmount = childAmount;
    }

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }

    @Override
    public String toString() {
        return "ResponseTrackBookingUser{" + "id=" + id + ", roomId=" + roomId + ", roomName=" + roomName + ", idUser=" + idUser + ", username=" + username + ", dateCheckIn=" + dateCheckIn + ", dateCheckOut=" + dateCheckOut + ", bookingDate=" + bookingDate + ", quantity=" + quantity + ", totalPrice=" + totalPrice + ", adultAmount=" + adultAmount + ", childAmount=" + childAmount + ", status=" + status + '}';
    }

   
}
