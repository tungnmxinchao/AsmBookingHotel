/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author TNO
 */
public class RoomImage {
    private int id;
    private String image;
    private int roomID;

    public RoomImage() {
    }

    public RoomImage(int id, String image, int roomID) {
        this.id = id;
        this.image = image;
        this.roomID = roomID;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }

    public int getRoomID() {
        return roomID;
    }

    public void setRoomID(int roomID) {
        this.roomID = roomID;
    }

    @Override
    public String toString() {
        return "RoomImage{" + "id=" + id + ", image=" + image + ", roomID=" + roomID + '}';
    }
    
    
}
