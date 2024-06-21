/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author TNO
 */
public class ResponseRoom {

    private int rid;
    private int hotel_id;
    private String name;
    private String description;
    private String price;
    private boolean status;
    private String hotelName;
    private int adultAmount;
    private int childAmount;
    private String thumbnail;
    private int amountRoom;

    public ResponseRoom() {
    }

    public ResponseRoom(int rid, int hotel_id, String name, String description, String price, boolean status, String hotelName, int adultAmount, int childAmount, String thumbnail, int amountRoom) {
        this.rid = rid;
        this.hotel_id = hotel_id;
        this.name = name;
        this.description = description;
        this.price = price;
        this.status = status;
        this.hotelName = hotelName;
        this.adultAmount = adultAmount;
        this.childAmount = childAmount;
        this.thumbnail = thumbnail;
        this.amountRoom = amountRoom;
    }

    public int getRid() {
        return rid;
    }

    public void setRid(int rid) {
        this.rid = rid;
    }

    public int getHotel_id() {
        return hotel_id;
    }

    public void setHotel_id(int hotel_id) {
        this.hotel_id = hotel_id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getPrice() {
        return price;
    }

    public void setPrice(String price) {
        this.price = price;
    }

    public boolean isStatus() {
        return status;
    }

    public void setStatus(boolean status) {
        this.status = status;
    }

    public String getHotelName() {
        return hotelName;
    }

    public void setHotelName(String hotelName) {
        this.hotelName = hotelName;
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

    public String getThumbnail() {
        return thumbnail;
    }

    public void setThumbnail(String thumbnail) {
        this.thumbnail = thumbnail;
    }

    public int getAmountRoom() {
        return amountRoom;
    }

    public void setAmountRoom(int amountRoom) {
        this.amountRoom = amountRoom;
    }

    @Override
    public String toString() {
        return "ResponseRoom{" + "rid=" + rid + ", hotel_id=" + hotel_id + ", name=" + name + ", description=" + description + ", price=" + price + ", status=" + status + ", hotelName=" + hotelName + ", adultAmount=" + adultAmount + ", childAmount=" + childAmount + ", thumbnail=" + thumbnail + ", amountRoom=" + amountRoom + '}';
    }

    
   
    
}
