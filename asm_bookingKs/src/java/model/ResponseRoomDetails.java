/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author TNO
 */
public class ResponseRoomDetails extends ResponseRoom {

    private String address;
    private String phone;
    private int rating;

    public ResponseRoomDetails() {
    }

    public ResponseRoomDetails(String address, String phone, int rating) {
        this.address = address;
        this.phone = phone;
        this.rating = rating;
    }

    public ResponseRoomDetails(String address, String phone, int rating, int rid, int hotel_id, String name, String description, String price, boolean status, String hotelName, int adultAmount, int childAmount, String thumbnail, int amountRoom) {
        super(rid, hotel_id, name, description, price, status, hotelName, adultAmount, childAmount, thumbnail, amountRoom);
        this.address = address;
        this.phone = phone;
        this.rating = rating;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public int getRating() {
        return rating;
    }

    public void setRating(int rating) {
        this.rating = rating;
    }

    @Override
    public String toString() {
        return "ResponseRoomDetails{" + "address=" + address + ", phone=" + phone + ", rating=" + rating + '}';
    }
    
}
