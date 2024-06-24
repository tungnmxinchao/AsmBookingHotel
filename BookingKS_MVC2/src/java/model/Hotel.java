/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author TNO
 */
public class Hotel {
    private int id;
    private String image;
    private String name;
    private String address;
    private String phone_number;
    private int rating;

    public Hotel() {
    }

    public Hotel(int id, String image, String name, String address, String phone_number, int rating) {
        this.id = id;
        this.image = image;
        this.name = name;
        this.address = address;
        this.phone_number = phone_number;
        this.rating = rating;
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

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getPhone_number() {
        return phone_number;
    }

    public void setPhone_number(String phone_number) {
        this.phone_number = phone_number;
    }

    public int getRating() {
        return rating;
    }

    public void setRating(int rating) {
        this.rating = rating;
    }

    @Override
    public String toString() {
        return "Hotel{" + "id=" + id + ", image=" + image + ", name=" + name + ", address=" + address + ", phone_number=" + phone_number + ", rating=" + rating + '}';
    }
    
    
}
