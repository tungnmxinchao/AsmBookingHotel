/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author TNO
 */
public class Users {
    
    private int id;
    private String username;
    private String pass;
    private String fullName;
    private String email;
    private boolean gender;
    private String phone;
    private String address;
    private int role;
    private boolean status;

    public Users() {
    }

    public Users(int id, String username, String pass, String fullName, String email, boolean gender, String phone, String address, int role, boolean status) {
        this.id = id;
        this.username = username;
        this.pass = pass;
        this.fullName = fullName;
        this.email = email;
        this.gender = gender;
        this.phone = phone;
        this.address = address;
        this.role = role;
        this.status = status;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPass() {
        return pass;
    }

    public void setPass(String pass) {
        this.pass = pass;
    }

    public String getFullName() {
        return fullName;
    }

    public void setFullName(String fullName) {
        this.fullName = fullName;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public boolean isGender() {
        return gender;
    }

    public void setGender(boolean gender) {
        this.gender = gender;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public int getRole() {
        return role;
    }

    public void setRole(int role) {
        this.role = role;
    }

    public boolean isStatus() {
        return status;
    }

    public void setStatus(boolean status) {
        this.status = status;
    }

    @Override
    public String toString() {
        return "Users{" + "id=" + id + ", username=" + username + ", pass=" + pass + ", fullName=" + fullName + ", email=" + email + ", gender=" + gender + ", phone=" + phone + ", address=" + address + ", role=" + role + ", status=" + status + '}';
    }
    
    
    
    
}
