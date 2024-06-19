/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author TNO
 */
public class Room {
    private int rid;
    private int hotel_id;
    private String name;
    private String description;
    private int price;
    private boolean status;
    private int adultAmount;
    private int childAmount;
    private String thumbnail;

    public Room() {
    }

    public Room(int rid, int hotel_id, String name, String description, int price, boolean status, int adultAmount, int childAmount, String thumbnail) {
        this.rid = rid;
        this.hotel_id = hotel_id;
        this.name = name;
        this.description = description;
        this.price = price;
        this.status = status;
        this.adultAmount = adultAmount;
        this.childAmount = childAmount;
        this.thumbnail = thumbnail;
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

    public int getPrice() {
        return price;
    }

    public void setPrice(int price) {
        this.price = price;
    }

    public boolean isStatus() {
        return status;
    }

    public void setStatus(boolean status) {
        this.status = status;
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

    @Override
    public String toString() {
        StringBuilder sb = new StringBuilder();
        sb.append("Room{");
        sb.append("rid=").append(rid);
        sb.append(", hotel_id=").append(hotel_id);
        sb.append(", name=").append(name);
        sb.append(", description=").append(description);
        sb.append(", price=").append(price);
        sb.append(", status=").append(status);
        sb.append(", adultAmount=").append(adultAmount);
        sb.append(", childAmount=").append(childAmount);
        sb.append(", thumbnail=").append(thumbnail);
        sb.append('}');
        return sb.toString();
    }

    
}
