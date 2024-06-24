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
    private float price;
    private boolean status;

    public Room() {
    }

    public Room(int rid, int hotel_id, String name, String description, float price, boolean status) {
        this.rid = rid;
        this.hotel_id = hotel_id;
        this.name = name;
        this.description = description;
        this.price = price;
        this.status = status;
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

    public float getPrice() {
        return price;
    }

    public void setPrice(float price) {
        this.price = price;
    }

    public boolean isStatus() {
        return status;
    }

    public void setStatus(boolean status) {
        this.status = status;
    }
    

    @Override
    public String toString() {
        return "Room{" + "rid=" + rid + ", hotel_id=" + hotel_id + ", name=" + name + ", description=" + description + ", price=" + price + ", status=" + status + '}';
    }
    
    
    
}
